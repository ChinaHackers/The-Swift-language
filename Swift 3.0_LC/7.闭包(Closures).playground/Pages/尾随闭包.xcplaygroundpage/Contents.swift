//: ## 尾随闭包
//: - 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。

/*
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure({
    // 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}
 
 */

var names = ["AT", "AE", "D", "S", "BE"]

//尾随闭包
//sorted() 后的 { $0 > $1} 为尾随闭包。
var reversed = names.sorted() { $0 > $1 }
print(reversed)                     //["S", "D", "BE", "AT", "AE"]
//:> 注意： 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。

//: 如果闭包表达式作为函数的唯一实际参数传入，而你又使用了尾随闭包的语法，那你就不需要在函数名后边写圆括号了：
reversed = names.sorted{ $0 > $1 }


//: [上一页](@previous) | [下一页](@next)
