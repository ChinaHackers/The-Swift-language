//: ## 将协议作为类型
//:  实际上协议自身并不实现功能。不过你创建的任意协议都可以变为一个功能完备的类型在代码中使用。
//: 由于它是一个类型，你可以在很多其他类型可以使用的地方使用协议，包括：
//: - 在函数、方法或者初始化器里作为形式参数类型或者返回类型；
//: - 作为常量、变量或者属性的类型；
//: - 作为数组、字典或者其他存储器的元素的类型。
//:> 注意: 由于协议是类型，要开头大写（比如说 `FullyNamed` 和 `RandomNumberGenerator` ）来匹配 `Swift` 里其他类型名称格式（比如说 `Int` 、 `String` 还有 `Double` ）。

protocol RandomNumberGenerator {
    func random() -> Double
}

//这里有一个把协议用作类型的例子：
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
/*:

 - 这个例子定义了一个叫做 `Dice` 的新类，它表示一个用于棋盘游戏的 `n` 面骰子。 `Dice` 实例有一个叫做 `sides` 的整数属性，它表示了骰子有多少个面，还有个叫做 `generator` 的属性，它提供了随机数的生成器来生成骰子的值。

 - `generator` 属性是 `RandomNumberGenerator` 类型。因此，你可以把它放到任何采纳了 `RandomNumberGenerator` 协议的类型的实例里。除了这个实例必须采纳 `RandomNumberGenerator` 协议以外，没有其他任何要求了。

 - `Dice` 也有一个初始化器，来设置初始状态。这个初始化器有一个形式参数叫做 `generator` ，它同样也是 `RandomNumberGenerator` 类型。你可以在初始化新的 `Dice` 实例的时候传入一个任意遵循这个协议的类型的值到这个形式参数里。

 - `Dice` 提供了一个形式参数方法， `roll` ，它返回一个介于 1 和骰子面数之间的整数值。这个方法调用生成器的 `random()` 方法来创建一个新的介于 0.0 和 1.0 之间的随机数，然后使用这个随机数来在正确的范围创建一个骰子的值。由于 `generator` 已知采纳了 `RandomNumberGenerator` ，它保证了会有 `random()` 方法以供调用。

*/
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
//这里是 Dice 类使用 LinearCongurentialGenerator 实例作为用于创建一个六面骰子的随机数生成器来创建一个六面骰子的过程：
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4
// Random dice roll is 5
// Random dice roll is 4


//: [上一页](@previous) | [下一页](@next)
