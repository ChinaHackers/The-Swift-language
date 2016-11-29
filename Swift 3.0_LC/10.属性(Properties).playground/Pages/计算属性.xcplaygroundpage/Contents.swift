//: ## 计算属性
//: - 除存储属性外，类、结构体和枚举可以定义计算属性。
//: - 计算属性: 不直接存储值，而是提供一个 `getter` 和一个可选的 `setter，`来间接获取和设置其他属性或变量的值。

/*:
 
 这个例子定义了 3 个结构体来描述几何形状：

 Point 封装了一个 (x, y) 的坐标

 Size 封装了一个 width 和一个 height

 Rect 表示一个有原点和尺寸的矩形
*/
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    // 计算属性应该定义成变量，因为它的值不固定，即便是只读计算属性
    var center: Point {
        get {
            let centerX = origin.x + (size.width) / 2
            let centerY = origin.y + (size.height) / 2
            return Point(x: centerX, y: centerY)
        }
        // 如果计算属性只有getter没有setter，该计算属性就是只读计算属性
        // 只读计算属性在声明中可以去掉get关键词和花括号
        
        // 设置属性center的值会调用它的 setter 来修改属性 origin 的 x 和 y 的值
        set(newCenter) {
            origin.x = newCenter.x - (size.width) / 2
            origin.y = newCenter.y - (size.height) / 2
            // 更便捷的写法是，省略定义Setter参数，用默认的newValue代替
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

//square 的 center 属性可以通过点运算符（square.center）来访问，这会调用该属性的 getter 来获取它的值
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)

print("Square.origin is now at (\(square.origin.x),\(square.origin.y))")

//: ---
//: ## 便捷 setter 声明
//: 如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。
//下面是使用了便捷 setter 声明的 AlternativeRect 结构体代码：
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {  // getter 获取值
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set { // setter 修改值
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
//: ---
//: ## 只读计算属性
//: 只有 getter 没有 `setter` 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。
//:> 注意:  必须使用 `var` 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，表示初始化后再也无法修改的值。

//: -定义了一个名为 Cuboid 的结构体，表示一个立方体，包含 `width`、`height` 和 `depth` 属性。结构体还有一个名为 `volume` 的只读计算属性用来返回立方体的体积。为 `volume` 提供 `setter` 毫无意义，因为无法确定如何修改 `width`、`height` 和 `depth` 三者的值来匹配新的 volume。然而，Cuboid 提供了一个只读计算属性来让外部用户直接获取体积.
// 只读计算属性的声明可以去掉 get 关键字和花括号：
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {    // 没有 setter ->只读计算属性
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("fourByFiveByTwo 的体积是 \(fourByFiveByTwo.volume)")
// 输出 "fourByFiveByTwo 的体积是 40.0"
//: [上一页](@previous) | [下一页](@next)
