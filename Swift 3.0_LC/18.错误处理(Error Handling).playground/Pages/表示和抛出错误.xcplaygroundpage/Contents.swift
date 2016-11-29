//: ## 表示和抛出错误
//: 在 Swift 中，错误表示为遵循 `Error` 协议类型的值。这个空的协议明确了一个类型可以用于错误处理。

//: Swift 枚举是典型的为一组相关错误条件建模的完美配适类型，关联值还允许错误错误通讯携带额外的信息。比如说，这是你可能会想到的游戏里自动售货机会遇到的错误条件：
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
//: 抛出一个错误允许你明确某些意外的事情发生了并且正常的执行流不能继续下去。你可以使用 `throw` 语句来抛出一个错误。比如说，下面的代码通过抛出一个错误来明确自动售货机需要五个额外的金币：
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//: [上一页](@previous) | [下一页](@next)
