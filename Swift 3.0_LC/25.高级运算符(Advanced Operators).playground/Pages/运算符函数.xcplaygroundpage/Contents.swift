import UIKit
//: ## 运算符函数
//: 类和结构体可以为现有的运算符提供自定义的实现，这通常被称为运算符重载。

//: - 下面的例子展示了如何为自定义的结构体实现加法运算符（+）。算术加法运算符是一个双目运算符，因为它可以对两个值进行运算，同时它还是中缀运算符，因为它出现在两个值中间。
//: - 例子中定义了一个名为 Vector2D 的结构体用来表示二维坐标向量 (x, y)，紧接着定义了一个可以对两个 Vector2D 结构体进行相加的运算符函数：

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}
//该运算符函数被定义为一个全局函数，并且函数的名字与它要进行重载的 + 名字一致。因为算术加法运算符是双目运算符，所以这个运算符函数接收两个类型为 Vector2D 的参数，同时有一个 Vector2D 类型的返回值。

//在这个实现中，输入参数分别被命名为 left 和 right，代表在 + 运算符左边和右边的两个 Vector2D 实例。函数返回了一个新的 Vector2D 实例，这个实例的 x 和 y 分别等于作为参数的两个实例的 x 和 y 的值之和。

//这个函数被定义成全局的，而不是 Vector2D 结构体的成员方法，所以任意两个 Vector2D 实例都可以使用这个中缀运算符：
let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector 是一个新的 Vector2D 实例，值为 (5.0, 5.0)

//这个例子实现两个向量 (3.0，1.0) 和 (2.0，4.0) 的相加，并得到新的向量 (5.0，5.0)。这个过程如下图示：
UIImageView(image: UIImage(named: "vectorAddition_2x"))

//: ### 前缀和后缀运算符

//上个例子演示了一个双目中缀运算符的自定义实现。类与结构体也能提供标准单目运算符的实现。单目运算符只运算一个值。当运算符出现在值之前时，它就是前缀的（例如 -a），而当它出现在值之后时，它就是后缀的（例如 b!）。

//: 要实现前缀或者后缀运算符，需要在声明运算符函数的时候在 `func` 关键字之前指定 `prefix` 或者 `postfix` 修饰符：
extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
//这段代码为 Vector2D 类型实现了单目负号运算符。由于该运算符是前缀运算符，所以这个函数需要加上 prefix 修饰符。

//对于简单数值，单目负号运算符可以对它们的正负性进行改变。对于 Vector2D 来说，该运算将其 x 和 y 属性的正负性都进行了改变：
let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative is a Vector2D instance with values of (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive is a Vector2D instance with values of (3.0, 4.0)

//: ### 复合赋值运算符
//复合赋值运算符将赋值运算符（=）与其它运算符进行结合。例如，将加法与赋值结合成加法赋值运算符（+=）。在实现的时候，需要把运算符的左参数设置成 inout 类型，因为这个参数的值会在运算符函数内直接被修改。

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

//: 因为加法运算在之前已经定义过了，所以在这里无需重新定义。在这里可以直接利用现有的加法运算符函数，用它来对左值和右值进行相加，并再次赋值给左值：
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original 的值现在为 (4.0, 6.0)

//:> 注意: 不能对默认的赋值运算符（=）进行重载。只有组合赋值运算符可以被重载。同样地，也无法对三目条件运算符 （a ? b : c） 进行重载。
//: ### 等价运算符
//: 自定义的类和结构体没有对等价运算符进行默认实现，等价运算符通常被称为`“相等”`运算符`（==）`与`“不等”运算符（!=）`。对于自定义类型，Swift 无法判断其是否“相等”，因为“相等”的含义取决于这些自定义类型在你的代码中所扮演的角色。

//为了使用等价运算符能对自定义的类型进行判等运算，需要为其提供自定义实现，实现的方法与其它中缀运算符一样
extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}
let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
// Prints "These two vectors are equivalent."



//: [上一页](@previous) | [下一页](@next)
