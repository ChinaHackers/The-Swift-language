
//: ## 初始化空字符串 (Initializing an Empty String)

//: 要创建一个空字符串作为初始值，可以将空的字符串字面量赋值给变量，也可以初始化一个新的String实例：
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法
// 两个字符串均为空并等价。
//: 您可以通过检查其 `Boolean` 类型的 `isEmpty` 属性来判断该字符串是否为空：
if emptyString.isEmpty {
    print("Nothing to see here")
} else {
    print("no isEmpty!")
}
// 打印输出："Nothing to see here"

//: [上一页](@previous) | [下一页](@next)
