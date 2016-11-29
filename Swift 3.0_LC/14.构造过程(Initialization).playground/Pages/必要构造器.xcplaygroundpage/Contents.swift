//: ## 必要构造器
//: 在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器：
class SomeClass {
    required init() {
        // 构造器的实现代码
    }
}
//: 在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符：

class SomeSubclass: SomeClass {
    required init() {
        // 构造器的实现代码
    }
}

//:> 注意: 如果子类继承的构造器能满足必要构造器的要求，则无须在子类中显式提供必要构造器的实现。

//: [上一页](@previous) | [下一页](@next)
