//: ## 链的多层连接

//: 你可以通过连接多个可选链来在模型中深入访问属性、方法以及下标。总之，多层可选链不会给返回的值添加多层的可选性。

//:也就是说：
//: - 如果你访问的值不是可选项，它会因为可选链而变成可选项；
//: - 如果你访问的值已经是可选的，它不会因为可选链而变得更加可选。

//:> 因此：如果你尝试通过可选链取回一个 Int 值，就一定会返回 Int? ，不论通过了多少层的可选链；类似地，如果你尝试通过可选链访问 Int? 值， Int? 一定就是返回的类型，无论通过了多少层的可选链。
//下边的栗子尝试访问 john 的 residence 属性里的 address 属性里的 street 属性。这里一共使用了两层可选链，以链接 residence 和 address 属性，它们都是可选类型：
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "Unable to retrieve the address."

//john.residence 的值当前包含合法的 Residence 实例。总之， john.residence.address 的值目前为 nil 。因此， john.residence?.address?.street 的调用失败了。
//需要注意的是上面的栗子中，你尝试取回的 street 属性。它的类型为 String? 。 john.residence?.address?.street 的返回值自然也是 String? ，即使对属性的可选项来说已经通过了两层可选链。

//如果你设置一个 Address 实例作为 john.residence.address 的值，并且为地址的 street 属性设置一个实际的值，你就可以通过多层可选链访问 street 属性的值了：
let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// Prints "John's street name is Laurel Street."

//在上面的栗子中，对 john.residence 的 address 属性赋值能够成功，是因为 john.residence 的值目前包含了一个可用的 Residence 实例。


//: [上一页](@previous) | [下一页](@next)
