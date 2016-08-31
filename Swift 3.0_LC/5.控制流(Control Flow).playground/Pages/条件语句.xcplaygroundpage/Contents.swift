//: ## 条件语句
//:     Swift 提供两种类型的条件语句：if 语句 和 switch 语句。通常，当条件较为简单且可能的情况很少时，使用if语句。而switch语句更适用于条件较复杂、可能情况较多且需要用到模式匹配（pattern-matching）的情境。
//: ----
//: ## if语句

/*:
 Swift 提供了以下几种类型的 if 语句：
- if 语句 由一个布尔表达式和一个或多个执行语句组成。
- if...else 语句
- if 语句 后可以有可选的 else 语句, else 语句在布尔表达式为 false 时执行。
- if...else if...else 语句
- if 后可以有可选的 else if...else 语句, else if...else 语句常用于多个条件判断。
- 内嵌 if 语句
- 你可以在 if 或 else if 中内嵌 if 或 else if 语句。
- switch 语句允许测试一个变量等于多个值时的情况。
*/

//: if语句最简单的形式就是只包含一个条件，当且仅当该条件为true时，才执行相关代码：
/// ![if](http://www.runoob.com/wp-content/uploads/2015/12/if.png "if")

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("这非常冷。可以考虑戴一条围巾.")
}
// 输出 "这非常冷。可以考虑戴一条围巾."


//: if else:  当条件为`false`时，执行 else 语句：
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("这非常冷。可以考虑戴一条围巾.")
} else {
    print("这并不冷。穿一件t恤.")
}
// 输出 "这并不冷。穿一件t恤."

//: #### 嵌套if语句： if - else if - else
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("这非常冷。可以考虑戴一条围巾.")
} else if temperatureInFahrenheit >= 86 {
    print("真的很温暖。别忘了穿防晒.")
} else {
    print("这并不冷。穿一件t恤.")
}
// 输出 "真的很温暖。别忘了穿防晒."

//: ----
//: #### Switch语句
//语法
/*
let index = 10
 
switch index {
     case 100  :
        print( "index 的值为 100")
     fallthrough    //可选
     case 10,15  :
        print( "index 的值为 10 或 15")
     fallthrough    //可选
     case 5  :
        print( "index 的值为 5")
     default :
        print( "默认 case")
}
*/

/*:
  `switch`语句都由多个 `case` 构成。为了匹配某些更特定的值，`Swift` 提供了几种更复杂的匹配模式，这些模式将在本节的稍后部分提到。
 
 每一个 switch 语句都由多个可能的情况组成，每一个情况都以 case 关键字开始。对于对比额外特定的值来说，Swift 提供了多种方法给每个情况来区别更复杂的匹配模式。这些选项会在本小节稍后的内容中详述。
 
 每一个 switch 情况函数体都是独立的代码执行分支，与 if 语句的分支差不多。 switch 语句决定那个分支应该被选取。这就是所谓的在给定的值之间选择。
 
 switch 语句一定得使全面的。就是说，给定类型里每一个值都得被考虑到并且匹配到一个 switch 情况。如果无法提供一个switch情况给所有可能的值，你可以定义一个默认匹配所有的情况来匹配所有未明确出来的值。这个匹配所有的情况用关键字 default 标记，并且必须在所有情况的最后出现。
 */

// 这个示例使用了一个 switch 语句来考虑一个叫做 someCharacter 的单一小写字符：
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"


/*:
执行过程：
 - 1.首先计算switch后面“ 表达式 ”的值，然后依次与case后面的“ 常量表达式 ”的值进行比较.如果相同就执行该case后面的语句组，
    当执行到break语句时，跳出switch语句，转向执行switch语句的下一条。
 - 2.如果没有任何一个case后面的“ 常量表达式 ”的值，与“ 表达式 ”的值相同，则执行default后面的语句组，然后再执行switch语句外的语句。

*/
//: ----
//:实例：判断学生分数
/*:
 
 - 判断分数:
 - 90-99: 优秀
 - 80-89: 良好
 - 70-79: 中等
 - 60-69: 及格
 - 60以下: 不及格
 */
let score = 99

// swift的 swith执行完一个case后默认不会执行下一个case语句，switch 会终止。
switch (score / 10) {
    case 9 :
        print("优秀")
    case 8 :
        print("良")
    case 7 :
        print("中")
    case 6 :
        print("及格")
    default:
        print("不及格")
}

let index = 10

switch index {
    case 100  :
        print( "index 的值为 100")
    fallthrough
    case 10,15  :
        print( "index 的值为 10 或 15")
    fallthrough     // Swift中如果想让 case 之后的语句按顺序继续运行，则需要使用 fallthrough 语句。
    case 5  :
        print( "index 的值为 5")
    default :
        print( "默认 case")
}


// 输出： index 的值为 10 或 15
//       index 的值为 5
/*:
 
 与 C 语言和 Objective-C 中的switch语句不同，在 Swift 中，当匹配的 case 分支中的代码执行完毕后，程序会终止switch语句，
 而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用break语句。
 这使得switch语句更安全、更易用，也避免了因忘记写break语句而产生的错误。

 */

//: [后退](@previous) | [控制转移语句](@next)
