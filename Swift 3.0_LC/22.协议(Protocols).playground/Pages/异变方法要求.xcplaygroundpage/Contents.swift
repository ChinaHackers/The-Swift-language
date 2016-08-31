//: ## 异变方法要求
//: - 有时一个方法需要改变（或异变）其所属的实例。例如值类型的实例方法（即结构体或枚举），在方法的 `func` 关键字之前使用 `mutating` 关键字，来表示在该方法可以改变其所属的实例，以及该实例的所有属性。这一过程写在了在实例方法中修改值类型中。
//: - 若你定义了一个协议的实例方法需求，想要异变任何采用了该协议的类型实例，只需在协议里方法的定义当中使用 `mutating` 关键字。这允许结构体和枚举类型能采用相应协议并满足方法要求。

//:> 注意: 如果你在协议中标记实例方法需求为 `mutating` ，在为类实现该方法的时候不需要写 `mutating` 关键字。 `mutating` 关键字只在结构体和枚举类型中需要书写。

/*:
 下面的例子定义了一个名为 `Togglable` 的协议，协议只定义了一个实例方法要求叫做 `toggle` 。顾名思义， `toggle()` 方法将切换或转换任何遵循该协议的类型的状态，典型地，修改该类型的属性。
在`Togglable`协议的定义中， `toggle()` 方法使用 `mutating` 关键字标记，来表明该方法在调用时会改变遵循该协议的实例的状态：
 */
protocol Togglable {
    mutating func toggle()
}
//: 若使用结构体或枚举实现 `Togglable` 协议，这个结构体或枚举可以通过使用 `mutating` 标记这个 `toggle()` 方法，来保证该实现符合协议要求。
//下面的例子定义了一个名为 OnOffSwitch 的枚举。这个枚举在两种状态间改变，即枚举成员 On 和 Off 。该枚举的 toggle 实现使用了 mutating 关键字，以满足 Togglable 协议需求：
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on

//: [上一页](@previous) | [下一页](@next)
