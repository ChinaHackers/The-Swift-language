//: ## 委托

//: 委托是一个允许类或者结构体放手（或者说委托）它们自身的某些责任给另外类型实例的设计模式。这个设计模式通过定义一个封装了委托责任的协议来实现，比如遵循了协议的类型（所谓的委托）来保证提供被委托的功能。委托可以用来响应一个特定的行为，或者从外部资源取回数据而不需要了解资源具体的类型。

//: Delegation 委托，可能也以“代理”而为人熟知，这里我们选择译为“委托”是为了更好的理解避免混淆。
protocol RandomNumberGenerator {
    func random() -> Double
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

//下面的例子定义了两个协议以用于基于骰子的棋盘游戏：
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}
//: DiceGame 协议是一个给任何与骰子有关的游戏采纳的协议。 DiceGameDelegate 协议可以被任何追踪 DiceGame 进度的类型采纳。

//: 这里有一个原本在控制流中介绍的蛇与梯子游戏的一个版本。这个版本采纳了协议以使用 Dice 实例来让它使用骰子；采用 DiceGame 协议；然后通知一个 DiceGameDelegate 关于进度的信息：
//采用并遵循 RandomNumberGenerator 协议的类的实现。这个类实现了著名的 linear congruential generator 伪随机数发生器算法：
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

//使用了叫做 SnakesAndLadders 类包装，它采纳了 DiceGame 协议。它提供了可读的 dice 属性和一个 play() 方法来遵循协议。
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

/*:
这个版本的游戏使用了叫做 `SnakesAndLadders` 类包装，它采纳了 `DiceGame` 协议。它提供了可读的 `dice` 属性和一个 `play()` 方法来遵循协议。（ `dice` 属性声明为常量属性是因为它不需要在初始化后再改变了，而且协议只需要它是可读的。）

蛇与梯子游戏棋盘设置都写在了类的 `init()` 初始化器中。所有的游戏逻辑都移动到了协议的 `play` 方法里，它使用了协议要求的 `dice` 属性来提供它的骰子值。

注意 `delegate` 属性被定义为可选的 `DiceGameDelegate` ，是因为玩游戏并不是必须要有委托。由于它是一个可选类型， `delegate` 属性自动地初始化为`nil`。此后，游戏的实例化者可以选择给属性赋值一个合适的委托。

`DiceGameDelegate` 提供了三个追踪游戏进度的方法。这三个方法在游戏逻辑的 `play()` 方法中协作，并且在游戏开始时调用，新一局开始，或者游戏结束。

由于 `delegate` 属性是可选的 `DiceGameDelegate` ， `play()` 方法在每次调用委托的时候都使用可选链。如果 `delegate` 属性是空的，这些委托调用会优雅地失败并且没有错误。如果 `delegate` 属性非空，委托的方法就被调用了，并且把 `SnakesAndLadders` 实例作为形式参数传入。

*/
//接下来的例子展示了叫做 DiceGameTracker 的类，它次那了 DiceGameDelegate 协议
class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

/*:
`DiceGameTracker` 实现了 `DiceGameDelegate` 要求的所有方法。它使用这些方法来对游戏开了多少局保持追踪。它在游戏开始的时候重置 `numberOfTurns` 属性为零，在每次新一轮游戏开始的时候增加，并且一旦游戏结束，打印出游戏一共开了多少轮。

上边展示的 `gameDidStart(_:)` 的实现使用了 `game` 形式参数来打印某些关于游戏的信息。 `game` 形式参数是 `DiceGame` 类型，不是 `SnakesAndLadders` ，所以 `gameDidStart(_:)` 只能访问和使用 `DiceGame` 协议实现的那部分方法和属性。总之，转换类型之后方法还是可以使用的。在这个例子中，它检查 `game` 在后台是否就是 `SnakesAndLadders` 实例，如果是，打印合适的信息。

`gameDidStart(_:)` 方法同样访问传入的 `game` 形式参数里的 `dice` 属性。由于 `game` 已经遵循 `DiceGame` 协议，这就保证了`dice`属性的存在，并且 `gameDidStart(_:)`方法能够访问和打印骰子的 `sides` 属性，无论玩的是什么类型的游戏。

 */
//这里是 DiceGameTracker 的运行结果：
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

// Started a new game of Snakes and Ladders
// The game is using a 6-sided dice
// Rolled a 3
// Rolled a 5
// Rolled a 4
// Rolled a 5
// The game lasted for 4 turns

//: [上一页](@previous) | [下一页](@next)
