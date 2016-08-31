//: ## 转换错误为可选项
//: - 使用 try?通过将错误转换为可选项来处理一个错误。如果一个错误在 try?表达式中抛出，则表达式的值为 nil。比如说下面的代码x和y拥有同样的值和行为：

func someThrowingFunction() throws -> Int {
    // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//: 如果 someThrowingFunction()抛出一个错误， x和 y的值就是 nil。另一方面，x和y的值是函数返回的值。注意 x和 y是可选的无论 someThrowingFunction()返回什么类型，这里函数返回了一个整数，所以x和y是可选整数。

//: 当你想要在同一句里处理所有错误时，使用 try?能让你的错误处理代码更加简洁。比如，下边的代码使用了一些方法来获取数据，或者在所有方式都失败后返回 nil。

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}


//: [上一页](@previous) | [下一页](@next)
