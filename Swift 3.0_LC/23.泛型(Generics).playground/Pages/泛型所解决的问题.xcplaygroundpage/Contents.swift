//: ## 泛型所解决的问题
//: - 下面是一个标准的非泛型函数 `swapTwoInts(_:_:)`，用来交换两个 `Int` 值：
//: - 这个函数使用输入输出参数`（inout）`来交换 `a` 和 `b` 的值，请参考输入输出参数。

//: `swapTwoInts(_:_:)` 函数交换 `b` 的原始值到 `a`，并交换 `a` 的原始值到 `b`。你可以调用这个函数交换两个 `Int` 变量的值：
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// 打印 “someInt is now 107, and anotherInt is now 3”
//: `swapTwoInts(_:_:)` 函数挺有用，但是它只能交换 `Int` 值，如果你想要交换两个 `String` 值或者 `Double`值，就不得不写更多的函数，例如 `swapTwoStrings(_:_:)` 和 `swapTwoDoubles(_:_:)`
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//: 你可能注意到 `swapTwoInts(_:_:)`、`swapTwoStrings(_:_:)` 和 `swapTwoDoubles(_:_:)` 的函数功能都是相同的，唯一不同之处就在于传入的变量类型不同，分别是 `Int`、`String` 和 `Double`。

//: 通常需要一个更实用更灵活的函数来交换两个任意类型的值，幸运的是，泛型代码帮你解决了这种问题。（这些函数的泛型版本已经在下面定义好了。）

//:>注意: 在上面三个函数中，a 和 b 类型相同。如果 a 和 b 类型不同，那它们俩就不能互换值。Swift 是类型安全的语言，所以它不允许一个 String 类型的变量和一个 Double 类型的变量互换值。试图这样做将导致编译错误。

//: [上一页](@previous) | [下一页](@next)
