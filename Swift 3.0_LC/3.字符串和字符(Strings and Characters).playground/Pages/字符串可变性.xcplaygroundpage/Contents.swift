//: ## 字符串可变性 (String Mutability)

//: 您可以通过将一个特定字符串分配给一个变量来对其进行修改，或者分配给一个常量来保证其不会被修改：
var variableString = "Horse"
variableString += " and carriage"       // variableString 现在为 "Horse and carriage"

let constantString = "Highlander"       //constantString += " and another Highlander"

// 这会报告一个编译错误 (compile-time error) - 常量字符串不可以被修改。

//:> 注意： 在 Objective-C 和 Cocoa 中，您需要通过选择两个不同的类(NSString和NSMutableString)来指定字符串是否可以被修改。

//: [上一页](@previous) | [下一页](@next)
