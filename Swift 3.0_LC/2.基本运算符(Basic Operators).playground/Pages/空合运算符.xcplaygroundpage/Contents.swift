//: ### 空合运算符(Nil Coalescing Operator)
/*:
 空合运算符( a ?? b )将对可选类型 a 进行空判断,如果 a 包含一个值就进行解封,否则就返回一个默认值 b .
 
 这个运算符有两个条件:
 
 • 表达式 a 必须是Optional类型
 
 • 默认值 b 的类型必须要和 a 存储值的类型保持一致
 */
//: 空合并运算符是对以下代码的简短表达方法
//   a != nil ? a! : b
/*:
 上述代码使用了三目运算符。当可选类型 a 的值不为空时,进行强制解封( a! )访问 a 中值,反之当 a 中值为空时,返回默认值b。
 
 无疑空合运算符( ?? )提供了一种更为优雅的方式去封装条件判断和解封两种行为,显得简洁以及更具可读性。
 
 注意: 如果 a 为非空值( non-nil ),那么值 b 将不会被估值。这也就是所谓的短路求值。
 */
//下文例子采用空合并运算符,实现了在默认颜色名和可选自定义颜色名之间抉择:
let defaultColorName = "red"
var userDefinedColorName:String?    //默认值为nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//:userDefinedColorName的值为空 ,所以colorNameToUse的值为`red`

/*:
 详解：
 `userDefinedColorName` 的值被定义为一个可选`String`类型，默认值为`nil`.
 由于 `userDefinedColorName` 是一个可选类型，我们可以使用空合运算符去判断其值。
 在上一个例子中,通过空合运算符为一个名为 `colorNameToUse` 的的变量赋予一个字符串类型初始值。
 由于 `userDefinedColorName` 值为空, 因此表达式 `userDefinedColorName?? defaultColorName `返回` DefinedColorName `的值，即`red`
 */

/*:
 另一种情况,分配一个非空值（non-nil）给 `userDefinedColorName` ,再次执行空合运算,运算结果为封包在 `userDefinedColorName`中的值。而非默认值
 */
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//:`userDefinedColorName`非空,因此`colorNameToUsede`的值为`green`

//: [空合运算符](@previous) | [区间运算符](@next)
