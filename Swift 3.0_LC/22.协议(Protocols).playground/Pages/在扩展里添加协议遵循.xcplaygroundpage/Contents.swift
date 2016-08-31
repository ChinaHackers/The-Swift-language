//: ## 在扩展里添加协议遵循
//: 你可以扩展一个已经存在的类型来采纳和遵循一个新的协议，就算是你无法访问现有类型的源代码也行。扩展可以添加新的属性、方法和下标到已经存在的类型，并且因此允许你添加协议需要的任何需要。要了解更多关于扩展的信息，见扩展。

//:> 注意: 类型已经存在的实例会在给它的类型扩展中添加遵循协议时自动地采纳和遵循这个协议。

//举例来说，这个协议，叫做 TextRepresentable ，可以被任何可以用文本表达的类型实现。这可能是它自身的描述，或者是它当前状态的文字版显示：


protocol TextRepresentable {
    var textualDescription: String { get }
}
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

//先前的 Dice 类可以扩展来采纳和遵循 TextRepresentable ：
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

//这个扩展使用了与 Dice 提供它原本实现完全相同的方式来采纳了新的协议。协议名写在类型的名字之后，用冒号隔开，并且在扩展的花括号里实现了所有协议的需要。

//任何 Dice 实例现在都可以被视作 TextRepresentable ：
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
// 打印 "A 12-sided dice"


//类似地， SnakesAndLadders 游戏类可以扩展来采纳和遵循 TextRepresentable 协议：
extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)
// Prints "A game of Snakes and Ladders with 25 squares"


//: ### 使用扩展声明采纳协议
//如果一个类型已经遵循了协议的所有需求，但是还没有声明它采纳了这个协议，你可以让通过一个空的扩展来让它采纳这个协议：
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

//Hamster 实例现在可以用在任何 TextRepresentable 类型可用的地方了：
let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)
// Prints "A hamster named Simon"


//: >注意: 类型不会因为满足需要就自动采纳协议。它们必须显式地声明采纳了哪个协议。






//: [上一页](@previous) | [下一页](@next)
