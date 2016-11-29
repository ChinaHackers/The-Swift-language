//: ## 可选类型 (Optionals)
//: #### (变量名: 类型?）
import UIKit
//:     这个值要么存在，并且等于x，要么根本不存在。可选类型类似于Objective-C中指针的nil值，但是nil只对类(class)有用，指对象不存在，而Swift 的 nil 不是指针，它代表特定类型的值不存在。任何类型的可选类型都能赋值为 nil，而不仅限于对象类型。并且更安全。
//: ---

//: 下面的例子演示了可选项如何作用于值的缺失, `Swift` 的 `Int` 类型中有一个初始化器，可以将 `String` 值转换为一个 `Int` 值。然而并不是所有的字符串都可以转换成整数。字符串 “123” 可以被转换为数字值 123  ，但是字符串 "hello, world" 就显然不能转换为一个数字值。
// 在下面的例子中，试图利用初始化器将一个 String 转换为 Int ：
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

//: 因为这个初始化器可能会失败，所以他会返回一个`可选的 Int` ，而不是 `Int` 。`可选的 Int` 写做 `Int? `，而不是 `Int` 。问号明确了它储存的值是一个可选项，意思就是说它可能包含某些 `Int`值，或者可能根本不包含值。（他不能包含其他的值，例如 `Bool` 值或者 `String` 值。它要么是 `Int` 要么什么都没有。）

//: ---

//: ## nil
//: 你可以通过给可选变量赋值一个 nil 来将之设置为没有值：
var serverResponseCode: Int? = 404  // serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil   // serverResponseCode 现在不包含值

//:     nil不能用于非可选量。如果代码中的常量或变量需要适配值不存在的特殊情况，务必将它声明为恰当的可选类型。如果定义的可选量时不提供默认值，该常量或变量将自动设为 nil
var surveyAnswer: String?       // surveyAnswer 被自动设置为 nil
//:> 注意：`Swift` 的 `nil` 和 `Objective-C` 中的 `nil` 并不一样。在 `Objective-C` 中，`nil`是一个指向不存在对象的指针。在 `Swift` 中，`nil`不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为`nil`，不只是对象类型。真实应用场景目的:让代码更加严谨

//: 通过该方法创建的URL,可能有值,也可能没有值
// 错误写法:如果返回值是nil时,就不能接收了
//let url : NSURL = NSURL(string: "www.520it.com")

// 正确写法:使用可选类型来接收
let url:NSURL? = NSURL(string: "www.apple.com")

// 通过url来创建request对象
if let tempUrl = url {
    let request = URLRequest(url: tempUrl as URL)
}
//: ---

//: ## If 语句以及强制解析
//:     你可以使用if语句和nil比较来判断一个可选值是否包含值。你可以使用“相等”(==)或“不等”(!=)来执行比较。
//如果可选类型有值，它将不等于nil:
if convertedNumber != nil {
    
    print("convertedNumber contains some integer value.")
}
// 输出 "convertedNumber contains some integer value."

/*: 
 
 当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。
 
 这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）：
 */
if convertedNumber != nil {
    
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出 "convertedNumber has an integer value of 123."
//:     注意：使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值。

//: ---
//: ##  可选绑定
//: - 可选绑定`（optional binding）:`
//: - 判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。不需要用 ! 获取可选类型的值。
//: - 可选绑定可以用在 `if` 和 `while`语句中，这条语句不仅可以用来判断可选类型中是否有值，同时可以将可选类型中的值赋给一个常量或者变量。
//像下面这样在if语句中写一个可选绑定：
/*
if let constantName = someOptional {
    语句
}
*/
//: 你可以像上面这样使用可选绑定来重写possibleNumber这个例子：
if let actualNumber = Int(possibleNumber) {
    
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
    
} else {
    
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
// 输出 "'123' has an integer value of 123"


/*:
 这段代码可以被理解为：

- 如果 `Int(possibleNumber)`  返回的可选 `Int` 包含一个值，将这个可选项中的值赋予一个叫做 `actualNumber` 的新常量。
- 如果转换成功，常量 `actualNumber` 就可以用在 `if` 语句的第一个分支中，他早已被可选内部的值进行了初始化，所以这时就没有必要用 `!` 后缀来获取里边的值。在这个例子中 `actualNumber` 被用来输出转换后的值。
 
- 常量和变量都可以使用可选项绑定，如果你想操作 `if` 语句中第一个分支的 `actualNumber` 的值，你可以写 `if var actualNumber` 来代替，可选项内部包含的值就会被设置为一个变量而不是常量。
 */

//您可以包括尽可能多的可选的绑定和布尔条件在一个if语句,之间用逗号分隔。如果任何可选值的绑定是nil或任何布尔条件的求值结果为false,整个If语句的条件被认为是错误的。

//以下if语句是等价的:
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// 输出"4 < 42 < 100"
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"


//: ---
//: ## 隐式解析可选类型(!的用法)
/*:

 - 可选类型暗示了常量或者变量可以“没有值”。可选可以通过if语句来判断是否有值，如果有值的话可以通过 可选绑定 `（Optional Binding）`来解析值
 如果确定一个可选类型的对象的值一定存在，那么我们使用 ！进行解包获取它的值。
 - 这种类型的可选状态被定义为隐式解析可选类型`（implicitly unwrapped optionals）`。把想要用作可选的类型的后面的问号`（String?）`改成感叹号`（String!）`来声明一个隐式解析可选类型。
 
 */
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要惊叹号 ！来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号
//:     你可以把隐式解析可选类型当做一个可以自动解析的可选类型。你要做的只是声明的时候把感叹号放到类型的结尾，而不是每次取值的可选名字的结尾。

//: > 注意：如果你在隐式解析可选类型没有值的时候尝试取值，会触发运行时错误。和你在没有值的普通可选类型后面加一个惊叹号一样。
// 你仍然可以把隐式解析可选类型当做普通可选类型来判断它是否包含值：
if assumedString != nil {
    print(assumedString)
}
// 输出 "An implicitly unwrapped optional string."

//你也可以在可选绑定中使用隐式解析可选类型来检查并解析它的值：
if let definiteString = assumedString {
    print(definiteString)
}
// 输出 "An implicitly unwrapped optional string."
//:> 注意：如果一个变量之后可能变成nil的话请不要使用隐式解析可选类型。如果你需要在变量的生命周期中判断是否是nil的话，请使用普通可选类型。

//: 总结`!`使用场景: 强制对`Optional`值进行解包(`unwrap`), 声明隐式拆包的可选类型`（Implicitly Unwrapped Optionals）`值，一般用于类中的属性

//: [上一页](@previous) | [下一页](@next)
