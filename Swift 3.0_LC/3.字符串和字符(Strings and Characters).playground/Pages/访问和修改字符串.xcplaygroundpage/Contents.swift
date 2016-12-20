//: ## 访问和修改字符串 (Accessing and Modifying a String)
//: 你可以通字符串的属性和方法来访问和读取它，当然也可以用下标语法完成。

//: ---
//: #### 字符串索引 (String Indices)

/*:
 每一个`String`值都有一个关联的索引(index)类型`String.Index`，它对应着字符串中的每一个`Character`的位置。
 
 前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道 `Character` 的确定位置，就必须从`String`开头遍历每一个 `Unicode` 标量直到结尾。因此，`Swift` 的字符串不能用整数(integer)做索引。
 
 使用`startIndex`属性可以获取一个`String`的第一个`Character`的索引。使用 `endIndex` 属性可以获取最后一个`Character` 的后一个位置的索引。因此，`endIndex` 属性不能作为一个字符串的有效下标。如果`String`是空串，`startIndex`和 `endIndex` 是相等的。
 
 使用 `index(before:)` 和 `index(after:)` 方法来访问给定索引的前后。要访问给定索引更远的索引，你可以使用`index(_:offsetBy:)` 方法而不是多次调用这两个方法。
*/
//你可以使用下标语法来访问String特定索引的Character。
let greeting = "Guten Tag!"
greeting[greeting.startIndex]  // G

//使用 endIndex 属性可以获取最后一个Character 的后一个位置的索引。
greeting[greeting.index(before: greeting.endIndex)]   // !

greeting[greeting.index(after: greeting.startIndex)]    // u

//要访问给定索引更远的索引，你可以使用index(_:offsetBy:) 方法而不是多次调用这两个方法。
// 初始位置偏移7
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]     // a


// 首位字符 与 最后一个字符 的距离
let o = greeting.distance(from: greeting.startIndex, to: greeting.endIndex)
print(o)
//:试图获取越界索引对应的`Character，`将引发一个运行时错误。
//greeting[greeting.endIndex] // error
//greeting.endIndex.successor() // error

//: 使用`characters`属性的`indices`属性会创建一个包含全部索引的范围`(Range)，`用来在一个字符串中访问单个字符。
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: " ")
}
// 打印输出 "G u t e n   T a g !"
//: ---
//: ### 插入和删除 (Inserting and Removing)
//: 调用 `insert(_:at:)` 方法可以在一个字符串的指定索引插入一个字符。
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)       // welcome now 现在等于 "hello!"
//: 调用 `insert(contentsOf:at:) `方法可以在一个字符串的指定索引插入一个字符串。
welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
//: 调用 `remove(at:)` 方法可以在一个字符串的指定索引删除一个字符。
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)                                  // welcome 现在等于 "hello there"
//: 调用 `removeSubrange(_:)` 方法可以在一个字符串的指定索引删除一个子字符串。
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)                   // welcome 现在等于 "hello"
//:>注意: 你可以在任何遵循了 `RangeReplaceableIndexable` 协议的类型中使用 `insert(_:at:) ， insert(contentsOf:at:) ， remove(at:) `方法。这包括了这里使用的 `String` ，同样还有集合类型比如 `Array ， Dictionary` 和 `Set 。`

//: [上一页](@previous) | [下一页](@next)
