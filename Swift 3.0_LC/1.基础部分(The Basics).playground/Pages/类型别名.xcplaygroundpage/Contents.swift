//: ## 类型别名
//: - 使用 `typealias`关键字定义类型别名，类似`typedef`
//: - 类型别名`（type aliases）`就是给现有类型定义另一个名字。你可以使用`typealias`关键字来定义类型别名。
//: - 当你想要给现有类型起一个更有意义的名字时，类型别名非常有用。假设你正在处理特定长度的外部资源的数据：”

//: `NSInteger` 就是 `Int` 的一个别名。因为这个别名的存在，调用 `NSInteger.min` 实际上是 `Int.min`，所以会给max赋一个初值0.
typealias NSInteger = Int
var max = NSInteger.min

//: [Next](@next)
