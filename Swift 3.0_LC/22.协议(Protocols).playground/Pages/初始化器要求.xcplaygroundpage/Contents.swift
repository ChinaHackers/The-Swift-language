//: ## 初始化器要求

//:协议可以要求遵循协议的类型实现指定的初始化器。和一般的初始化器一样，只用将初始化器写在协议的定义当中，只是不用写大括号也就是初始化器的实体：
/*
protocol SomeProtocol {
    init(someParameter: Int)
}
*/
//: ### 协议初始化器要求的类实现

//:你可以通过实现指定初始化器或便捷初始化器来使遵循该协议的类满足协议的初始化器要求。在这两种情况下，你都必须使用 required 关键字修饰初始化器的实现：
/*
class SomeClass: SomeProtocol {
   
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}
 */
//:在遵循协议的类的所有子类中， `required` 修饰的使用保证了你为协议初始化器要求提供了一个明确的继承实现。
//:> 注意: 由于 `final` 的类不会有子类，如果协议初始化器实现的类使用了 `final` 标记，你就不需要使用 `required` 来修饰了。因为这样的类不能被继承子类。详见阻止重写了解更多 `final` 修饰符的信息。

//如果一个子类重写了父类指定的初始化器，并且遵循协议实现了初始化器要求，那么就要为这个初始化器的实现添加 required 和 override 两个修饰符：

protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}

//: ### 可失败初始化器要求
//: - 如同可失败初始化器定义的一样，协议可以为遵循该协议的类型定义可失败的初始化器。
//: - 遵循协议的类型可以使用一个可失败的或不可失败的初始化器满足一个可失败的初始化器要求。不可失败初始化器要求可以使用一个不可失败初始化器或隐式展开的可失败初始化器满足。


//: [上一页](@previous) | [下一页](@next)
