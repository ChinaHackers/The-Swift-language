//: ## 非逃逸闭包(Nonescaping Closures)

//: - 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注`@noescape`，用来指明这个闭包是不允许“逃逸”出这个函数的。将闭包标注`@noescape`能使编译器知道这个闭包的生命周期（：闭包只能在函数体中被执行，不能脱离函数体执行，所以编译器明确知道运行时的上下文），从而可以进行一些比较激进的优化。

func someFunctionWithNoescapeClosure( closure: @noescape () -> Void) {
    closure()
}

// 举个例子，sorted(isOrderedBefore:) 方法接受一个用来进行元素比较的闭包作为参数。这个参数被标注了@noescape，因为它确保自己在排序结束之后就没用了。

//: - 一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。举个例子，很多启动异步操作的函数接受一个闭包参数作为 `completion handler`。这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调用。例如：

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}
//:  `someFunctionWithEscapingClosure(_:)`函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中。如果你试图将这个参数标注为`@noescape`，你将会获得一个编译错误。

//:将闭包标注为`@noescape`使你能在闭包中隐式地引用`self`
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNoescapeClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)       // prints "200"

completionHandlers.first?()
print(instance.x)       // prints "100"

//: [上一页](@previous) | [自动闭包](@next)
