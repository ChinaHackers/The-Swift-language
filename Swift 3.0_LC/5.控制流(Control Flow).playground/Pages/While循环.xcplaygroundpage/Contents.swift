//: ## while 循环
//:     Swift 的 while 循环从计算单一条件开始。如果条件为 true，会重复运行一系列语句，直到条件变为 false。

//Swift while 循环的语法格式如下：
/*:
 while 表达式 {
    语句
}
*/

/*:
- 如果条件为 `true`，会重复运行一系列语句，直到条件变为`false`。
- 数字 `0`, 字符串 '0' 和 "", 空的 `list()`, 及未定义的变量都为 `false` ，其他的则都为 `true`。
- `true` 取反使用 `!` 号或 `not`，取反后返回 `false`。
*/
//实例
var index = 10
while index < 20 {
    print( "index 的值为 \(index)")
    index = index + 1
}
//以上程序执行输出结果为：
//index 的值为 10
//index 的值为 11
//index 的值为 12
//index 的值为 13
//index 的值为 14
//index 的值为 15
//index 的值为 16
//index 的值为 17
//index 的值为 18
//index 的值为 19
//: #### repeat...while 循环
//:     Swift 中的 repeat...while  循环不像 for 和 while 循环在循环体开始执行前先判断条件语句，而是在循环执行结束时判断条件是否符合。

//: Swift中 `repeat...while` 循环的语法格式如下：
/*
    repeat {
        语句
    }while(表达式) //循环条件
*/
//:> 注意: 首先执行 `repeat` 后面的语句，其次，执行 `while`条件的值，值为真，循环将继续，并再次执行 `repeat`后面的语句。如果 `while` 条件为 `false`（假）,循环将终止并正常顺序执行循环体外的语句。

/*:
 - 请注意，条件表达式出现在循环的尾部，所以循环中的 `语句` 会在条件被测试之前至少执行一次。
 - 如果条件为 `true`，控制流会跳转回上面的 `repeat`，然后重新执行循环中的 `语句`
 - 这个过程会不断重复，直到给定条件变为 `false `为止。
 - 数字 `0`, 字符串 '0' 和 "", 空的 `list()`, 及未定义的变量都为 `false` ，其他的则都为 `true`。
 - `true` 取反使用 ` ! `号或 `not`，取反后返回 `false`。
 
 */
//实例
var index1 = 15

repeat {
    print( "index 的值为 \(index1)")
    index1 = index1 + 1
}while index1 < 20

//以上程序执行输出结果为：
//index 的值为 15
//index 的值为 16
//index 的值为 17
//index 的值为 18
//index 的值为 19

//: [后退](@previous) | [条件语句](@next)
