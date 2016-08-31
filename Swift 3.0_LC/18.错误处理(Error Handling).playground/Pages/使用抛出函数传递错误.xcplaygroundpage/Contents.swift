//: ## 使用抛出函数传递错误
//: 为了明确一个函数或者方法可以抛出错误，你要在它的声明当中的形式参数后边写上 throws关键字。使用 throws标记的函数叫做抛出函数。如果它明确了一个返回类型，那么 throws关键字要在返回箭头 ( ->)之前。
//func canThrowErrors() throws -> String

//func cannotThrowErrors() -> String

//: 抛出函数可以把它内部抛出的错误传递到它被调用的生效范围之内。
//: >注意: 只有抛出函数可以传递错误。任何在非抛出函数中抛出的错误都必须在该函数内部处理。

//: 在抛出函数体内的任何地方，你都可以用 throw语句来抛出错误。

//: 在下边的栗子中， VendingMachine类拥有一个如果请求的物品不存在、卖光了或者比押金贵了就会抛出对应的 VendingMachineError错误的 vend(itemNamed:)方法：
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

//: -  `vend(itemNamed:)`方法的实现使用了 `guard` 语句来提前退出并抛出错误，如果购买零食的条件不符合的话。因为`throw`语句立即传送程序控制，所以只有所有条件都达到，物品才会售出。
//: - 由于 `vend(itemNamed:)`方法传递它抛出的任何错误，所以你调用它的代码要么直接处理错误——使用 do-catch语句， try?或者 try!——要么继续传递它们。
//: - 比如说，下边栗子中的 `buyFavoriteSnack(person:vendingMachine:)`同样是一个抛出函数，任何 `vend(itemNamed:)`方法抛出的函数都会向上传递给调用 `buyFavoriteSnack(person:vendingMachine:)`函数的地方。
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}
// Dispensing Chips

//: 在这个栗子中， `buyFavoriteSnack(person:vendingMachine:)`函数查找给定人的最爱零食并且尝试通过调用 `vend(itemNamed:)`方法来购买它们。由于 `vend(itemNamed:)` 方法会抛出错误，调用的时候要在前边用`try`关键字。

//: [上一页](@previous) | [下一页](@next)

