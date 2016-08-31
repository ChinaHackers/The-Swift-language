//: ## 计算字符数量 (Counting Characters)

//: 如果想要获得一个字符串中 `Character` 值的数量，可以使用字符串的 `characters` 属性的 `count` 属性
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// 打印输出 "unusualMenagerie has 40 characters"



//:> 注意: 在 Swift 中，使用 可拓展的字符群集 作为`Character`值来连接或改变字符串时，并不一定会更改字符串的字符数量。

//: 例如，如果你用四个字符的单词 `cafe` 初始化一个新的字符串，然后添加一个COMBINING ACTUE ACCENT(U+0301)作为字符串的结尾。最终这个字符串的字符数量仍然是4，因为第四个字符是é，而不是e：
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")
// 打印输出 "the number of characters in café is 4"

/*:
 注意:
 可扩展的字符群集可以组成一个或者多个 `Unicode` 标量。
 这意味着不同的字符以及相同字符的不同表示方式可能需要不同数量的内存空间来存储。
 所以 `Swift` 中的字符在一个字符串中并不一定占用相同的内存空间数量。
 因此在没有获取字符串的可扩展的字符群的范围时候，就不能计算出字符串的字符数量。
 如果您正在处理一个长字符串，需要注意`characters`属性必须遍历全部的 `Unicode` 标量，来确定字符串的字符数量。
 
 通过`characters`属性返回的字符数量并不总是与包含相同字符的 `NSString` 的 `length` 属性相同。
 
 `NSString`的`length`属性是利用 UTF-16 表示的十六位代码单元数字，而不是 Unicode 可扩展的字符群集。
 
 作为佐证，当一个`NSString`的`length`属性被一个`Swift`的`String`值访问时，实际上是调用了`utf16Count`。
 
 */


//: [上一页](@previous) | [下一页](@next)
