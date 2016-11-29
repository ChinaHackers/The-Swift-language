//: ## 可失败构造器
//: 如果一个`类`，`结构体`或`枚举类型`的对象，在构造自身的过程中有可能失败，则为其定义一个`可失败构造器`
//: - 变量初始化失败可能的原因有：
//: * 传入无效的参数值。
//: * 缺少某种所需的外部资源。
//: * 没有满足特定条件。

//: 为了妥善处理这种构造过程中可能会失败的情况。
//: 你可以在一个类，结构体或是枚举类型的定义中，添加一个或多个可失败构造器。其语法为在init关键字后面加添问号(init?)。

//: ---
//: ### 结构体的可失败构造器
//: 定义了一个名为 `Animal` 的结构体，其中有一个名为 `species` 的，`String`类型的常量属性。
//: 同时该结构体还定义了一个，带一个`String`类型参数 `species` 的,可失败构造器。这个可失败构造器，被用来检查传入的参数是否为一个空字符串，如果为空字符串，则该可失败构造器，构建对象失败，否则成功。
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

//: 通过该可失败构造器来构建一个`Animal`的对象，并检查其构建过程是否成功. `someCreature` 的类型是 `Animal?` 而不是 `Animal`
let someCreature = Animal(species: "长颈鹿")

// 打印 "动物初始化为长颈鹿"
if let giraffe = someCreature {
    print("动物初始化为\(giraffe.species)")
}

//以上程序执行输出结果为：
//动物初始化为长颈鹿

//: ---
//: ### 枚举类型的可失败构造器
//: 你可以通过构造一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员。

//: 定义了一个名为 `TemperatureUnit` 的枚举类型。其中包含了三个可能的枚举成员`(Kelvin，Celsius，`和 `Fahrenheit)`和一个被用来找到`Character`值所对应的枚举成员的可失败构造器：
enum TemperatureUnit {
    // 开尔文，摄氏，华氏
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("这是一个已定义的温度单位，所以初始化成功。")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("这不是一个已定义的温度单位，所以初始化失败。")
}
//以上程序执行输出结果为：
//这是一个已定义的温度单位，所以初始化成功。
//这不是一个已定义的温度单位，所以初始化失败。

//: ---
//: ### 类的可失败构造器
//: 值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。
//: 但是，类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为。
//定义了一个名为 StudRecord 的类，因为 studname 属性是一个常量，所以一旦 StudRecord 类构造成功，studname 属性肯定有一个非nil的值。
class StudRecord {
    let studname: String!
    init?(studname: String) {
        self.studname = studname
        if studname.isEmpty { return nil }
    }
}
if let stname = StudRecord(studname: "失败构造器") {
    print("模块为 \(stname.studname)")
}
//以上程序执行输出结果为：
//模块为 失败构造器

//: [上一页](@previous) | [下一页](@next)
