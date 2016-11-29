//: ## 通过可选链调用方法
//: 你可以使用可选链来调用可选项里的方法，并且检查调用是否成功。你甚至可以在没有定义返回值的方法上这么做。

//Residence 类中的 printNumberOfRooms() 方法打印了当前 numberOfRooms 的值。方法看起来长这样：
func printNumberOfRooms() {
    print("The number of rooms is \(printNumberOfRooms)")
}

//: 这个方法没有指定返回类型。总之，如没有返回值的函数中描述的那样，函数和方法没有返回类型就隐式地指明为 Void 类型。意思是说它们返回一个 () 的值或者是一个空的元组。
//: 如果你用可选链在可选项里调用这个方法，方法的返回类型将会是 Void? ，而不是 Void ，因为当你通过可选链调用的时候返回值一定会是一个可选类型。这允许你使用 if 语句来检查是否能调用 printNumberOfRooms() 方法，就算是方法自身没有定义返回值也可以。通过对比调用 printNumberOfRooms 返回的值是否为 nil 来确定方法的调用是否成功：


class Person {
    var residence: Residence?
}
let john = Person()

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
// Prints "It was not possible to print the number of rooms."

//: 如果你尝试通过可选链来设置属性也是一样的。上边通过可选链访问属性中的例子尝试设置 address 值给 john.residence ，就算是 residence 属性是 nil 也行。任何通过可选链设置属性的尝试都会返回一个 Void? 类型值，它允许你与 nil 比较来检查属性是否设置成功：

if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
// Prints "It was not possible to set the address."


//: [上一页](@previous) | [下一页](@next)
