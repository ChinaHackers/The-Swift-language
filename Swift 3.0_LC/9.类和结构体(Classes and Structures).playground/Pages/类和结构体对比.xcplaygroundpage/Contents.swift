//: [后退](@previous)

//: - 类和结构体对比

//: - Swift 中类和结构体有很多共同点。共同处在于：
//: - 定义属性用于存储值
//: - 定义方法用于提供功能
//: - 定义附属脚本用于访问值
//: - 定义构造器用于生成初始化值
//: - 通过扩展以增加默认实现的功能
//: - 实现协议以提供某种标准功能

//: - 与结构体相比，类还有如下的附加功能：
//: - 继承允许一个类继承另一个类的特征
//: - 类型转换允许在运行时检查和解释一个类实例的类型
//: - 析构器允许一个类实例释放任何其所被分配的资源
//: - 引用计数允许对一个类的多次引用
// 类和结构体有着类似的定义方法，通过class和struct关键字来定义
// 每定义一个新的类和结构体，实际上定义了一个新的Swift类型，因此请使用首字母大写为 类 或 结构体 命名,以便符合标准 Swift 类型的大写命名风格!

//: ---
//: - 定义语法
//: - 定义结构体示例:
//定义了一个名为Resolution的结构体, 这个结构体包含了两个名为width和height的存储属性。
//存储属性是 被捆绑和存储在类或结构体中的常量或变量。当这两个属性被初始化为整数0的时候，它们会被推断为Int类型。
struct Resolution {
    var width = 0
    var height = 0
}
//: - 定义类示例:
//定义了一个名为 VideoMode 的类，这个类包含了四个变量存储属性。
//第一个是resolution，它被初始化为一个新的Resolution结构体的实例，属性类型被推断为Resolution。

// VideoMode 实例同时初始化其它三个属性，

// 初始值为 false 的 interlaced,
// 初始值为 0.0 的 frameRate
// 值为 可选String 的 name

//name属性会被自动赋予一个默认值nil，意为“没有name值”，因为它是一个可选类型
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: ---
//: - 类和结构体实例
// 生成结构体和类实例的语法非常相似：
// 使用默认构造函数创建实例，其属性值会被初始化为默认值
let someResolution = Resolution()
let someVideoMode = VideoMode()
//: ---
//: - 属性访问
// 通过使用点语法（dot syntax), 访问实例的属性。其语法规则是，实例名后面紧跟属性名，两者通过点号(.)连接：
// 访问实例中的属性，为属性赋值

print("The width of someResolution is \(someResolution.width)")
// someResolution.width 引用 someResolution 的 width 属性，返回width的初始值0。

// 访问子属性，如VideoMode中Resolution属性的width属性：
// 使用点语法为变量属性赋值
someVideoMode.resolution.width = 1280

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//: ---

//: - 结构体类型的成员逐一构造器（Memberwise Initializers for Structure Types）
// 所有结构体都会自动生成成员逐一构造器，类实例没有默认的成员逐一构造器
let vga = Resolution(width: 640, height: 480)


//: [结构体和枚举是值类型](@next)
