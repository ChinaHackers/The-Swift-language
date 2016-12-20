//: ## 自动引用计数实践
//:下面的例子展示了自动引用计数的工作机制。例子以一个简单的 `Person` 类开始,并定义了一个叫 `name` 的常量属性:
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
//: `Person` 类有一个构造函数,此构造函数为实例的 `name` 属性赋值,并打印一条消息以表明初始化过程生效。`Person`类也拥有一个析构函数,这个析构函数会在实例被销毁时打印一条消息。

//: 接下来的代码片段定义了三个类型为 `Person?` 的变量,用来按照代码片段中的顺序,为新的 `Person` 实例建立多个 引用。由于这些变量是被定义为可选类型( `Person?` ,而不是 `Person` ),它们的值会被自动初始化为 `nil` ,目 前还不会引用到 `Person` 类的实例。
var reference1: Person?
var reference2: Person?
var reference3: Person?

//现在你可以创建 Person 类的新实例,并且将它赋值给三个变量中的一个:
reference1 = Person(name: "John Appleseed")
// prints "John Appleseed is being initialized”

//:> 注意到当你调用 Person 类的构造函数的时候,"John Appleseed is being initialized”会被打印出来。由此可以确定初始化被执行。

//: 由于 `Person` 类的新实例被赋值给了 `reference1` 变量,所以 `reference1` 到 `Person` 类的新实例之间建立了一个强 引用。正是因为这一个强引用,`ARC` 会保证 `Person` 实例被保持在内存中不被销毁。
//如果你将同一个 Person 实例也赋值给其他两个变量,该实例又会多出两个强引用:
reference2 = reference1
reference3 = reference1
//现在这一个 Person 实例已经有三个强引用了。
//: 如果你通过给其中两个变量赋值 nil 的方式断开两个强引用(包括最先的那个强引用),只留下一个强引用, Person 实例不会被销毁:
reference1 = nil
reference2 = nil

//在你清楚地表明不再使用这个 Person 实例时,即第三个也就是最后一个强引用被断开时,ARC 会销毁它。
reference3 = nil
// prints "John Appleseed is being deinitialized"

//: [上一页](@previous) | [下一页](@next)

