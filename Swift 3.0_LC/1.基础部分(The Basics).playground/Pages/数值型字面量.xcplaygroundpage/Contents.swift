//: ### 数值型字面量
//: 整数型字面量可以写作：
//: - 一个十进制数，不带前缀
//: - 一个二进制数，用前缀0b
//: - 一个八进制数，用0o前缀
//: - 一个十六进制数，以0x前缀

//: 下面的这些所有整数字面量的十进制值都是 17:
let decimalInteger = 17
let binaryInteger = 0b10001     // 17在二进制中的表示
let octalInteger = 0o21         // 17在八进制中的表示
let hexadecimalInteger = 0x11   // 17在十六进制中的表示
/*:
- 浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是0x）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。
- 十进制浮点数也可以有一个可选的指数（exponent)，通过大写或者小写的 e 来指定；十六进制浮点数必须有一个指数，通过大写或者小写的 p 来指定。
*/
//:如果一个十进制数的指数为exp，那这个数相当于基数和10^exp的乘积：
//: - 1.25e2 表示 1.25 × 10^2，等于 125.0。
//: - 1.25e-2 表示 1.25 × 10^-2，等于 0.0125。

//:如果一个十六进制数的指数为exp，那这个数相当于基数和2^exp的乘积：
//: - 0xFp2 表示 15 × 2^2，等于 60.0。
//: - 0xFp-2 表示 15 × 2^-2，等于 3.75。
//下面的这些浮点字面量都等于十进制的12.1875：
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
//:数值类字面量可以包括额外的格式来增强可读性。整数和浮点数都可以添加额外的零并且包含下划线，并不会影响字面量：
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: [上一页](@previous) | [下一页](@next)
