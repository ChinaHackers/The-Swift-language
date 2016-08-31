//: ## 自动闭包（Autoclosures）
//: 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够用一个普通的表达式来代替显式的闭包，从而省略闭包的花括号。

//: - 调用一个带有自动闭包的函数是很常见的，但实现这类函数就不那么常见了。比如说， `assert(condition:message:file:line:) `函数为它的 `condition`  和 `message` 形式参数接收一个自动闭包；它的 `condition` 形式参数只有在调试构建是才评判，而且 `message` 形式参数只有在 `condition` 是 `false` 时才评判。

//: - 自动闭包让你能够延迟求值，因为代码段不会被执行直到你调用这个闭包。延迟求值对于那些有副作用（Side Effect）和代价昂贵的代码来说是很有益处的，因为你能控制代码什么时候执行。下面的代码展示了闭包如何延时求值。

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)        // prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)        // prints "5"
print("Now serving \(customerProvider())!")     // 输出 "Now serving Chris!"
print(customersInLine.count)        // prints "4"

//: 尽管在闭包的代码中，`customersInLine`的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除。请注意，`customerProvider`的类型不是`String`，而是`() -> String`，一个没有参数且返回值为`String`的函数。

//将闭包作为参数传递给函数时，你能获得同样的延时求值行为。

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serveCustomer(customerProvider: () -> String) {
    
    print("Now serving \(customerProvider())!")
}
serveCustomer( customerProvider: { customersInLine.remove(at: 0) } )        // prints "Now serving Alex!"

//: - serveCustomer(_:)接受一个返回顾客名字的显式的闭包。下面这个版本的serveCustomer(_:)完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为@autoclosure来接收一个自动闭包。现在你可以将该函数当做接受String类型参数的函数来调用。customerProvider参数将自动转化为一个闭包，因为该参数被标记了@autoclosure特性。

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serveCustomer( customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
//serveCustomer(customersInLine.removeAtIndex(0))

// prints "Now serving Ewa!"
//:> 注意: 过度使用autoclosures会让你的代码变得难以理解。上下文和函数名应该能够清晰地表明求值是被延迟执行的。@autoclosure特性暗含了@noescape特性，这个特性在非逃逸闭包一节中有描述。如果你想让这个闭包可以“逃逸”，则应该使用@autoclosure(escaping)特性.

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders( customerProvider: @autoclosure(escaping) () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customerProvider: customersInLine.remove(at: 0))
collectCustomerProviders(customerProvider: customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// prints "Now serving Barry!"
// prints "Now serving Daniella!"

//: - 在上面的代码中，collectCustomerProviders(_:)函数并没有调用传入的customerProvider闭包，而是将闭包追加到了customerProviders数组中。这个数组定义在函数作用域范围外，这意味着数组内的闭包将会在函数返回之后被调用。因此，customerProvider参数必须允许“逃逸”出函数作用域。


//: [ 上一页](@previous)
