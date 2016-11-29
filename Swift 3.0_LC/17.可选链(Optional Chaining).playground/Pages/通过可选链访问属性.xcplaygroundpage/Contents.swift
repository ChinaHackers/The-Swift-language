//: ## 通过可选链访问属性
//: 如同可选链代替强制展开中展示的那样，你可以使用可选链来访问可选值里的属性，并且检查这个属性的访问是否成功。

//使用上边定义的类来创建一个新得 Person 实例，并且尝试如之前一样访问它的 numberOfRooms 属性：



class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
    var address: Address?
}
let john = Person()
john.residence = Residence()


if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// Prints "Unable to retrieve the number of rooms."

//由于 john.residence 是 nil ，这个可选链调用与之前一样失败了。

//你同样可以尝试通过可选链来给属性赋值：
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

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

//: 在这个例子中，给 john.residence 的 address 属性赋值会失败，因为 john.residence 目前是 nil 。
//这个赋值是可选链的一部分，也就是说 = 运算符右手侧的代码都不会被评判。在先前的栗子中，不容易看出 someAddress 没有被评判，因为赋值一个常量不会有任何副作用。下边的栗子做同样的赋值，但它使用一个函数来创建地址。函数会在返回值之前打印“函数被调用了”，这可以让你看到 = 运算符右手侧是否被评判。


func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john.residence?.address = createAddress()

//你可以看到 createAddress() 函数没有被调用，因为没有任何东西打印出来。

//: [上一页](@previous) | [下一页](@next)
