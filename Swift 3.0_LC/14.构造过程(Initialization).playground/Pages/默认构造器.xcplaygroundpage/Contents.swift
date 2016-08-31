//: - 默认构造器

//如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么 Swift 会给这些结构体或类提供一个默认构造器（default initializers）。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。

//下面例子中创建了一个类ShoppingListItem，它封装了购物清单中的某一物品的属性：名字（name）、数量（quantity）和购买状态 purchase state：

class ShoppingListItem {
    var name: String?   //名字
    var quantity = 1    // 数量
    var purchased = false   //购物状态
}
var item = ShoppingListItem()
//: - 由于 `ShoppingListItem`类中的所有属性都有默认值，且它是没有父类的基类，它将自动获得一个可以为所有属性设置默认值的默认构造器（尽管代码中没有显式为`name`属性设置默认值，但由于name是可选字符串类型，它将默认设置为nil）。上面例子中使用默认构造器创造了一个`ShoppingListItem`类的实例（使用ShoppingListItem()形式的构造器语法），并将其赋值给变量item。

//: - 结构体的逐一成员构造器

//: 如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。

//逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。我们在调用逐一成员构造器时，通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值。

//下面例子中定义了一个结构体Size，它包含两个属性width和height。Swift 可以根据这两个属性的初始赋值0.0自动推导出它们的类型为Double。

//结构体Size自动获得了一个逐一成员构造器init(width:height:)。你可以用它来为Size创建新的实例：

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)







//: [Previous](@previous) | [Next](@next)
