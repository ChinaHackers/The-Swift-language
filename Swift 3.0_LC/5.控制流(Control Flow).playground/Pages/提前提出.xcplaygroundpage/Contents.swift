//: ## guard 语句
//: guard 语句，类似于 if 语句，基于布尔值表达式来执行语句。使用 guard 语句来要求一个条件必须是真才能执行 guard 之后的语句。与 if 语句不同， guard 语句总是有一个 else 分句—— else 分句里的代码会在条件不为真的时候执行。

/*
像if语句一样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else分句，如果条件不为真则执行else分句中的代码。
*/


func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name": "John"])
// 输出 "Hello John!"
// 输出 "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// 输出 "Hello Jane!"
// 输出 "I hope the weather is nice in Cupertino."

//:> 如果 `guard` 语句的条件被满足，则在保护语句的封闭大括号结束后继续执行代码。任何使用了可选绑定作为条件的一部分并被分配了值的变量或常量对于剩下的保护语句出现的代码段是可用的。
 
//:> 如果条件不被满足，在`else`分支上的代码就会被执行。这个分支必须转移控制以退出 `guard` 语句出现的代码段。它可以用控制转移语句如`return`, `break`, `continue` 或者 `throw` 做这件事，或者调用一个不返回的方法或函数，例如`fatalError()`。

//: [后退](@previous) | [检测API可用性](@next)
