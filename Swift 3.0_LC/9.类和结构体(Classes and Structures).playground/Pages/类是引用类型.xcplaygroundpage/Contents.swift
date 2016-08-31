//: [后退](@previous)

//: - 类是引用类型
//:> 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝。
//定义 VideoMode 类：
class VideoMode {
    
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//: 声明了一个名为` tenEighty `的常量，其引用了一个 `VideoMode`类的新实例。
let tenEighty = VideoMode()

tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// 将 tenEighty 被赋值给名为 alsoTenEighty 的新常量.
// 因为类是引用类型，所以 tenEight 和 alsoTenEight 实际上引用的是相同的 VideoMode 实例。换句话说，它们是同一个实例的两种叫法.

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(alsoTenEighty.frameRate, tenEighty.frameRate)

//:> 注意:  `tenEighty` 和 `alsoTenEighty` 被声明为常量而不是变量。
//:>> 然而你依然可以改变 `tenEighty.frameRate` 和`alsoTenEighty.frameRate`，因为 `tenEighty` 和`alsoTenEighty`这两个常量的值并未改变。它们并不“存储”这个`VideoMode`实例，而仅仅是对` VideoMode`实例的引用。
//:>>> 所以，改变的是被引用的 `VideoMode`的`frameRate`属性，而不是引用` VideoMode `的常量的值。
//: ---
//: - 恒等运算符
//: - 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个类实例。
//: -（对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。）
//: - 如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符：
/*
    等价于（===）
    不等价于（!==）

*/

// 运用这两个运算符检测两个常量或者变量是否引用同一个实例：
class SampleClass {
    let age = 22
    let name = "liu"
}

var Class1 = SampleClass()
let Class2 = Class1

if Class1 === Class2 {
    print(" Class1 和 Class2 相等!")
}

//以上程序执行输出结果为： Class1 和 Class2 相等!
//:> 注意: “等价于”（用三个等号表示，===）与“等于”（用两个等号表示，==）的不同：
//:>> ( 等价于 )表示两个类类型（class type）的常量或者变量引用同一个类实例。
//:>>> ( 等于 )表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
//: ---
//: - 指针

//: 如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。一个引用某个引用类型实例的 Swift 常量或者变量，与 C 语言中的指针类似，但是并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。Swift 中的这些引用与其它的常量或变量的定义方式相同。

//: [类和结构体的选择](@next)
