//: ## 为可选链定义模型类
//: 你可以使用可选链来调用属性、方法和下标不止一个层级。这允许你在相关类型的复杂模型中深入到子属性，并检查是否可以在这些自属性里访问属性、方法和下标。
//下边的代码段定义了四个模型类用于随后的栗子，包括多层可选链的栗子。这些栗子通过添加 Room 和 Address 类扩展了上边的 Person 和 Residence 模型，以及相关的属性、方法和下标。
//Person 类与之前的定义方式相同：
class Person {
    var residence: Residence?
}

//Residence 类比以前要复杂一些。这次， Residence 类定义了一个叫做 rooms 的变量属性，它使用一个空的 [Room] 类型空数组初始化：
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
//: - 由于这个版本的 `Residence` 储存了 `Room` 实例的数组，它的 `numberOfRooms` 属性使用计算属性来实现，而不是储存属性。计算属性 `numberOfRooms` 只是返回`rooms`数组的 `count` 属性值。
//: - 作为给它的 `rooms` 数组赋值的快捷方式，这个版本的 `Residence` 提供了一个可读写的下标来访问 `rooms` 数组的索引位置。
//: - 这个版本的 `Residence` 同样提供了一个叫做 `printNumberOfRooms` 的方法，它打印住所中的房间号。
//: - 最终， `Residence` 定义了一个可选属性叫做 `address` ，它是一个 `Address?` 类型，这个属性的 `Address` 类类型在下面定义。

//: `rooms` 数组使用的 `Room` 类型仅有一个属性叫做 `name` ，还有一个初始化器来给这个属性设置合适的房间名：
class Room {
    let name: String
    init(name: String) { self.name = name }
}
//: 这个模型的最后一个类型叫做 `Address` 。这个类型有三个 `String?` 类型可选属性。前两个属性， `buildingName` 和 `buildingNumber` ，是定义地址中特定建筑部分的代替方式。第三个属性， `street` ，是给地址里街道命名的：
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}
//: `Address` 类同样提供了一个方法叫做 `buildingIdentifier()` ，它有一个 `String?` 类型的返回值。这个方法检查地址的属性并返回 `buildingName` 如果它有值的话，或者把 `buildingNumber` 与 `street` 串联起来，如果它们都有值的话，或者就是 `nil` 。

//: [上一页](@previous) | [下一页](@next)
