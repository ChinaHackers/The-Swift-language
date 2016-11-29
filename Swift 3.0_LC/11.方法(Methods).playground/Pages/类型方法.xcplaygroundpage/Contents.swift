//: ## 类型方法 (Type Methods)
//: 实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做`类型方法`（`Type Methods`）。在方法的func关键字之前加上关键字`static`，来指定类型方法。类还可以用关键字`class`来允许子类重写父类的方法实现。
//:> 注意: 在 `Objective-C` 中，你只能为 `Objective-C` 的类类型`（classes）`定义类型方法`（type-level methods）`。在 `Swift` 中，你可以为所有的类、结构体和枚举定义类型方法。每一个类型方法都被它所支持的类型显式包含。
// 类型方法 和 实例方法 一样用 (点语法) 调用。
// 但是，你是在类型上调用这个方法，而不是在实例上调用。

//下面是如何在SomeClass类上调用类型方法的例子：
class SomeClass {
    class func someTypeMethod() {
        // 类型方法的实现在这
    }
}

SomeClass.someTypeMethod()
// 练习
// 在方法前加上 static 关键字声明结构体和枚举的类型方法
// 类可能会用关键字 class 来允许子类重写父类的实现方法
class Math {
    
    // 类型方法
    class func abs(number: Int) -> Int {
        if number < 0 {
            return (-number)
        }
        else {
            return number
        }
    }
}

struct absno {
    // 类型方法
    static func abs(number: Int) -> Int {
        if number < 0 {
            return (-number)
        }
        else {
            return number
        }
    }
}

// 调用 Math 的 abs 方法, -35 < 0 成立, 返回 --35 = 35
// 调用 absno 的 abs 方法, -5 < 0 成立, 返回 --5 = 5

let no = Math.abs(number: -35)
let num = absno.abs(number: -5)

//以上程序执行输出结果为：
//35
//5

//:[上一页](@previous)
