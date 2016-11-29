//: ## 函数参数名称
//: - 函数参数都有一个外部参数名（external parameter name）和一个局部参数名（local parameter name）。
//: - 局部参数名: 在函数的实现内部使用。
//: - 外部参数名: 用于在函数调用时标注传递给函数的参数.
//: ---
//: ### 局部参数名
func sample(_ number: Int) {
    print(number)
}
//以上实例中 number 为局部参数名，只能在函数体内使用。
sample(1)
sample(2)
sample(3)
//: ---
//: ### 外部参数名
//:> 你可以在`局部参数名`前指定`外部参数名`，中间以(空格)分隔，外部参数名用于在函数调用时传递给函数的参数。
//如下你可以定义以下两个函数参数名并调用它：
func pow(firstArg a: Int, secondArg b: Int) -> Int {
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    print(res)
    return res
}
pow(firstArg:5, secondArg:3)

//以上程序执行输出结果为：
//125

//:> 注意:如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名。
//: ---
//: ### 默认参数值（Default Parameter Values）
//: - 你可以在函数体中为每个参数定义默认值（Deafult Values）。当默认值被定义后，调用这个函数时可以忽略这个参数。

func someFunction(_ parameterWithDefault: Int = 12) {
    // 函数体
    // if no arguments are passed to the function call,
    // parameterWithDefault 值为: 12
}
someFunction(6) // parameterWithDefault 值为: 6
someFunction() // parameterWithDefault 值为: 12

//:> 注意: 将带有默认值的参数放在函数参数列表的最后。这样可以保证在函数调用时，非默认参数的顺序是一致的，同时使得相同的函数在不同情况下调用时显得更为清晰。

//: ---
//: ### 可变参数
//: - 可变参数（Variadic Parameters）
//: 一个可变参数（variadic parameter）可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数. 可以被传入不确定数量的输入值。通过在变量类型名后面加入（...）的方式来定义可变参数。

//: 可变参数的传入值在函数体中变为此类型的一个数组。
//: 例如，一个叫做 `numbers` 的 `Double`... 型可变参数，在函数体内可以当做一个叫 numbers 的 [Double] 型的数组常量。
//下面的这个函数用来计算一组任意长度数字的算术平均数（arithmetic mean）：
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
//返回3.0, 这五个数字的算术平均值

arithmeticMean(3, 8.25, 18.75)
//返回10.0, 这是这三个数的算术平均值
//:> 注意: 一个函数最多只能有一个可变参数。如果函数有一个或多个带默认值的参数，而且还有一个可变参数，那么把可变参数放在参数表的最后。

//: ---
//: ### 输入输出参数（In-Out Parameters）

//: 函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。

//: 定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。想获取更多的关于输入输出参数的细节和相关的编译器优化，请查看输入输出参数一节。

//: 你只能传递变量给输入输出参数。你不能传入常量或者字面量（literal value），因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改。

//: 注意:输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
//下面是例子，swapTwoInts(_:_:) 函数，有两个分别叫做 a 和 b 的输入输出参数：
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//这个 swapTwoInts(_:_:) 函数简单地交换 a 与 b 的值。该函数先将 a 的值存到一个临时常量 temporaryA 中，然后将 b 的值赋给 a，最后将 temporaryA 赋值给 b。

//你可以用两个 Int 型的变量来调用 swapTwoInts(_:_:)。需要注意的是，someInt 和 anotherInt 在传入 swapTwoInts(_:_:) 函数前，都加了 & 的前缀：

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// 打印 "someInt is now 107, and anotherInt is now 3"
//: 从上面这个例子中，我们可以看到 `someInt` 和 `anotherInt` 的原始值在 `swapTwoInts(_:_:)` 函数中被修改，尽管它们的定义在函数体外。

//:> 注意: 输入输出参数和返回值是不一样的。上面的 `swapTwoInts` 函数并没有定义任何返回值，但仍然修改了 `someInt` 和 `anotherInt` 的值。输入输出参数是函数对函数体外产生影响的另一种方式。


//: [后退](@previous) | [函数类型](@next)
