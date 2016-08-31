//: - 实例方法
//: - 在 Swift 语言中，实例方法是属于某个特定`类`、`结构体`或者`枚举`类型实例的方法。
//: - 实例方法提供以下方法：
//: - 可以访问和修改实例属性
//: - 提供与实例目的相关的功能
//: - 实例方法要写在它所属的类型的前后大括号({})之间。
//: - 实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
//: - 实例方法只能被它所属的类的某个特定实例调用。
//: - 实例方法不能脱离于现存的实例而被调用。
// 语法:
/*
func funcname(参数) -> returntype {
    语句1
    语句2
        ……
    语句N
    return 参数
}
*/
//定义一个很简单的Counter类，Counter能被用来对一个动作发生的次数进行计数：
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

//: - Counter类定义了三个实例方法：
//: - increment让计数器按一递增；
//: - incrementBy(amount: Int)让计数器按一个指定的整数值递增；
//: - reset将计数器重置为0。

//Counter这个类还声明了一个可变属性count，用它来保持对当前计数器值的追踪。
//调用属性一样，用点语法（dot syntax）调用实例方法：

let counter = Counter() // 初始计数值是0

counter.increment()     // 计数值现在是1

counter.incrementBy(5)  // 计数值现在是6

counter.reset()         // 计数值现在是0



//: - 方法的局部参数名称和外部参数名称

//Swift 函数参数可以同时有一个局部名称（在函数体内部使用）和一个外部名称（在调用函数时使用)

//Swift 中的方法和 Objective-C 中的方法极其相似。像在 Objective-C 中一样，Swift 中方法的名称通常用一个介词指向方法的第一个参数，比如：with，for，by等等。
//Swift 默认仅给方法的第一个参数名称一个局部参数名称
//默认同时给第二个和后续的参数名称为全局参数名称

//以下实例中 'no1' 在swift中声明为局部参数名称。'no2' 用于全局的声明并通过外部程序访问。
class division {
    var count2: Int = 0
    func incrementBy(no1: Int, no2: Int) {
        count2 = no1 / no2
        print(count2)
    }
}

let counter2 = division()

counter2.incrementBy(1800, no2: 3)
counter2.incrementBy(1600, no2: 5)
counter2.incrementBy(11000, no2: 3)

//以上程序执行输出结果为：
//600
//320
//3666


//: - 在可变方法中给 self 属性赋值
//: - 类型的每一个实例都有一个隐含属性叫做 `self`，`self` 完全等同于该实例本身。
//你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例
class calculations {
    let a: Int
    let b: Int
    let res: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
        res = a + b
        print("Self 内: \(res)")
    }
    
    func tot(c: Int) -> Int {
        return res - c
    }
    
    func result() {
        print("结果为: \(tot(20))")
        print("结果为: \(tot(50))")
    }
}

let pri = calculations(a: 600, b: 300)
let sum = calculations(a: 1200, b: 300)

pri.result()
sum.result()

//以上程序执行输出结果为：
//Self 内: 900
//Self 内: 1500
//结果为: 880
//结果为: 850
//结果为: 1480
//结果为: 1450
//


//:[Next](@next)
