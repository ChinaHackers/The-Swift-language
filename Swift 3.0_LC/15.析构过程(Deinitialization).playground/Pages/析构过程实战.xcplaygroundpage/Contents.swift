//: ## 析构器操作
//: 这是一个析构器操作的例子。这个例子描述了一个简单的游戏,这里定义了两种新类型,分别是 `Bank` 和 `Player` 。 `Bank` 结构体管理一个虚拟货币的流通,在这个流通中我们设定 `Bank` 永远不可能拥有超过 10,000 的硬 币,而且在游戏中有且只能有一个 `Bank` 存在,因此 `Bank` 结构体在实现时会带有静态属性和静态方法来存储和管 理其当前的状态。
class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
//: - `Bank` 根据它的 `coinsInBank` 属性来跟踪当前它拥有的硬币数量。 `Bank` 还提供两个方法—— `distribute(coins:)` 和 `receive(coins:)`,分别用来处理硬币的分发和收集。
//: - `distribute(coins:)` 方法在`bank`对象分发硬币之前检查是否有足够的硬币。如果没有足够多的硬币, `Bank` 会返回一个 比请求时要小的数字(如果没有硬币留在`bank`对象中就返回 0)。 `distribute(coins:)` 方法声明 `numberOfCoinsToVend` 为一个 变量参数,这样就可以在方法体的内部修改数字,而不需要定义一个新的变量。 `vendCoins` 方法返回一个整型 值,表明了提供的硬币的实际数目。
//: - `receive(coins:)` 方法只是将 `bank` 对象的硬币存储和接收到的硬币数目相加,再保存回bank对象。

//Player 类描述了游戏中的一个玩家。每一个 player 在任何时刻都有一定数量的硬币存储在他们的钱包中。这通 过 player 的 coinsInPurse 属性来体现:
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
//每一个 Player实例都会用银行指定的金币数量来作为一开始的限定来初始化，尽管 Player实例可能会在没有足够多金币的时候收到更少的数量。

//: Player类定义了一个` win(coins:)`方法，它从银行取回确定数量的金币并且把它们添加到玩家的钱包当中。 `Player`类同样实现了一个反初始化器，它会在 `Player`实例释放之前被调用。这时，反初始化器会把玩家多有的金币返回到银行当中：
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Prints "There are now 9900 coins left in the bank"
//: - 新的 Player实例创建出来了，同时如果可以的话会获取100个金币。这个 Player实例储存了一个可选的 Player变量叫做 playerOne。这里使用了一个可选变量，是因为玩家可以在任何时候离开游戏。可选项允许你追踪当前游戏中是否有玩家。
//: - 因为 playerOne是可选项，当它的 coinsInPurse属相被访问来打印默认金币时，必须使用叹号 ( !)才能完全符合，并且无论 win(coins:)方法是否被调用：
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")    // Prints "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")                   // Prints "The bank now only has 7900 coins left"

// 这时，玩家拥有了2000个金币。玩家的钱包当中保存了2100个金币，并且银行只剩下7900个金币。
playerOne = nil
print("PlayerOne has left the game")                                            // prints "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins")                             // prints "The bank now has 10000 coins"
//: 现在玩家离开了游戏。这通过设置 playerOne变量为 nil来明确，意味着“无 Player实例。”当这个时候， playerOne变量到 Player实例的引用被破坏掉了。没有其他的属性或者变量仍在引用 Player实例，所以它将会被释放掉以节约内存。在释放掉的瞬间，它的反初始化器会自动被调用，然后它的金币被送回给了银行。

//: [上一页](@previous) | [下一页](@next)
