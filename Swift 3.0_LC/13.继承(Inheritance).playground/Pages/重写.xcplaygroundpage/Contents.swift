//: - 重写方法
//: - 在子类中，你可以重写继承来的实例方法或类方法，提供一个定制或替代的方法实现。

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

//定义了Vehicle的一个子类，叫Train，它重写了从Vehicle类继承来的makeNoise()方法：
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

//创建一个Train的新实例，并调用了它的makeNoise()方法，你就会发现Train版本的方法被调用：
let train = Train()
train.makeNoise()
// 打印 "Choo Choo"
//: ----
//: - 重写属性
//你可以重写继承来的实例属性或类型属性，提供自己定制的 getter 和 setter，或添加属性观察器使重写的属性可以观察属性值什么时候发生改变。
//: - 重写属性的 Getters 和 Setters
//你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性。子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。你在重写一个属性时，必需将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同类型的属性相匹配的。

//你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供 getter 和 setter 即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。
//:> 注意: 如果你在重写属性中提供了 setter，那么你也一定要提供 getter。如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。
//以下的例子定义了一个新类，叫Car，它是Vehicle的子类
class Car: Vehicle {
    
    // 一个新的存储型属性叫做gear，默认值为整数1。
    var gear = 1
    
    //这个类引入了Car类重写了继承自Vehicle的description属性，提供包含当前档位的自定义描述：
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

//重写的description属性首先要调用 super.description 返回 Vehicle 类的 description 属性。之后，Car类版本的description在末尾增加了一些额外的文本来提供关于当前档位的信息。

//你创建了Car的实例并且设置了它的gear和currentSpeed属性，你可以看到它的description返回了Car中的自定义描述：

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

//: ----

//: - 重写属性观察器（Property Observer）
//你可以通过重写属性为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会被通知到，无论那个属性原本是如何实现的。关于属性观察器的更多内容，请看属性观察器。
//:> 注意 : 你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供willSet或didSet实现是不恰当。
//:>> 此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。
//下面的例子定义了一个新类叫AutomaticCar，它是Car的子类。AutomaticCar表示自动挡汽车，它可以根据当前的速度自动选择合适的挡位:
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

//当你设置AutomaticCar的currentSpeed属性，属性的didSet观察器就会自动地设置gear属性，为新的速度选择一个合适的挡位。具体来说就是，属性观察器将新的速度值除以10，然后向下取得最接近的整数值，最后加1来得到档位gear的值。例如，速度为35.0时，挡位为4：

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4


//: [后退](@previous) | [防止重写](@next)