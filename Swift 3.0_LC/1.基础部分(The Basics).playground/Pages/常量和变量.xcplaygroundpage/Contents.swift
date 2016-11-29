//: ## 常量和变量（Constants and Variables）
//: #### - 变量的值可以根据需要不断修改，而常量的值是不能够被二次修改
//: #### - Swift使用var声明变量，let声明常量。
//: > 类型推导：编译器在编译的时候 通过你提供的初始化值 自动推导出 特定的表达式的类型
//: ---
//: #### 声明常量和变量
var currentLoginAttempt = 0             //编译器自动推断其类型为Int
currentLoginAttempt = 10                //变量的多次赋值需要保证值的类型是相同的
let maximumNumberOfLoginAttempts = 10
//maximumNumberOfLoginAttempts = 20       //错误，常量不能被二次修改

// 你可以在一行中声明多个变量或常量，用逗号分隔：
var x = 0.0, y = 0.0, z = 0.0
//: ---
//: #### 类型标注
//: - 在变量或常量的名字后边加一个冒号，再跟一个空格，最后加上要使用的类型名称。
//: - 显示声明类型，语法：变量 : 类型名
var welcomeMessage: String
//: - 声明中的冒号的意思是: “是…类型”，所以上面的代码可以读作：
//: - 声明一个叫做 `welcomMessage` 的变量，类型是 `String`, 意味着可以存储任何 `String` 值.
welcomeMessage = "Hello"
//:现在这个 `welcomeMessage` 变量就可以被设置到任何字符串中而不会报错了
//你可以在一行中定义多个相关的变量为相同的类型，用逗号分隔，只要在最后的变量名字后边加上 类型标注。
var red, green, blue: Double

let double : Double = 70
let int : Int = 10
//var noValue   //错误，需要赋初始值, Swift不会自动给变量赋初始值，也就是说变量不会有默认值，所以要求使用变量之前必须要对其初始化

//: ---
//: #### 命名常量和变量
//: 常量和变量的名字几乎可以使用任何字符，甚至包括 Unicode 字符：
var π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
let cat = "🐱";
print(π)
print(你好)
print(🐶🐮)
print(cat)
//:命名规则：Swift中可以使用几乎任何字符来作为常量和变量名，包括Unicode。但是不能含有数学符号，箭头，无效的Unicode，横线-和制表符，且不能以数字开头.
//:> 注意：如果你需要使用与Swift保留关键字相同的名称作为常量或者变量名，你可以使用反引号（`）将关键字包围的方式将其作为名字使用。无论如何，你应当避免使用关键字作为常量或变量名，除非你别无选择。
//你可以把现有变量的值更改为其他相同类型的值
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"    // friendlyWelcome 现在是 "Bonjour!"

/*
let languageName = "Swift"
languageName = "Swift++"  // 报错：不同于变量，常量的值一旦设定, 则不能再改变。
*/
//: ---
//: #### 输出常量和变量
//: - 你可以使用 `print(_:separator:terminator:)` 函数来打印当前常量和变量中的值。
print(friendlyWelcome)      // 输出 "Bonjour!"
/*:

 - `print(_:separator:terminator:) `是一个用来把一个或者多个值用合适的方式输出的全局函数。
 比如说，在 `Xcode` 中 `print(_:separator:terminator:)` 函数输出的内容会显示在`Xcode`的 `console` 面板上。
 
 - `separator` 和 `terminator` 形式参数有默认值，所以你可以在调用这个函数的时候忽略它们。
 默认来说，函数通过在行末尾添加换行符来结束输出。要想输出不带换行符的值，那就传一个空的换行符作为结束.
 比如说， `print(someValue, terminator: "")`
*/
 
//: Swift 使用字符串插值的方式, 来把 常量名 或者 变量名 当做 占位符 加入到更长的字符串中，然后让 Swift 用常量或变量的当前值替换这些占位符。将常量或变量名放入圆括号中并在括号前使用反斜杠将其转义：
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// 输出 "The current value of friendlyWelcome is Bonjour!"

//: [上一页](@previous) | [下一页](@next)
