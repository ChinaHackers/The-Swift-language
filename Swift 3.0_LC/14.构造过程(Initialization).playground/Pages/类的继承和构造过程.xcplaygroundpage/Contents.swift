//: ## 类的继承和构造过程
//: Swift 提供了两种类型的类构造器来确保所有类实例中存储型属性都能获得初始值，它们分别是`指定构造器`和`便利构造器`
//: - 指定构造器: 类中最主要的构造器, 初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。便利构造器, 每一个类都必须拥有至少一个指定构造器
/*
init(parameters) {
    语句
}
*/
//: - 便利构造器: 类中比较次要的、辅助型的构造器, 可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。 只在必要的时候为类提供便利构造器
/*
 // 便利构造器也采用相同样式的写法，但需要在 init 关键字之前放置 convenience 关键字，并使用空格将它们俩分开：
convenience init(parameters) {
    statements
}
 */
//: 指定构造器实例
class mainClass {
    var no1 : Int // 局部存储变量
    init(no1 : Int) {
        self.no1 = no1 // 初始化
    }
}
class subClass : mainClass {
    var no2 : Int // 新的子类存储变量
    init(no1 : Int, no2 : Int) {
        self.no2 = no2 // 初始化
        super.init(no1:no1) // 初始化超类
    }
}

let res = mainClass(no1: 10)
let res2 = subClass(no1: 10, no2: 20)

print("res 为: \(res.no1)")
print("res2 为: \(res2.no1)")
print("res2 为: \(res2.no2)")

//以上程序执行输出结果为：
//res 为: 10
//res 为: 10
//res 为: 20

//: 便利构造器实例
class mainClass2 {
    var no1 : Int // 局部存储变量
    init(no1 : Int) {
        self.no1 = no1 // 初始化
    }
}

class subClass2 : mainClass2 {
    var no2 : Int
    init(no1 : Int, no2 : Int) {
        self.no2 = no2
        super.init(no1:no1)
    }
    // 便利方法只需要一个参数
    override convenience init(no1: Int)  {
        self.init(no1:no1, no2:0)
    }
}
let resd = mainClass2(no1: 20)
let res2d = subClass2(no1: 30, no2: 50)

print("res 为: \(resd.no1)")
print("res2 为: \(res2d.no1)")
print("res2 为: \(res2d.no2)")
//以上程序执行输出结果为：
//res 为: 20
//res2 为: 30
//res2 为: 50
//: ---
//: ### 构造器的继承和重载
// Swift 中的子类不会默认继承父类的构造器。
// 父类的构造器仅在确定和安全的情况下被继承。
// 当你重写一个父类指定构造器时，你需要写 override 修饰符。
class SuperClass1 {
    var corners = 4
    var description: String {
        return "\(corners) 边"
    }
}
let rectangle = SuperClass1()
print("矩形: \(rectangle.description)")



class SubC: SuperClass1 {
    override init() {  //重载构造器, 需要写 override 修饰符
        super.init()    //调用 SubC 的父类 SuperClass1 的默认构造器
        corners = 5     // 调用父类SuperClass1 构造器后, 属性 corners 被新值 5 替换
    }
}

let subCl = SubC()
print("五角型: \(subCl.description)")

//以上程序执行输出结果为：
//矩形: 4 边
//五角型: 5 边

//: [上一页](@previous) | [下一页](@next)
