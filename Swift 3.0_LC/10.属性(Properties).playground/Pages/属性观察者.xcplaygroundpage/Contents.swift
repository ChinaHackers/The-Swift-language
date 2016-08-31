//: [后退](@previous)

//: - 属性观察器

//: - 属性观察者监控和响应属性值的变化。每次属性被设置的时候都会调用属性观察者，即便新值和旧值有时相同
//: - 除了延迟存储属性之外的其他存储属性,均可添加属性观察器.
//: - 可以通过重写属性的方式, 为继承的属性（包括存储属性和计算属性）添加属性观察器
//: ---
//: - 可以为属性添加如下的一个或全部观察器：
//: - willSet 在新的值被设置之前调用
//: - didSet 在新的值被设置之后立即调用

//: willSet 观察器会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称 newValue 表示。

//: didSet 观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名 oldValue。如果在 didSet 方法中再次对该属性赋值，那么新值会覆盖旧的值。
//:> 注意 : 父类的属性在子类的构造器中被赋值时，它在父类中的 `willSet` 和 `didSet` 观察器会被调用，随后才会调用子类的观察器。在父类初始化方法调用之前，子类给属性赋值时，观察器不会被调用
// 定义一个名为 Person 的类
class Person {
    
    // 定义一个 Int 类型的属性 weight，它是一个存储属性，包含 willSet 和 didSet 观察器。
    // 当 weight 被设置新值的时候，它的 willSet 和 didSet 观察器都会被调用，即使新值和当前值完全相同时也会被调用.
    //: 存储型属性
    var weight: Float = 70 {
        
        // willSet 观察器, 没有指定属性值, 则参数仍然可用，这时使用默认名称 newValue 表示。
        // 这个观察器只是简单的将新的值输出
        willSet {
            print("weight willSet is \(newValue)")
        }
        
        //didSet 观察器在 weight 的值改变后调用，它把新值和旧值进行对比，如果数值增加,输出一个消息表示增加了多少。
        // didSet 观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名 oldValue
        didSet {
            if weight > oldValue {
                
                print("weight didSet 增加了 \(weight -  oldValue)")
            }
        }
    }
    
}

let p = Person()
p.weight = 80     // 调用 Person 的 willSet 和 didSet 观察器
p.weight = 120   //  调用 Person 的 willSet 和 didSet 观察器


//: [全局变量和局部变量](@next)
