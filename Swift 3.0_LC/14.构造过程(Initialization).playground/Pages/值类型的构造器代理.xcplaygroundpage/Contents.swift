//: ## 值类型的构造器代理
//: - `构造器`可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为`构造器代理`，它能减少多个构造器间的代码重复。
//: - `构造器代理`的`实现规则`和`形式`在`值类型`和`类类型`中有所不同。值类型（结构体和枚举类型）不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给自己的其它构造器。类则不同，它可以继承自其它类（请参考继承），这意味着类有责任保证其所有继承的存储型属性在构造时也能正确的初始化。这些责任将在后续章节类的继承和构造过程中介绍。
//: - 对于值类型，你可以使用self.init在自定义的构造器中引用相同类型中的其它构造器。并且你只能在构造器内部调用self.init。
//: - 如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器（如果是结构体，还将无法访问逐一成员构造器）。这种限制可以防止你为值类型增加了一个额外的且十分复杂的构造器之后,仍然有人错误的使用自动生成的构造器

//:> 注意: 假如你希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展（extension）中，而不是写在值类型的原始定义中。想查看更多内容，请查看扩展章节。
//定义了一个结构体Rect，用来代表几何矩形。这个例子需要两个辅助的结构体Size和Point，它们各自为其所有的属性提供了初始值0.0。
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
//: - 你可以通过以下三种方式为`Rect`创建实例——使用被初始化为默认值的`origin`和`size`属性来初始化；提供指定的`origin`和`size`实例来初始化；提供指定的`center`和`size`来初始化。在下面`Rect`结构体定义中，我们为这三种方式提供了三个自定义的构造器：
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
//: - 第一个Rect构造器`init()`，在功能上跟没有自定义构造器时自动获得的默认构造器是一样的。这个构造器是一个空函数，使用一对大括号{}来表示，它没有执行任何构造过程。调用这个构造器将返回一个Rect实例，它的`origin`和`size`属性都使用定义时的默认值`Point`(x: 0.0, y: 0.0)和`Size`(width: 0.0, height: 0.0)：
let basicRect = Rect()
// basicRect 的 origin 是 (0.0, 0.0)，size 是 (0.0, 0.0)
//: - 第二个Rect构造器`init`(origin:size:)，在功能上跟结构体在没有自定义构造器时获得的逐一成员构造器是一样的。这个构造器只是简单地将`origin`和`size`的参数值赋给对应的存储型属性：
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
// originRect 的 origin 是 (2.0, 2.0)，size 是 (5.0, 5.0)
//: - 第三个Rect构造器`init`(center:size:)稍微复杂一点。它先通过`center`和`size`的值计算出`origin`的坐标，然后再调用（或者说代理给）`init`(origin:size:)构造器来将新的 `origin`和 `size`值赋值到对应的属性中：
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
// centerRect 的 origin 是 (2.5, 2.5)，size 是 (3.0, 3.0)

//构造器`init`(center:size:)可以直接将origin和size的新值赋值到对应的属性中。然而，利用恰好提供了相关功能的现有构造器会更为方便，构造器`init`(center:size:)的意图也会更加清晰。
//:> 注意: 如果你想用另外一种不需要自己定义`init()`和`init(origin:size:)`的方式来实现这个例子，请参考扩展。

//: [上一页](@previous) | [下一页](@next)
