//: [后退](@previous)

//: - 结构体和枚举是值类型
//: - 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝。
//: - 在 Swift 中，所有的基本类型：整数（Integer）、浮点数（floating-point）、布尔值（Boolean）、字符串（string)、数组（array）和字典（dictionary），都是值类型，并且在底层都是以结构体的形式所实现。

//:在 Swift 中，所有的结构体和枚举类型都是值类型。这意味着它们的实例，以及实例中所包含的任何值类型属性，在代码中传递的时候都会被复制。

//定义一个名为 Resolution 结构体：
struct Resolution {
    var width = 0
    var height = 0
}


// 以下示例中，声明了一个名为 hd 的常量，其值为一个初始化为: width: 1920, height: 1080 的 Resolution 实例
// 结构体和枚举是值类型，值类型被赋予一个常量、变量或者本身被传递给一个函数的时候，实际上的操作是 - 拷贝

let hd = Resolution(width: 1920, height: 1080)

//: - 声明了一个名为 `cinema` 的变量，并将` hd `赋值给它。
//: -  因为` Resolution` 是一个结构体，所以` cinema `的值其实是 `hd `的一个拷贝副本，而不是` hd `本身。
//: -  尽管` hd `和` cinema` 有着相同的宽`（width）`和高`（height）`，但是在幕后它们是两个完全不同的实例。
var cinema = hd

// cinema的width属性确已改为: 2048
cinema.width = 2048
print(cinema, hd)

//然而，初始的hd实例中width属性还是1920：
print("hd 仍然是 \(hd.width) 像素宽")
// 输出 "hd 仍然是 1920 像素宽"

// - 枚举也遵循相同的行为准则：
// 定义一个名为 compassPoint 的枚举,其成员值是: North, South, East, West
enum CompassPoint {
    case North, South, East, West
}
// 将 CompassPoint.West 的值赋值给 currentDirection 变量
var currentDirection = CompassPoint.West        //currentDirection: West

// 将 currentDirection  的值赋值给 rememberedDirection 常量
let rememberedDirection = currentDirection      // rememberedDirection: West

currentDirection = CompassPoint.East            // currentDirection: East


if rememberedDirection == CompassPoint.West {   // 成立
    
    print("The remembered direction is still .West")
}

// 输出 "The remembered direction is still .West"

// 上例中 rememberedDirection 被赋予了 currentDirection 的值，实际上它被赋予的是值的一个拷贝。
// 赋值过程结束后再修改currentDirection的值并不影响rememberedDirection所储存的原始值的拷贝。



//: [类是引用类型](@next)
