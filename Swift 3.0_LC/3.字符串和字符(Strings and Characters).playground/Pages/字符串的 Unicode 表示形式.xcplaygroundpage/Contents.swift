//: ## 字符串的 Unicode 表示形式（Unicode Representations of Strings)

/*:
 当一个 Unicode 字符串被写进文本文件或者其他储存时，字符串中的 `Unicode` 标量会用 `Unicode` 定义的几种编码格式编码。
 每一个字符串中的小块编码都被称为代码单元。这些包括 `UTF-8` 编码格式（编码字符串为8位的代码单元），
 `UTF-16` 编码格式（编码字符串位16位的代码单元），以及 `UTF-32` 编码格式（编码字符串32位的代码单元）。
 
 `Swift` 提供了几种不同的方式来访问字符串的 `Unicode` 表示形式。
 您可以利用 `for-in` 来对字符串进行遍历，从而以 `Unicode` 可扩展的字符群集的方式访问每一个`Character`值。
 
 */

//: 另外，你也可以用其他三种 Unicode 兼容的方式访问 `String` 的值：

//: - UTF-8 代码单元集合 (利用字符串的utf8属性进行访问)
//: - UTF-16 代码单元集合 (利用字符串的utf16属性进行访问)
//: - 21位的 Unicode 标量值集合，也就是字符串的 UTF-32 编码格式 (利用字符串的unicodeScalars属性进行访问)
//下边的每一个栗子都展示了接下来的字符串的不同表示方法，这个字符串由字符 D ， o ， g ， !  ( DOUBLE EXCLAMATION MARK, 或者说 Unicode 标量 U+203C)以及 ? 字符( DOG FACE , 或者说 Unicode 标量 U+1F436)组成：

let dogString = "Dog!🐶"
//: ---

//: #### UTF-8 表示法
//: UTF-8. 得到字符的utf8编码的值
for codeUnit in dogString.utf8 {
    
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 33 240 159 144 182”

//: ---
//: #### UTF-16 表示法
//: UTF-16. 得到字符的utf16编码的值
for codeUnit in dogString.utf16 {
    
    print("\(codeUnit) ", terminator: "")
}
print("")

// 68 111 103 8252 55357 56374


//: ---
//: #### Unicode 标量表示法
//: 你可以通过遍历 `unicodeScalars` 属性来访问 `String` 值的 `Unicode` 标量表示法。这个属性的类型是 `UnicodeScalarView`，它是 `UnicodeScalar` 类型值的合集。

// 每一个 UnicodeScalar都有值属性可以返回一个标量的21位值，用 UInt32值表示：
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

// 68 111 103 33 128054”

/*:
 前三个UnicodeScalar值(68, 111, 103)的value属性仍然代表字符D、o和g。 第四个codeUnit值(8252)仍然是一个等于十六进制203C的十进制值。
 这个代表了DOUBLE EXCLAMATION MARK字符的 Unicode 标量U+203C。
 
 第五个UnicodeScalar值的value属性，128054，是一个十六进制1F436的十进制表示。其等同于DOG FACE的 Unicode 标量U+1F436。
 
 作为查询它们的value属性的一种替代方法，每个UnicodeScalar值也可以用来构建一个新的String值，比如在字符串插值中使用：
 
 */

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶


//: [上一页](@previous) | [下一页](@next)
