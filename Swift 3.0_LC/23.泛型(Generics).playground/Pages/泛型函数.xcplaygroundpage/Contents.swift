//: ## 泛型函数
//: 泛型函数可以适用于任何类型，下面的 swapTwoValues(_:_:) 函数是上面三个函数的泛型版本：
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//: `swapTwoValues(_:_:)` 的函数主体和 `swapTwoInts(_:_:)` 函数是一样的，它们只在第一行有点不同，如下所示：
//func swapTwoInts(_ a: inout Int, _ b: inout Int)
//func swapTwoValues<T>(_ a: inout T, _ b: inout T)
/*:
//: - 这个函数的泛型版本使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 `Int、String 或 Double`）。
占位类型名没有指明 T 必须是什么类型，但是它指明了 a 和 b 必须是同一类型 T，无论 T 代表什么类型。
只有 `swapTwoValues(_:_:)` 函数在调用时，才能根据所传入的实际类型决定 T 所代表的类型。

//: - 另外一个不同之处在于这个泛型函数名`（swapTwoValues(_:_:)）`后面跟着占位类型名（T），并用尖括号括起来`（<T>）`。这个尖括号告诉 Swift 那个 T 是 `swapTwoValues(_:_:)` 函数定义内的一个占位类型名，因此 Swift 不会去查找名为 T 的实际类型。

//: - `swapTwoValues(_:_:)` 函数现在可以像 `swapTwoInts(_:_:)` 那样调用，不同的是它能接受两个任意类型的值，条件是这两个值有着相同的类型。`swapTwoValues(_:_:)` 函数被调用时，T 所代表的类型都会由传入的值的类型推断出来。
*/
//在下面的两个例子中，T被推断为Int与String分别为：
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"
//:> 注意: 上面定义的 `swapTwoValues(_:_:)` 函数是受 `swap(_:_:)` 函数启发而实现的。后者存在于 `Swift` 标准库，你可以在你的应用程序中使用它。如果你在代码中需要类似 `swapTwoValues(_:_:)` 函数的功能，你可以使用已存在的 `swap(_:_:)` 函数。

//: [上一页](@previous) | [下一页](@next)

