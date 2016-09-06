import UIKit
//: ## 溢出运算符
//: 在默认情况下，当向一个整数赋予超过它容量的值时，Swift 默认会报错，而不是生成一个无效的数。这个行为为我们在运算过大或着过小的数的时候提供了额外的安全性。

//例如，Int16 型整数能容纳的有符号整数范围是 -32768 到 32767，当为一个 Int16 型变量赋的值超过这个范围时，系统就会报错：
var potentialOverflow = Int16.max
// potentialOverflow 的值是 32767，这是 Int16 能容纳的最大整数
//potentialOverflow += 1
// 这里会报错

//为过大或者过小的数值提供错误处理，能让我们在处理边界值时更加灵活。

//然而，也可以选择让系统在数值溢出的时候采取截断处理，而非报错。可以使用 Swift 提供的三个溢出运算符来让系统支持整数溢出运算。这些运算符都是以 & 开头的：
//: - 溢出加法 &+
//: - 溢出减法 &-
//: - 溢出乘法 &*

//: ### 数值溢出
//数值有可能出现上溢或者下溢。

//这个示例演示了当我们对一个无符号整数使用溢出加法（&+）进行上溢运算时会发生什么：

var unsignedOverflow = UInt8.max
// unsignedOverflow 等于 UInt8 所能容纳的最大整数 255
unsignedOverflow = unsignedOverflow &+ 1
// 此时 unsignedOverflow 等于 0

//unsignedOverflow 被初始化为 UInt8 所能容纳的最大整数（255，以二进制表示即 11111111）。然后使用了溢出加法运算符（&+）对其进行加 1 运算。这使得它的二进制表示正好超出 UInt8 所能容纳的位数，也就导致了数值的溢出，如下图所示。数值溢出后，留在 UInt8 边界内的值是 00000000，也就是十进制数值的 0。
UIImageView(image: UIImage(named: "overflowAddition_2x"))
//同样地，当我们对一个无符号整数使用溢出减法（&-）进行下溢运算时也会产生类似的现象：

var unsignedOverflow1 = UInt8.min
// unsignedOverflow1 等于 UInt8 所能容纳的最小整数 0
unsignedOverflow1 = unsignedOverflow1 &- 1
// 此时 unsignedOverflow1 等于 255
//UInt8 型整数能容纳的最小值是 0，以二进制表示即 00000000。当使用溢出减法运算符对其进行减 1 运算时，数值会产生下溢并被截断为 11111111， 也就是十进制数值的 255。

UIImageView(image: UIImage(named: "overflowUnsignedSubtraction_2x"))
//: 溢出也会发生在有符号整型数值上。在对有符号整型数值进行溢出加法或溢出减法运算时，符号位也需要参与计算，正如按位左移、右移运算符所描述的。

var signedOverflow = Int8.min
// signedOverflow 等于 Int8 所能容纳的最小整数 -128
signedOverflow = signedOverflow &- 1
// 此时 signedOverflow 等于 127
//Int8 型整数能容纳的最小值是 -128，以二进制表示即 10000000。当使用溢出减法运算符对其进行减 1 运算时，符号位被翻转，得到二进制数值 01111111，也就是十进制数值的 127，这个值也是 Int8 型整数所能容纳的最大值。

UIImageView(image: UIImage(named: "overflowSignedSubtraction_2x"))
//对于无符号与有符号整型数值来说，当出现上溢时，它们会从数值所能容纳的最大数变成最小的数。同样地，当发生下溢时，它们会从所能容纳的最小数变成最大的数。






//: [上一页](@previous) | [下一页](@next)

