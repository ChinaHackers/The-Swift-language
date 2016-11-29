//: ## 可选链代替强制展开
//: - 你可以通过在你希望如果可选项为非 `nil` 就调用属性、方法或者脚本的可选值后边使用问号（ ? ）来明确可选链。这和在可选值后放叹号（ ! ）来强制展开它的值非常类似。主要的区别在于可选链会在可选项为 `nil` 时得体地失败，而强制展开则在可选项为 `nil` 时触发运行时错误。
//: - 为了显示出可选链可以在 `nil` 值上调用，可选链调用的结果一定是一个可选值，就算你查询的属性、方法或者下标返回的是非可选值。你可以使用这个可选项返回值来检查可选链调用是成功（返回的可选项包含值），还是由于链中出现了 `nil` 而导致没有成功（返回的可选值是 `nil` ）。
//: - 另外，可选链调用的结果与期望的返回值类型相同，只是包装成了可选项。通常返回 `Int` 的属性通过可选链后会返回一个 `Int?` 。
//接下来的一些代码片段演示了可选链与强制展开的不同并允许你检查是否成功。
//首先，定义两个类， Person 和 Residence ：
class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
/*:
 `Residence` 实例有一个 `Int` 属性叫做 `numberOfRooms` ，它带有默认值 1 .

 `Person` 实例有一个 `Residence?` 类型的可选 `residence` 属性。
 如果你创建压根儿新的 `Person` 实例，得益于可选项的特性，它的 `residence` 属性会默认初始化为 `nil` 。
 */
// 下面的代码中， `john` 拥有值为 `nil` 的 `residence` 属性：
let john = Person()
//:如果你尝试访问这个人的 residence 里的 numberOfRooms 属性，通过在 residence 后放一个叹号来强制展开它的值，你会触发一个运行时错误，因为 residence 根本没有值可以展开：
//let roomCount = john.residence!.numberOfRooms
// this triggers a runtime error
//:上边的代码会在 john.residence 有一个非 nil 值时成功并且给 roomCount 赋值一个包含合适房间号的 Int 值。总之，这段代码一定会在 residence 为 nil 时触发运行时错误，如同上边展示的那样。
//可选链提供另一种访问 numberOfRooms 的方法。要使用可选链，使用问号而不是叹号：
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."
/*:
 这将会告诉 `Swift` 把可选 `residence` 属性“链接”起来并且取回 `numberOfRooms` 的值，如果 `residence` 存在的话。

由于尝试访问 `numberOfRooms` 有失败的潜在可能，可选链尝试返回一个 `Int?` 类型的值，或者说“可选 `Int` ”。当 `residence` 为 `nil` ，就如同上边的例子，这个可选 `Int` 将也会是 `nil` ，来反映出不能访问 `numberOfRooms` 这个事实。可选 `Int` 通过可选绑定来展开整数并赋值非可选值给 `roomCount` 变量。
*/
//:> 注意: 就算 `numberOfRooms` 是非可选的 `Int` 也是适用的。事实上通过可选链查询就意味着对 `numberOfRooms` 的调用一定会返回 `Int?` 而不是 `Int` 。
//你可以赋值一个 Residence 实例给 john.residence ，这样它就不会再有 nil 值：
john.residence = Residence()
//: `john.residence` 现在包含了实际的 `Residence` 实例，而不是 `nil` 。如果你尝试用与之前相同的可选链访问 `numberOfRooms` ，它就会返回一个 `Int?` 包含默认 `numberOfRooms` 值 1 ：
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "John's residence has 1 room(s)."
//: [上一页](@previous) | [下一页](@next)
