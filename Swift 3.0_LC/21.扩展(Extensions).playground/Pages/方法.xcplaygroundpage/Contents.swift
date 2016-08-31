//: ## 方法（Methods）
//: 扩展可以向已有类型添加新的实例方法和类型方法。下面的例子向`Int`类型添加一个名为`repetitions`的新实例方法：
extension Int {
    func repetitions(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}
//: - repetitions(task:) 方法接收一个 () -> Void 类型的单一实际参数，它表示一个没有参数且无返回值的函数。
//: - 在这个扩展定义之后，你可以在任何整型数字处调用 repetitions(task:) 方法，以执行相应次数的操作：
3.repetitions(task: {
    print("Hello!")
})
// Hello!
// Hello!
// Hello!


//可以使用 trailing 闭包使调用更加简洁：
3.repetitions{
    print("Goodbye!")
}
// Goodbye!
// Goodbye!
// Goodbye!

//: ### 可变实例方法（Mutating Instance Methods)
//: 通过扩展添加的实例方法也可以修改该实例本身。结构体和枚举类型中修改self或其属性的方法必须将该实例方法标注为mutating，正如来自原始实现的修改方法一样。

//下面的例子为 Swift 的 Int 类型添加了一个新的修改方法 square ，以表示原值的平方：
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt 现在值是 9

//: [上一页](@previous) | [下一页](@next)
