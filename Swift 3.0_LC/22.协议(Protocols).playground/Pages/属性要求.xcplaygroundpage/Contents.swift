//: ## 属性要求
//: 协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性(instance property)或类属性 (type property)。协议并不会具体说明属性是储存型属性还是计算型属性——它只具体要求属性有特定的名称和类型。协议同时要求一个属性必须明确是可读的或可读的和可写的。

//: 若协议要求一个属性为可读和可写的，那么该属性要求不能用常量存储属性或只读计算属性来满足。若协议只要求属性为可读的，那么任何种类的属性都能满足这个要求，而且如果你的代码需要的话，该属性也可以是可写的。

//: 属性要求定义为变量属性，在名称前面使用 var 关键字。可读写的属性使用 { get set } 来写在声明后面来明确，使用 { get } 来明确可读的属性。
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
//: 在协议中定义类型属性时在前面添加 static 关键字。当类的实现使用 class 或 static 关键字前缀声明类型属性要求时，这个规则仍然适用：
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
//这里是一个只有一个实例属性要求的协议：
protocol FullyNamed {
    var fullName: String { get }
}
//: 上面 FullyNamed 协议要求遵循的类型提供一个完全符合的名字。这个协议并未指定遵循类型的其他任何性质——它只要求这个属性必须为其自身提供一个全名。协议申明了所有 FullyNamed 类型必须有一个可读实例属性 fullName ，且为 String 类型。

//: 这里是一个采纳并遵循 FullyNamed 协议的结构体的例子：
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")
// john.fullName is "John Appleseed"

//: 这个例子定义了一个名为 Person 的结构体，它表示一个有名字的人。它在其第一行定义中表明了它采纳 FullyNamed 协议作为它自身的一部分。

//: 每一个 Person 的实例都有一个名为 fullName 的 String 类型储存属性。这符合了 FullyNamed 协议的单一要求，并且表示 Person 已经正确地遵循了该协议。（若协议的要求没有完全达标，Swift 在编译时会报错。）

//: 这里是一个更加复杂的类，采纳并遵循了 FullyNamed 协议：
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
// ncc1701.fullName is "USS Enterprise"

//: 这个类为一艘星舰实现了 fullName 计算型只读属性的要求。每一个 Starship 类的实例储存了一个不可选的 name 属性以及一个可选的 prefix 属性。当 prefix 值存在时， fullName 将 prefix 放在 name 之前以创建星舰的全名。

//: [上一页](@previous) | [下一页](@next)
