//: ## 方法要求
//: 协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许变量拥有参数，与正常的方法使用同样的规则。但在协议的定义中，方法参数不能定义默认值。

//:正如类型属性要求的那样，当协议中定义类型方法时，你总要在其之前添加 `static` 关键字。即使在类实现时，类型方法要求使用 `class` 或 `static` 作为关键字前缀，前面的规则仍然适用：
protocol SomeProtocol {
    static func someTypeMethod()
}

//下面的例子定义了一个只有一个实例方法要求的协议：
protocol RandomNumberGenerator {
    func random() -> Double
}

//: - 这里 `RandomNumberGenerator` 协议要求所有采用该协议的类型都必须有一个实例方法 `random` ，而且要返回一个 `Double` 的值，无论这个值叫什么。尽管协议没有明确定义，这里默认这个值在 0.0  到 1.0 （不包括）之间。
//: - `RandomNumberGenerator` 协议并不为随机值的生成过程做任何定义，它只要求生成器提供一个生成随机数的标准过程。
//: - 这里有一个采用并遵循 `RandomNumberGenerator` 协议的类的实现。这个类实现了著名的 `linear congruential generator` 伪随机数发生器算法：
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
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// 打印 "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// 打印 "And another one: 0.729023776863283"

//: [上一页](@previous) | [下一页](@next)
