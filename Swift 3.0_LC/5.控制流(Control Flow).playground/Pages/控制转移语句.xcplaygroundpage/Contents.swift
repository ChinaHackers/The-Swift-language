//: ## 控制转移语句（Control Transfer Statements）

//: 控制转移语句改变你代码的执行顺序，通过它你可以实现代码的跳转。Swift 有五种控制转移语句：
/*:
- continue
- break
- fallthrough
- return
- throw
*/
//: ---
//: #### Continue
//: continue语句告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
//:>  注意：在一个带有条件和递增的for循环体中，调用continue语句后，迭代增量仍然会被计算求值。 循环体继续像往常一样工作，仅仅只是循环体中的执行代码会被跳过。
// 下面的例子把一个小写字符串中的元音字母和空格字符移除，生成了一个含义模糊的短句：
var index = 10

repeat{
    index = index + 1
    
    if( index == 15 ){ // index 等于 15 时跳过
        continue
    }
    print( "index 的值为 \(index)")
}while index < 20
//以上程序执行输出结果为：
//index 的值为 11
//index 的值为 12
//index 的值为 13
//index 的值为 14
//index 的值为 16
//index 的值为 17
//index 的值为 18
//index 的值为 19
//index 的值为 20

//: ----

//: #### Break
//: break语句会立刻结束整个控制流的执行。当你想要更早的结束一个switch代码块或者一个循环体时，你都可以使用break语句。

//: 循环语句中的 break:
//: - 当在一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号 } 后的第一行代码。不会再有本次循环迭代的代码被执行，也不会再有下次的循环迭代产生。

//: Switch 语句中的 break:
//: - 当在一个switch代码块中使用break时，会立即中断该switch代码块的执行，并且跳转到表示switch代码块结束的大括号(})后的第一行代码。
// 实例
var a = 10
 
 repeat{
    
    a = a + 1
    
    if( a == 15 ){  // a 等于 15 时终止循环
        break
    }
    print( "a 的值为 \(a)")
    
 }while a < 20


// 以上程序执行输出结果为：
// a 的值为 11
// a 的值为 12
// a 的值为 13
// a 的值为 14

//: ----

//: #### fallthrough

/*:

- Swift fallthrough 语句让 case 之后的语句会按顺序继续运行，且不论条件是否满足都会执行。
- 注意：在大多数语言中，switch 语句块中，case 要紧跟 break，否则 case 之后的语句会顺序运行。
-    而在 Swift 语言中，默认是不会执行下去的，switch 也会终止。
-    如果你想在 Swift 中让 case 之后的语句会按顺序继续运行，则需要使用 fallthrough 语句。

*/

//实例
//以下实例没有使用 fallthrough 语句：
var index3 = 10

switch index3 {
    case 100  :
        print( "index3 的值为 100")
    case 10,15  :
        print( "index3 的值为 10 或 15")
    case 5  :
        print( "index3 的值为 5")
    default :
        print( "默认 case")
}


// 输出：index3 的值为 10 或 15


//用fallthrough关键字

let score1 = 80

switch (score1 / 10) {
    case 9 :
        print("优秀")
    case 8:
        print("我走了吗?")
        fallthrough     //继续按顺序执行后面的语句，且不论条件是否满足都会执行。
    case 7:
        print("良")
        fallthrough
    case 6 :
        print("及格")
    default:
        print("不及格")
}

/* 输出结果：

 ：走我了吗?
 ：良
 ：及格

*/

//: #### 区间匹配

// case 分支的模式也可以是一个值的区间。下面的例子展示了如何使用区间匹配来输出任意数字对应的自然语言格式：

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出 "There are dozens of moons orbiting Saturn."

//: #### 元组匹配
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) 在原点")
case (_, 0):
    print("(\(somePoint.0), 0) 在 x 轴上")
case (0, _):
    print("(0, \(somePoint.1)) 在 y 轴上")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) 在矩形里面")
default:
    print("(\(somePoint.0), \(somePoint.1)) 在矩形外面")
}
// 输出 "(1, 1) 在矩形里面"
//: ----

//: #### 匹配字符串
/*
 Monday 星期一
 Tuesday 星期二
 Wednesday 星期三
 Thursday 星期四
 Friday 星期五
 Saturday 星期六
 Sunday 星期日
 */
let weekDay = "Monday"
switch weekDay {
    
    case "Monday":
        print("星期一,该上班了")
        fallthrough      //fallthrough 语句让 case 之后的语句会按顺序继续执行后面的语句，且不论条件是否满足都会执行。
    case "Friday":
        print("星期五,明天不上班")
    default:
        print("忙的忘记星期几了")
}

// 输出:
// 星期一,该上班了
// 星期五,明天不上班


//: [后退](@previous) | [提前退出](@next)
