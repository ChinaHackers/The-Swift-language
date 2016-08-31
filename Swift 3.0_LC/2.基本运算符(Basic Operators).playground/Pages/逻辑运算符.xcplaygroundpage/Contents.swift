//: ### 逻辑运算符
/*:
 
 逻辑运算符修改或结合布尔逻辑值true和false。
 
 Swift支持这三个标准逻辑运算符基于c语言:
 
 Logical NOT (!a)        //逻辑非
 
 Logical AND (a && b)    //逻辑与
 
 Logical OR (a || b)     //逻辑或
 */

/*:
 
 以下列出了 Swift 语言支持的逻辑运算符，其中变量 A 为 true，变量 B 为 false：
 
 运算符        描述                                      实例
 
 &&	逻辑与。如果运算符两侧都为 TRUE 则为 TRUE。           (A && B) 为 false。
 
 ||	逻辑或。 如果运算符两侧至少有一个为 TRUE 则为 TRUE。	(A || B) 为 true。
 
 !	逻辑非。布尔值取反，使得true变false，false变true。	!(A && B) 为 true。
 
 */
// 以下为逻辑运算的简单实例：
var A = true
var B = false

print("A && B 结果为：\(A && B)")
print("A || B 结果为：\(A || B)")
print("!A 结果为：\(!A)")
print("!B 结果为：\(!B)")

/*
 以上程序执行结果为：
 
 A && B 结果为：false
 A || B 结果为：true
 !A 结果为：false
 !B 结果为：true
 */
//: 逻辑非运算符
//逻辑非运算符(!a)转化一个Bollean值，以便true成为false，false变成true

let allowedEntry = false

if !allowedEntry {
    
    print("ACCESS DENIED")
}

//: 逻辑与运算符
//: - 对于逻辑与运算，如果第一个操作数被判定为“false”，系统不再判定或求解第二个操作数。结果就为“ false”。
//: - 逻辑与运算符：（A && B），其中A和B两个值必须同时为true时表达式才正确。

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: 逻辑或运算符
//: - 表达式（a || b）运算符中、只要a或者b有一个为true、则表达式正确。
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
//: 复合逻辑表达式 （ 逻辑运算符组合计算 ）
//你可以将多个逻辑运算符复合来创建更长的复合表达式
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/*:
 说明：
 
 这个例子使用了含多个 && 和 || 的复合逻辑。但无论怎样, && 和 || 始终只能操作两个值。
 
 所以这实际是三个 简单逻辑连续操作的结果。 所以整个复杂表达式的值还是 true 。
 
 注意: Swift 逻辑操作符 && 和 || 是左结合的,这意味着拥有多元逻辑操作符的复合表达式优先计算 最左边 的子表达式。
 
 */
// 使用括号（）来明确优先级
//可以添加(), 明确意图
/*:
 为了一个复杂表达式更容易读懂,在合适的地方使用括号来明确优先级是很有效的,虽然它并非必要的。
 在上个关于门的权限的例子中,我们给第一个部分加个括号,使用它看起来逻辑更明确:
 */
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/*:
 
 这括号使得前两个值被看成整个逻辑表达中独立的一个部分。虽然有括号和没括号的输出结果是一样的,
 
 但对于读代码的人来说有括号的代码更清晰。可读性比简洁性更重要,请在可以让你代码变清晰地地方加个括号吧!
 */

//: [上一页](@previous)
