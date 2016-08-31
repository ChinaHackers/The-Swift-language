//: ## 字符串插值 (String Interpolation)
//: - 字符串插值是一种从混合常量、变量、字面量和表达式的字符串字面量构造新 `String` 值的方法
//: - 每一个插入到字符串字面量的元素都要被一对圆括号包裹，然后使用反斜杠 `(\)` 前缀
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
//:  在上面的例子中，`multiplier` 作为 \(multiplier) 被插入到一个 字符串常量 量中。 当创建字符串执行插值计算时此占位符会被替换为 `multiplier` 实际的值。

//: `multiplier` 的值也作为字符串中后面表达式的一部分。 该表达式计算 `Double(multiplier) * 2.5` 的值, 并将结果 (7.5) 插入到字符串中。 在这个例子中，表达式写为 `\(Double(multiplier) * 2.5)`并包含在字符串字面量中。

//:> 注意：插值字符串中写在括号中的表达式不能包含非转义反斜杠 (\)，并且不能包含回车或换行符。不过，插值字符串可以包含其他字面量。
 

//: [上一页](@previous) | [下一页](@next)
