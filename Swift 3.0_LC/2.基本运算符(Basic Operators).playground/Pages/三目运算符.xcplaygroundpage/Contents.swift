//: ### 三目运算符
//: 三目运算符是一种特殊的运算符 有三个部分，其形式为`question? answer1：answer2`
//:> 特别注意：因为`Swift`语言(`?`)有特殊的意义（可选量），所以三目运算符里面的(`?`)前面一定要有至少一个空格，否则就当成了可选量
//三目运算符是下面的代码的简化

/*
 if question {
    answer1
} else {
    answer2
}
*/

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//: [三目运算符](@previous) | [空合运算符](@next)
