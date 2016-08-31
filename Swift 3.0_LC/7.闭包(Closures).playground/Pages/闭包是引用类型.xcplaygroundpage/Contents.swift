
//: ## 闭包是引用类型

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
let incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()  // 返回的值为7

//: - 上面的例子中，`incrementBySeven`和`incrementByTen`是常量，但是这些常量指向的闭包仍然可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。

//: - 无论您将函数或闭包赋值给一个常量还是变量，您实际上都是将常量或变量的值设置为对应函数或闭包的引用。上面的例子中，指向闭包的引用incrementByTen是一个常量，而并非闭包内容本身。这也意味着如果您将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包：

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// 返回的值为50

//: [上一页](@previous) | [非逃逸闭包](@next)
