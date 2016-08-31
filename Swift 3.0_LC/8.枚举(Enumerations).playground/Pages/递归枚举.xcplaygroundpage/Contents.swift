//: [后退](@previous)

//: - 递归枚举（Recursive Enumerations）
//: - 递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。
//: - 使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上` indirect ` 关键字来表示该成员可递归。
//例如，下面的例子中，枚举类型存储了简单的算术表达式：
/*
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
*/

// 在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的：
indirect enum ArithmeticExpression {
    case Number(Int) //纯数字
    case Addition(ArithmeticExpression, ArithmeticExpression) //两个表达式相加
    case Multiplication(ArithmeticExpression, ArithmeticExpression) //两个表达式相乘
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))


func evaluate(expression: ArithmeticExpression)->Int {
    switch expression {
    case.Number(let value) :
        return value
    case.Addition(let left, let right) :
        return evaluate(expression: left) + evaluate(expression: right)
    case.Multiplication(let left, let right):
        return evaluate(expression: left) * evaluate(expression: right)
    }
}

print(evaluate(expression: product))
// 输出 "18"

//该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘。
