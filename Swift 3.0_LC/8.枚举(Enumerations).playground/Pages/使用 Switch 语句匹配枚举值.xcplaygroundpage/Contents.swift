//: ## 使用switch语句匹配单个枚举值
//定义一个名为 CompassPoint 的枚举
enum CompassPoint {
    case north
    case south  // North、South、 East、 West 为枚举的成员值（或成员）
    case east
    case west
}

// 使用点语法访问值
var directionToHead = CompassPoint.west    // directionToHead: West

// 使用switch语句匹配单个枚举值
switch directionToHead {
case .north :
    print("Lots of planets have a north")
case .south :
    print("Watch out for penguins")
case .east :
    print("Where the sun rise")
case .west :
    print("Where the skies blue")  // 输出这句
}

//: 上述代码读作： 判断 directionToHead的值。在等于 .North的 case中，则打印 "Lots of planets have a north"。在等于 .South的 case中，则显示 "Watch out for penguins"

//:当不需要匹配每个枚举成员的时候，你可以提供一个 default 分支来涵盖所有未明确处理的枚举成员
enum Planet {
    //多个成员值可以出现在同一行上，用逗号隔开
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// 输出 "Mostly harmless”

//: [关联值](@next)
