//: ## 连接字符串和字符 (Concatenating Strings and Characters)
//: #### 字符串可以通过加法运算符（+）相加在一起（或称“连接”）创建一个新的字符串
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2     // welcome 现在等于 "hello there"
//: 也可以通过加法赋值运算符 `(+=)` 将一个字符串添加到一个已经存在字符串变量上
var instruction = "look over"
instruction += string2              // instruction 现在等于 "look over there"
//: 可以用 `append()` 方法将一个字符附加到一个字符串变量的尾部：
let exclamationMark1: Character = "!"
welcome.append(exclamationMark1)    // welcome 现在等于 "hello there!"
//:> 注意：您不能将一个 `String` 或者 `Character` 添加到一个已经存在的 `Character` 变量上，因为 `Character` 只能包含一个字符。

//: [上一页](@previous) | [下一页](@next)
