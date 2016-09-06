//: ### 自定义运算符
//除了实现标准运算符，在 Swift 中还可以声明和实现自定义运算符。可以用来自定义运算符的字符列表请参考运算符。
//新的运算符要使用 operator 关键字在全局作用域内进行定义，同时还要指定 prefix、infix 或者 postfix 修饰符：
prefix operator +++ {}

//: 上面的代码定义了一个新的名为 +++ 的前缀运算符。对于这个运算符，在 Swift 中并没有意义，因此我们针对 Vector2D 的实例来定义它的意义。对这个示例来讲，+++ 被实现为“前缀双自增”运算符。它使用了前面定义的复合加法运算符来让矩阵对自身进行相加，从而让 Vector2D 实例的 x 属性和 y 属性的值翻倍：

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)

//: ### 自定义中缀运算符的优先级和结合性



//自定义的中缀运算符也可以指定优先级和结合性。优先级和结合性中详细阐述了这两个特性是如何对中缀运算符的运算产生影响的。

//结合性可取的值有left，right 和 none。当左结合运算符跟其他相同优先级的左结合运算符写在一起时，会跟左边的值进行结合。同理，当右结合运算符跟其他相同优先级的右结合运算符写在一起时，会跟右边的值进行结合。而非结合运算符不能跟其他相同优先级的运算符写在一起。

//结合性的默认值是 none，优先级的默认值 100。

//以下例子定义了一个新的中缀运算符 +-，此运算符的结合性为 left，并且它的优先级为 140：

infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector 是一个 Vector2D 实例，并且它的值为 (4.0, -2.0)
//这个运算符把两个向量的 x 值相加，同时用第一个向量的 y 值减去第二个向量的 y 值。因为它本质上是属于“相加型”运算符，所以将它的结合性和优先级被分别设置为 left 和 140，这与 + 和 - 等默认的中缀“相加型”运算符是相同的。关于 Swift 标准库提供的运算符的结合性与优先级，请参考 Swift Standard Library Operators Reference。

//:>注意:当定义前缀与后缀运算符的时候，我们并没有指定优先级。然而，如果对同一个值同时使用前缀与后缀运算符，则后缀运算符会先参与运算。

//: [上一页](@previous) | [下一页](@next)
