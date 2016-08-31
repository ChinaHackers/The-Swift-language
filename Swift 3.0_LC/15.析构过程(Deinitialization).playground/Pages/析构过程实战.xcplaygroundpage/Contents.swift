//: - 析构器操作

//: - 这是一个析构器操作的例子。这个例子描述了一个简单的游戏,这里定义了两种新类型,分别是 Bank 和 Playe r 。 Bank 结构体管理一个虚拟货币的流通,在这个流通中我们设定 Bank 永远不可能拥有超过 10,000 的硬 币,而且在游戏中有且只能有一个 Bank 存在,因此 Bank 结构体在实现时会带有静态属性和静态方法来存储和管 理其当前的状态。

struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins( numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}
Bank 根据它的 coinsInBank 属性来跟踪当前它拥有的硬币数量。 Bank 还提供两个方法—— vendCoins(_:) 和 ceiveCoins(_:) ,分别用来处理硬币的分发和收集。
vendCoins(_:) 方法在bank对象分发硬币之前检查是否有足够的硬币。如果没有足够多的硬币, Bank 会返回一个 比请求时要小的数字(如果没有硬币留在bank对象中就返回 0)。 vendCoins 方法声明 numberOfCoinsToVend 为一个 变量参数,这样就可以在方法体的内部修改数字,而不需要定义一个新的变量。 vendCoins 方法返回一个整型 值,表明了提供的硬币的实际数目。
receiveCoins 方法只是将bank对象的硬币存储和接收到的硬币数目相加,再保存回bank对象。
Player 类描述了游戏中的一个玩家。每一个 player 在任何时刻都有一定数量的硬币存储在他们的钱包中。这通 过 player 的 coinsInPurse 属性来体现:
re
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}


//每个 Player 实例构造时都会设定由硬币组成的启动额度值,这些硬币在bank对象初始化的过程中得到。如果在ba nk对象中没有足够的硬币可用, Player 实例可能收到比指定数目少的硬币。
第 2 章 Swift 教程 | 218
Player 类定义了一个 winCoins(_:) 方法,该方法从bank对象获取一定数量的硬币,并把它们添加到玩家的钱 包。 Player 类还实现了一个析构器,这个析构器在 Player 实例释放前被调用。在这里,析构器的作用只是将玩 家的所有硬币都返回给bank对象:
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins") // 输出 "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// 输出 "There are now 9900 coins left in the bank"
一个新的 Player 实例被创建时会设定有 100 个硬币(如果bank对象中硬币的数目足够)。这 个Player 实例存储 在一个名为 playerOne 的可选 Player 变量中。这里使用一个可选变量,是因为玩家可以随时离开游戏。设置为可 选使得你可以跟踪当前是否有玩家在游戏中。
因为 playerOne 是可选的,所以用一个感叹号( ! )作为修饰符,每当其 winCoins(_:) 方法被调用时, coinsIn Purse 属性就会被访问并打印出它的默认硬币数目。
playerOne!.winCoins(2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins") // 输出 "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")
// 输出 "The bank now only has 7900 coins left"
这里,player 已经赢得了 2,000 硬币,所以player 的钱包现在有 2,100 硬币,而bank对象只剩余 7,900 硬 币。
playerOne = nil
print("PlayerOne has left the game")
// 输出 "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins") // 输出 "The bank now has 10000 coins"
玩家现在已经离开了游戏。这表明是要将可选的 playerOne 变量设置为 nil ,意思是“不存在 Player 实例”。当 这种情况发生的时候, playerOne 变量对 Player 实例的引用被破坏了。没有其它属性或者变量引用 Player 实 例,因此为了清空它占用的内存从而释放它。在这发生前,其析构器会被自动调用,从而使其硬币被返回到bank 对象中。

//: [Next](@next)
