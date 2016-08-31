//: ## 错误处理
/*:
 - 你可以使用错误处理（error handling）来应对程序执行中可能会遇到的错误条件。
 - 相对于可选中运用值的存在与缺失来表达函数的成功与失败，错误处理可以推断失败的原因，并传播至程序的其他部分。
 */

//: ---

//: 当一个函数遇到错误条件，它能报错。调用函数的地方能抛出错误消息并合理处理。

//: - 通过在函数声明过程当中加入 `throws` 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预置 `try` 关键字。
//: - `Swift` 会自动将错误传递到它们的生效范围之外，直到它们被 `catch` 分句处理。
//: - `do` 语句创建了一个新的容器范围，可以让错误被传递到到不止一个的 `catch` 分句里。
func canThrowAnError() throws {
    // 这个函数有可能抛出错误
}
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}

/*
//: 下面的栗子演示了如何利用错误处理机制处理不同的错误情况：
 func makeASandwich() throws {
    // ...
 }
 
 do {
    try makeASandwich()
    eatASandwich()
 } catch Error.OutOfCleanDishes {
    washDishes()
 } catch Error.MissingIngredients(let ingredients) {
    buyGroceries(ingredients)
 }

*/
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    makeASandwich()
} catch Error.OutOfCleanDishes {
    washDishes()
} catch Error.MissingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
/*:
 
 -  在上面的例子中，在没有干净的盘子或者缺少原料的情况下，方法 `makeASandwich()`  就会抛出一个错误。由于 `makeASandwich()` 的抛出，方法的调用被包裹在了一个 `try` 的表达式中。通过将方法的调用包裹在 `do` 语句中，任何抛出来的错误都会被传递到预先提供的 `catch` 分句中。
 - 如果没有错误抛出，方法 `eatASandwich()` 就会被调用，如果有错误抛出且满足 `Error.OutOfCleanDishes` 这个条件，方法 washDishes() 就会被执行。
 - 如果一个错误被抛出，而它又满足 `Error.MissingIngredients` 的条件，那么 `buyGroceries(_:)` 就会协同被 `catch` 模式捕获的  [String] 值一起调用。
 
 */


//: [Next](@next)
