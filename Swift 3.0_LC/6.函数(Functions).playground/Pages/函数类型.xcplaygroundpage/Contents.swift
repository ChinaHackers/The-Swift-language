//: ## 函数类型（Function Types）
//: - 每个函数都有种特定的函数类型，由函数的参数类型和返回类型组成。
//:---
//: 这个例子中定义了 `inputs` 函数, 这个函数接受两个 `Int` 值， 返回一个`Int`值。
//: 这个函数的类型是 `(Int, Int) -> Int`，可以解读为“这个函数类型有两个 `Int` 型的参数并返回一个 `Int` 型的值.
func inputs(no1: Int, no2: Int) -> Int {
    return no1/no2
}
print(inputs(no1: 20,no2:10))
print(inputs(no1: 36,no2:6))

//一个没有形式参数和返回值的函数。
func printHelloWorld() {
    print("hello, world")
}

//: 这个函数的类型是 () -> Void，或者一个没有形式参数的函数，返回 `Void`。

//: ---
//: ### 使用函数类型
//: 你可以像使用 Swift 中的其他类型一样使用函数类型。
//例如，你可以给一个常量或变量定义一个函数类型，并且为变量指定一个相应的函数。
func sum(a: Int, b: Int) -> Int {
    return a + b
}
var addition: (Int, Int) -> Int = sum

//: - 解析: "定义一个叫做 `addition` 的变量，参数与返回值类型均是 `Int` ，并让这个新变量指向 `sum` 函数"。
//: - inputs 和 addition 有同样的类型，所以以上操作是合法的。现在，你可以用 `addition` 来调用被赋值的函数了
print("输出结果: \(addition(40, 89))")          //输出结果: 129
//: ---
//: ### 函数类型作为参数类型:
//: 你可以利用使用一个函数的类型, 例如 (Int, Int) -> Int 作为其他函数的形式参数类型。这允许你预留函数的部分实现从而让函数的调用者在调用函数的时候提供。

//下面的例子打印出了上文中数学函数执行后的结果：
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("结果: \(mathFunction(a, b))")
}
printMathResult(sum, 3, 5)      // 输出: 结果: 8

/*:
 
这个例子定义了一个叫做 `printMathResult(_:_:_:)` 的函数，它有三个形式参数。第一个形式参数叫做 `mathFunction`，类型是 `(Int, Int) -> Int`。你可以传入任何这个类型的函数作为第一个形式参数的实例参数。第二个和第三个形式参数叫做 `a` 和 `b`，它们都是 `Int`类型。它们被用作提供的数学函数的两个传入值。

但函数 `printMathResult(_:_:_:)`被调用的时候，它传入了 `sum(_:_:)` 函数和两个整数值 3 和 5。它利用 3 和 5的值调用了提供的函数，打印出了结果 8。

函数 `printMathResult(_:_:_:)`的作用: 就是当调用一个相应类型的数学函数的时候打印出结果。它并不关心函数在实现过程中究竟做了些什么，它只关心函数是不是正确的类型。这使得函数 `printMathResult(_:_:_:)` 以一种类型安全的方式把自身的功能传递给调用者。
*/

//: ---
//: ### 函数类型作为返回类型
//: 你可以用函数类型作为另一个函数的返回类型。你需要做的是在返回箭头（->）后写一个完整的函数类型。

//: - 下面的这个例子中定义了两个简单函数，分别是 `stepForward` 和 `stepBackward`
//: - `stepForward` 函数返回一个比输入值大一的值, `stepBackward` 函数返回一个比输入值小一的值。
//: - 这两个函数的类型都是` (Int) -> Int`
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}

//: - 以下 `chooseStepFunction(_:)` 的函数，它的返回类型是` (Int) -> Int `类型的函数。
//: - chooseStepFunction(_:) 根据布尔值 `backwards` 来返回 `stepForward(_:) `函数或 `stepBackward(_:)` 函数：
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

//你现在可以用 chooseStepFunction(_:) 来获得两个函数其中的一个：
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
// moveNearerToZero现在指的是stepBackward()函数

//: 上面这个例子中计算出从 `currentValue` 逐渐接近到0是需要向正数走还是向负数走。
//: `currentValue` 的初始值是3，这意味着 `currentValue > 0` 是真（`true`），这将使得 `chooseStepFunction(_:)` 返回 `stepBackward(_:) `函数。一个指向返回的函数的引用保存在了` moveNearerToZero `常量中。
//现在，moveNearerToZero 指向了正确的函数，它可以被用来数到0：
print("Counting to zero:")          // Counting to zero:

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// 3...
// 2...
// 1...
// zero!


//: [后退](@previous) | [嵌套函数](@next)
