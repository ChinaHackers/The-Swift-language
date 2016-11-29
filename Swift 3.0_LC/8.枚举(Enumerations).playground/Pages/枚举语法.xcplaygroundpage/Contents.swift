//: ## 枚举语法
//: - 使用 `enum` 关键词来创建枚举并且把它们的整个定义放在一对大括号内：
enum SomeEnumeration {
    // 枚举定义放在这里
}

//下面是用枚举表示指南针四个方向的例子：
enum CompassPoint {
    case north
    case south
    case east
    case west
}
//: - 枚举中定义的值（如 North，South，East和West）是这个枚举的成员值（或成员）。你使用 `case` 关键字来定义一个新的枚举成员值。
//: - 多个成员值可以出现在同一行上，用逗号隔开：
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 使用点语法访问值
var directionToHead = CompassPoint.west
//: `directionToHead` 的类型可以在它被  `CompassPoint` 的某个值初始化时推断出来。一旦 `directionToHead` 被声明为`CompassPoint`类型，你可以使用更简短的点语法将其设置为另一个 `CompassPoint` 的值：
directionToHead = .east
//: `directionToHead`的类型由右侧类型推断，一旦类型确定，赋值可以省略枚举类型名

//: [后退](@previous) | [使用 Switch 语句匹配枚举值](@next)
