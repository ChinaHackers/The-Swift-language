//: - 定义一个基类（Defining a Base Class）

//: - 不继承于其它类的类，称之为基类（base class）。

//:> 注意: Swift 中的类并不是从一个通用的基类继承而来。如果你不为你定义的类指定一个超类的话，这个类就自动成为基类。


//定义了一个叫Vehicle的基类
class Vehicle {
    
    // 声明了一个名为currentSpeed, 默认值是0.0的存储属性（属性类型推断为Double）
    var currentSpeed = 0.0
    var description: String {
        
        //currentSpeed属性的值被一个String类型的只读计算型属性description使用，用来创建车辆的描述
        return "旅行 \(currentSpeed) 英里每小时"
    }
//    定义了一个名为makeNoise的方法。这个方法实际上不为Vehicle实例做任何事，但之后将会被Vehicle的子类定制：
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}

//您可以用初始化语法创建一个Vehicle的新实例，即类名后面跟一个空括号：

let someVehicle = Vehicle()

//现在已经创建了一个Vehicle的新实例，你可以访问它的description属性来打印车辆的当前速度：

print("Vehicle: \(someVehicle.description)")
// Vehicle: 旅行 0.0 英里每小时

//Vehicle类定义了一个通用特性的车辆类，实际上没什么用处。为了让它变得更加有用，需要完善它从而能够描述一个更加具体类型的车辆。



//: [后退](@previous) | [子类生成](@next)
