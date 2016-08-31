//: [后退](@previous)

//: - 存储属性
//: - 存储属性就是: 存储在特定`类`或`结构体`的实例里的一个常量或变量.
//: - 存储属性可以是变量存储属性（用关键字var定义），也可以是常量存储属性（用关键字let定义）
//: - 可以在定义存储属性的时候指定默认值
//: - 也可以在构造过程中设置或修改存储属性的值，甚至修改常量存储属性的值
// 定义一个名为 Number 的结构体
struct Number {
    
    var digits: Int
    
    //  pi 在定义存储属性的时候指定默认值（pi = 3.1415），所以不管你什么时候实例化结构体，它都不会改变
    // 如果你定义的是一个常量存储属性，如果尝试修改它就会报错
    let pi = 3.1415
}

var n = Number(digits: 12345)
n.digits = 67

//n.pi = 20   // pi 定义的是一个常量存储属性，如果尝试修改它就会报错

print("\(n.digits)")
print("\(n.pi)")
//以上程序执行输出结果为：67  3.1415

//: ---
//: - 延迟存储属性
//: - 延迟存储属性: 当第一次被调用的时候才会计算其初始值的属性。在属性声明前使用 lazy 来标示一个延迟存储属性。

//:> 注意: 必须 将 延迟存储属性 声明成 变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。

//: - 延迟存储属性一般用于：
//: - 延迟对象的创建。
//: - 当属性的值依赖于其他未知类
class sample {
    //由于使用了 lazy ，no 属性只有在第一次被访问的时候才被创建。比如访问它的属性 name 的时候
    lazy var no = number() // `var` 关键字是必须的
}

class number {
    var name = "Runoob Swift 教程"
}

var firstsample = sample()
print(firstsample.no.name)

//以上程序执行输出结果为：
//Runoob Swift 教程


//: - 存储属性和实例变量
//: - 如果您有过 Objective-C 经验，应该知道 Objective-C 为类实例存储值和引用提供两种方法。除了属性之外，还可以使用实例变量作为属性值的后端存储。
//: - Swift 编程语言中把这些理论统一用属性来实现。Swift 中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息——包括命名、类型和内存管理特征——都在唯一一个地方（类型定义中）定义。

//: [计算属性](@next)
