//: - 自定义构造过程

//你可以通过输入参数和可选类型的属性来自定义构造过程，也可以在构造过程中修改常量属性。这些都将在后面章节中提到。


//: - 构造参数
//自定义构造过程 init() 时，可以在定义中提供构造参数，指定所需值的类型和名字

// 初始化时给属性赋值
class Person {
    var name: String
    var age: Int
    
    // 自定义构造函数,会覆盖 init() 函数
    init(name: String, age: Int) {
        
        self.name = name
        self.age  = age
    }
    
}
// 创建一个Person 对象
let p = Person(name: "zhangsan", age: 23)


//下面例子中定义了一个包含摄氏度温度的结构体 Celsius
//它定义了两个不同的构造器：init(fromFahrenheit:) 和 init(fromKelvin:)
//二者分别通过接受不同温标下的温度值来创建新的实例：
struct Celsius {
    var temperatureInCelsius: Double
    
    //构造器有一个构造参数，其外部名字为 fromFahrenheit ，内部名字为fahrenheit
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    //构造器有一个构造参数，其外部名字为 fromKelvin ，内部名字为 kelvin
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0”


//这两个构造器都将唯一的参数值转换成摄氏温度值，并保存在属性temperatureInCelsius中。


//: ----

//: - 参数的内部名称和外部名称

//跟函数和方法参数相同，构造参数也拥有一个在构造器内部使用的参数名字和一个在调用构造器时使用的外部参数名字。

//然而，构造器并不像函数和方法那样在括号前有一个可辨别的名字。因此在调用构造器时，主要通过构造器中的参数名和类型来确定应该被调用的构造器。正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名字，Swift 会为构造器的每个参数自动生成一个跟内部名字相同的外部名。

//以下例子中定义了一个结构体Color，它包含了三个常量：red、green和blue。这些属性可以存储0.0到1.0之间的值，用来指示颜色中红、绿、蓝成分的含量。

// 定义了一个结构体Color
struct Color {
    //包含了三个常量：red、green和blue
    let red, green, blue: Double
    
    
    //Color提供了一个构造器，其中包含三个Double类型的构造参数
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    // Color也可以提供第二个构造器，它只包含名为white的Double类型的参数
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

//两种构造器都能用于创建一个新的Color实例，你需要为构造器每个外部参数传值：

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//注意，如果不通过外部参数名字传值，你是没法调用这个构造器的。只要构造器定义了某个外部参数名，你就必须使用它，忽略它将导致编译错误：

//let veryGreen = Color(0.0, 1.0, 0.0)
// 报编译时错误，需要外部名称


// 正确写法
let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)



//: ----

//: - 不带外部名的构造器参数

//如果你不希望为构造器的某个参数提供外部名字，你可以使用下划线(_)来显式描述它的外部名，以此重写上面所说的默认行为。

//下面是之前Celsius例子的扩展，跟之前相比添加了一个带有Double类型参数的构造器，其外部名用_代替：
struct Celsius2 {
    
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius2(37.0)
// bodyTemperature.temperatureInCelsius 为 37.0


//调用Celsius2(37.0)意图明确，不需要外部参数名称。因此适合使用init(_ celsius: Double)这样的构造器，从而可以通过提供Double类型的参数值调用构造器，而不需要加上外部名。

//: ----

//: - 可选属性类型

// 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性——无论是因为它无法在初始化时赋值，还是因为它在之后某个时间点可以赋值为空——你都需要将它定义为可选类型（optional type）。可选类型的属性将自动初始化为nil，表示这个属性是有意在初始化时设置为空的。

//下面例子中定义了类SurveyQuestion，它包含一个可选字符串属性response：
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// 输出 "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."


//调查问题的答案在回答前是无法确定的，因此我们将属性response声明为String?类型，或者说是可选字符串类型（optional String）。当SurveyQuestion实例化时，它将自动赋值为nil，表明此字符串暂时还没有值。


//: - 构造过程中常量属性的修改

//你可以在构造过程中的任意时间点给常量属性指定一个值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。

//:> 注意: 对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。你可以修改上面的SurveyQuestion示例，用常量属性替代变量属性text，表示问题内容text在SurveyQuestion的实例被创建之后不会再被修改。尽管text属性现在是常量，我们仍然可以在类的构造器中设置它的值：

class SurveyQuestion2 {
    
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
// 输出 "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"






