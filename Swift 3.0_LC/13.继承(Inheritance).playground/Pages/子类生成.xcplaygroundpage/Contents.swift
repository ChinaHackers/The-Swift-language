




//: - 子类生成（Subclassing）

// 子类生成（Subclassing）指的是在一个已有类的基础上创建一个新的类。子类继承超类的特性，并且可以进一步完善。你还可以为子类添加新的特性。

//为了指明某个类的超类，将超类名写在子类名的后面，用冒号分隔：
/*
class SomeClass: SomeSuperclass {
    // 这里是子类的定义
}
 */

//定义了一个叫Vehicle的基类
class Vehicle {
    
    // 声明了一个名为currentSpeed, 默认值是0.0的存储属性（属性类型推断为Double）
    var currentSpeed = 0.0
    var description: String {
        
        //currentSpeed属性的值被一个String类型的只读计算型属性description使用，用来创建车辆的描述
        return "旅行 \(currentSpeed) 英里每小时"
    }
    //    定义了一个名为makeNoise的方法
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}
//下一个例子，定义一个叫Bicycle的子类，继承成父类Vehicle：
class Bicycle: Vehicle {
   
    // Bicycle类还定义了一个默认值为false的存储型属性hasBasket（属性推断为Bool）
    var hasBasket = false
}

let bic = Bicycle()
bic.hasBasket = true

// 可以访问继承父类的属性
bic.currentSpeed = 15.0
print("Bicycle: \(bic.description)")
//新的Bicycle类自动获得Vehicle类的所有特性，比如currentSpeed和description属性，还有它的makeNoise()方法。


// Bicycle创建了一个名为 Tandem（双人自行车）的子类：
class Tandem: Bicycle {
    // 增加 currentNumberOfPassengers的存储型属性，默认值为0。
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")


//: [后退](@previous) | [重写](@next)
