//: ## 用可选返回值链接方法

//先前的例子说明了如何通过可选链来获取可选类型属性的值。你还可以通过可选链来调用返回可选类型的方法，并且如果需要的话可以继续对方法的返回值进行链接。

//在下面的栗子通过可选链来调用 Address 的 buildingIdentifier() 方法。这个方法返回 String? 类型值。正如上面所说，通过可选链调用的方法的最终返回的类型还是 String? ：
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}
// Prints "John's building identifier is The Larches."

//如果你要进一步对方法的返回值进行可选链，在方法 buildingIdentifier() 的圆括号后面加上可选链问号：

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
// Prints "John's building identifier begins with "The"."
//:> 注意: 在上面的例子中，在方法的圆括号后面加上可选链问号，是因为链中的可选项是 buildingIdentifier() 的返回值，而不是 buildingIdentifier() 方法本身。


//: [上一页](@previous) | [下一页](@next)
