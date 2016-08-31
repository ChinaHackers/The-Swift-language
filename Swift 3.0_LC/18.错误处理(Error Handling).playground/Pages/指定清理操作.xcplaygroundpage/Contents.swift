//: ## 指定清理操作

//: - 使用 `defer`语句来在代码离开当前代码块前执行语句合集。这个语句允许你做任何无论执行如何离开当前代码块都必须要做的清理工作——无论是因为抛出了错误还是因为 `return`或者 `break`这样的语句。比如，你可以使用`defer`语句来保证文件描述符都关闭并且手动指定的内存到被释放。
//: - defer语句延迟执行直到当前范围退出。这个语句由`defer`关键字和需要稍后执行的语句组成。被延迟执行的语句可能不会包含任何会切换控制出语句的代码，比如 `break` 或`return`语句，或者通过抛出一个错误。延迟的操作与其指定的顺序相反执行——就是说，第一个`defer`语句中的代码会在第二个中代码执行完毕后执行，以此类推。
func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
        }
        // close(file) is called here, at the end of the scope.
    }
}

//: 上面的离子使用 `defer`语句来保证 `open(_:)`函数能调用 `close(_:)`。

//:     注意: 就算没有涉及错误处理代码，你也可以使用 defer语句。

//: [上一页](@previous) | [下一页](@next)

