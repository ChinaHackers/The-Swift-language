//: ## 原始值（Raw Values）
//: - 一种增加信息的方式是原始值（RawValue）
//: - 原始值的类型和值都需要在定义时确定，不同case的原始值具有相同的类型
//: - 原始值可以是字符串，字符，或者任何整数型或浮点数值
//:> 注意: 原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
//枚举类型 ASCIIControlCharacter 的原始值类型被定义为 Character，并设置了一些比较常见的 ASCII 控制字符。
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
//: ---
//: #### 原始值的隐式赋值（Implicitly Assigned Raw Values）
//: - 在使用原始值为整数或者字符串类型的枚举时，不需要显式地为每一个枚举成员设置原始值，Swift 将会自动为你赋值。
//: - 使用整数作为原始值时，隐式赋值会依次递增1，如果第一个值没有被赋初值，将自动被赋值为0
enum AnotherPlanet: Int {
    
    //AnotherPlanet.Mercury 的显式原始值为1，AnotherPlanet.Venus的隐式原始值为2，依次类推....Neptune的原始值: 7
    case Mercury = 1, Venus, Earth, Jupiter, Saturn, Uranus, Neptune
}

//使用枚举成员的 rawValue 属性可以访问成员的原始值

print(AnotherPlanet.Neptune.rawValue)   // Neptune: 7

//: - 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
enum AnotherCompassPoint: String {
    //CompassPoint.South拥有隐式原始值South
    case North, South, East, West
}
print(AnotherCompassPoint.West.rawValue)  // West

//: ----
//: #### 使用原始值初始化枚举实例（Initializing from a Raw Value）
//如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil。你可以使用这个初始化方法来创建一个新的枚举实例。

enum Planet: Int {
    
    //Planet.Mercury 的显式原始值为1，Planet.Venus的隐式原始值为2，依次类推....Neptune的原始值: 7
    case Mercury = 1, Venus, Earth, Jupiter, Saturn, Uranus, Neptune
}


//这个例子利用原始值7创建了枚举成员 Neptune：
// possiblePlanet 类型为 Planet? ,值为: Planet.Neptune
let possiblePlanet = Planet(rawValue: 7)

// 使用原始值来初始化枚举变量，因为有可能失败，所以返回可选类型

let positionToFind = 9

if let possible = Planet(rawValue: positionToFind) {
    
    switch possible {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// 以上例子使用了可选绑定（optional binding），试图通过 原始值 9 来访问 planet。
//if let possible = Planet(rawValue: 9)语句创建了一个可选Planet，如果可选Planet的值存在，就会赋值给possible。在planet枚举中没有找到位置为9的成员值，所以else分支被执行。
//: [递归枚举](@next)
