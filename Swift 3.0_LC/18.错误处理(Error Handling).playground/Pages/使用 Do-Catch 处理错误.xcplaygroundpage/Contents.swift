//: ## 使用 Do-Catch 处理错误

//: 使用 do-catch语句来通过运行一段代码处理错误。如果do分句中抛出了一个错误，它就会与 catch分句匹配，以确定其中之一可以处理错误。

//: 这是 do-catch语句的通常使用姿势：
/*
do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}
*/
//: - 在 catch后写一个模式来明确分句可以处理哪个错误。如果一个 catch分句没有模式，这个分句就可以匹配所有错误并且绑定这个错误到本地常量 error上。更多关于模式匹配的信息，见模式。
//: - catch分句没有处理 do分句可能抛出的所有错误。如果没有 catch分句能处理这个错误，那错误就会传递到周围的生效范围当中。总之，错误总得在周围某个范围内被处理。举例来说，接下来的代码处理了 VendingMachineError枚举里的所有三个错误，但其他所有错误得通过范围内其他代码处理：

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
    // Enjoy delicious snack
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// prints "Insufficient funds. Please insert an additional 2 coins."

//: 在上面的栗子当中，函数 buyFavoriteSnack(person:vendingMachine:)在 try表达式中被调用，因为它会抛出错误。如果抛出错误，执行会立即切换到 catch分句，它决定是否传递来继续。如果没有错误抛出， do语句中剩下的语句将会被执行。


//: [上一页](@previous) | [下一页](@next)

