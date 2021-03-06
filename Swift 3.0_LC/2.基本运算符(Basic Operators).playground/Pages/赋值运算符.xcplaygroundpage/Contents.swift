//: ### 赋值运算符
let b = 10
var a = 5
a = b     //用b的值去初始化或更新a 的值

let (x, y) = (1, 2) // x等于1, 并且y等于2

//: 与C及Objective-C不同，Swift中赋值运算符并不将自身作为一个值进行返回。所以以下的代码是不合法的：

//: 此特性帮助你避免因粗心将 等于(==)写成 赋值运算符 (=) 而引起的错误。因为 if a = b 这样写是无效的
/*
 if a = b {
 // 错误, 因为a = b并不会返回一个值
 }
 */

//: [术语](@previous) | [算术运算符](@next)