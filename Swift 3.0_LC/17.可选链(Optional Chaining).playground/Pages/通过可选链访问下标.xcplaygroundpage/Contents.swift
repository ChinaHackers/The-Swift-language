//: ## 通过可选链访问下标
//: 你可以使用可选链来给可选项下标取回或设置值，并且检查下标的调用是否成功。

//:> 注意: 当你通过可选链访问一个可选项的下标时，你需要把问号放在下标括号的前边，而不是后边。可选链的问号一定是紧跟在可选项表达式的后边的。

//下边的例子尝试使用下标取回 Residence 类里 john.residence 属性的数组 rooms 里第一个房间的名字。由于 john.residence 目前是 nil ，下标的调用失败了：
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "Unable to retrieve the first room name."

//: 可选链问号在下标的调用中紧跟 john.residence ，在下标的方括号之前，因为 john.residence 在可选链被访问时是可选值。
//同样的，你可以尝试通过在可选链里用下标来设置一个新值：
john.residence?[0] = Room(name: "Bathroom")

//这个下标设置的尝试同样失败了，因为 residence 目前还是 nil 。
//如果你创建并且赋值一个实际的 Residence 实例给 john.residence ，在 rooms 数组里添加一个或者多个 Room 实例，你就可以通过可选链使用 Residence 下标来访问 rooms 数组里的实际元素了：

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."

//: [上一页](@previous) | [下一页](@next)
