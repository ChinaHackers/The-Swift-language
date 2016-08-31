//: ## 捕获值（Capturing Values）
//: - 闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
//: - Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。

//: 举个例子，这有一个叫做`makeIncrementor`的函数，其包含了一个叫做`incrementor`的嵌套函数。嵌套函数`incrementor()`从上下文中捕获了两个值，`runningTotal`和`amount`。捕获这些值之后，`makeIncrementor`将`incrementor`作为闭包返回。每次调用`incrementor`时，其会以`amount`作为增量增加`runningTotal`的值。
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}
//: - `makeIncrementor`返回类型为`() -> Int`。这意味着其返回的是一个函数，而不是一个简单类型的值。该函数在每次调用时不接受参数，只返回一个`Int`类型的值。2
//: - `makeIncrementer(forIncrement:)`函数定义了一个初始值为0的整型变量`runningTotal`，用来存储当前跑步总数。该值通过`incrementor`返回。
//: - `makeIncrementer(forIncrement:)`有一个`Int`类型的参数，其外部参数名为`forIncrement`，内部参数名为`amount`，该参数表示每次`incrementor`被调用时`runningTotal`将要增加的量。

//: 嵌套函数`incrementor`用来执行实际的增加操作。该函数简单地使`runningTotal`增加`amount`，并将其返回。
//如果我们单独看这个函数，会发现看上去不同寻常：
//func incrementor() -> Int {
//    runningTotal += amount
//    return runningTotal
//}
/*:
incrementer()函数并没有任何参数，但是在函数体内访问了`runningTotal`和`amount`变量。这是因为它从外围函数捕获了`runningTotal`和`amount`变量的引用。捕获引用保证了`runningTotal`和`amount`变量在调用完`makeIncrementer`后不会消失，并且保证了在下一次执行`incrementer`函数时，`runningTotal`依旧存在。
*/
//:> 注意:为了优化，如果一个值是不可变的，Swift 可能会改为捕获并保存一份对值的拷贝。Swift 也会负责被捕获变量的所有内存管理工作，包括释放不再需要的变量。
//下面是一个使用makeIncrementor的例子：
let incrementByTen = makeIncrementor(forIncrement: 10)
//: 该例子定义了一个叫做`incrementByTen`的常量，该常量指向一个每次调用会将`runningTotal`变量增加10的`incrementor`函数。调用这个函数多次可以得到以下结果：
incrementByTen()    // 返回的值为10
incrementByTen()    // 返回的值为20
incrementByTen()    // 返回的值为30

//如果您创建了另一个incrementor，它会有属于它自己的一个全新、独立的runningTotal变量的引用：
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()  // 返回的值为7
//: 再次调用原来的`incrementByTen`会在原来的变量`runningTotal`上继续增加值，该变量和`incrementBySeven`中捕获的变量没有任何联系：
incrementByTen()    // 返回的值为40
//:> 注意:如果您将闭包赋值给一个类实例的属性，并且该闭包通过访问该实例或其成员而捕获了该实例，您将创建一个在闭包和该实例间的循环强引用。Swift 使用捕获列表来打破这种循环强引用。

//: [下一页](@previous)[上一页](@next)
