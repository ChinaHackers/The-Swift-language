//: ## 函数嵌套
//: - 这章中你所见到的所有函数都叫全局函数（global functions），它们定义在全局域中。
//: - 你也可以把函数定义在别的函数体中，称作嵌套函数（nested functions）。

//:  默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数（enclosing function）调用。一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用。
//你可以重写`chooseStepFunction(backward:)`函数, 来返回嵌套函数
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)
// moveNearerToZero现在指的是嵌套stepForward()函数

while currentValue != 0 {
    
    print("\(currentValue)... ")
    
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// -4...
// -3...
// -2...
// -1...
// zero!

//: [上一页](@previous)
