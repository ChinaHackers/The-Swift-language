//: ## 基本运算符(Basic Operators)
//: 本页包含内容：
//: - 术语
//: - 赋值运算符
//: - 算术运算符
//: - 组合赋值运算符
//: - 比较运算符
//: - 三目运算符
//: - 空合运算符
//: - 区间运算符
//: - 逻辑运算符
/*:
    1、Swift支持C标准库中的大多数运算符并提升了各自的兼容性，从而可以排除常见的编码错误
 
    2、分配符 (=)不会返回一个值，这样可以防止你因粗心将 等于(==)写成 赋值运算符(=) 而引起的错误
 
    3、算术符(+、 -、 *、 /、 % 等)会检查与驳回值溢出，这样可以避免值类型的数据在超过值类型所允许的存储范围时，
    出现意想不到的数据。你可以选择使用Swift所提供的值溢出运算符进行量化溢出的行为，详细见溢出操作符。
    
    4、与C语言不同，Swift允许你对浮点数执行取余运算
        
    5、Swift提供两个范围的运算符 (a..b 和  a...b)，作为表示一个数值范围的简写方式，这点C不支持
 */

//: ### 术语
/*:
 操作符都是一元、二元或三元:
 
 · 一元操作符操作单个对象 (如 -a)。一元前缀操作符出现在对象前(如 !b)，一元后缀操作符在对象后出现 (如 i++)。
 
 · 二元操作符操作两个对象(如 2 + 3)，并且操作符位于两个元素中间。
 
 · 三元操作符对两个对象进行操作。与C一样，Swift仅支持一个三元操作符：三元条件操作符 (a ? b : c)。(?前面一定需要至少一个空格)
 
 操作符所影响的值被称为操作数。表达式1 + 2中，符号 + 是一个二元运算符并且两个操作数分别为 1 和 2。
*/
//: 2、赋值运算符
 let b = 10
 var a = 5
 a = b               //用b的值去初始化或更新a 的值
 
 let (x, y) = (1, 2) // x等于1, 并且y等于2
 
 //与C及Objective-C不同，Swift中赋值运算符并不将自身作为一个值进行返回。所以以下的代码是不合法的：
//: 此特性帮助你避免因粗心将 等于(==)写成 赋值运算符 (=) 而引起的错误。因为 if a = b 这样写是无效的
 /*
 if a = b {
 // 错误, 因为a = b并不会返回一个值
 }
 */
 

//: 3、算术运算符
 /*:
 Swift支持所有数字类型的四个标注运算符:
 · 加法(+)
 
 · 减法(-)
 
 · 乘法(*)
 
 · 除法(/)
 */
 
 1 + 2 // equals 3
 5 - 3 // equals 2
 2 * 3 // equals 6
 10.0 / 2.5 // equals 4.0
 
 
 //不同于C和Objective-C，默认情况下Swift的算术运算符不允许值溢出。
 //你可以通过Swift的溢出运算符来选择值的溢出情况(例如 a & + b)。详见 溢出运算符
 
 
 //两个字符，或者一个字符一个字符串，能组合成一个新的字符串：
 let dog: Character = "🐶"
 let cow: Character = "🐮"
 //let dogCow = dog + cow  // dogCow is equal to "🐶🐮"
 var dogCow: String = ""
 dogCow.append(dog)
 dogCow.append(cow)
 print(dogCow)
 
//: 求余运算符
 //求余运算符(a % b)a是b的几倍并且返回被留下的值(叫作余数)
 9 % 4 // equals 1
 
 //浮点数求余数计算
 //不同于C和Objective-C，Swift的余数运算符也能运用于浮点数：
 
 8 % 2.5 // equals 0.5


/*:
    swift自增 ++ 和自减运算符 -- 将被取消
    Swift 2.2 正式将 ++ 和 -- 否决掉了，意味着虽然在 Swift 2.2 版本还能工作，但编译器会给你一个警告。但在 3.0 版本会被完全移除。

    你可以使用 += 1 和 -= 1 来替代，至于为什么要将其移除，有这么几个解释：

    写 ++ 并不比 +=1 能节省多少时间, ++ 对学 Swift 没有任何帮助，+= 至少可读性更好
    传统 C styel for 循环中的 – 也被否决掉了

 */


 var a1 = 0

//  //要注意的是，复合赋值操作符不返回值。例如，你不能写让成"let b1 = a1 += 1"
// let b1 = a1 += 1 // a和b是现在都等于1
// let c1 = a1 += 1 // 现在等于2,但c1前增量值被设置为1


//一元负号运算符（一个数值前加了符号-，叫作一元减运算符）
let three = 3
let minusThree = -three     // minusThree 等于 -3
let plusThree = -minusThree // plusThree 等于 3, or "minus minus three"


//一元正号算符（一元加运算符(+)返回的值，不做任何变动）
let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix 等于 -6


//: 4、复合赋值操作符
var e = 1
//let b = e += 2      //要注意的是，复合赋值操作符不返回值。例如，你不能写让成"let b = e += 2"

//: 5、比较运算符. 通常用在条件语句
/*:
 Swift支持所有标准c的比较运算符
 
 等于 (a == b)
 
 不等于(a != b)
 
 大于 (a > b)
 
 小于 (a < b)
 
 大于等于 (a >= b)
 
 小于等于(a <= b)
 
 Swift 提供两个恒等运算符(=== and !==)，用它来测试两个对象引用是否来自于同一个对象实例
 
 */

1 == 1 // true, 因为1等于1
2 != 1 // true, 因为2不等于1
2 > 1 // true, 因为 2 > 1成立
1 < 2 // true, 因为1 < 2 成立
1 >= 1 // true, 因为1是大于或等于1
2 <= 1 // false, 因为2是小于或等于1

//: 6、三元条件运算符

//: 三元条件运算符是一种特殊的运算符 有三个部分，其形式为question? answer1：answer2

//: 特别注意：因为Swift语言(?)有特殊的意义（可选量），所以三目运算符里面的(?)前面一定要有至少一个空格，否则就当成了可选量

//三元条件运算符是下面的代码的简化

/// ```swift
/// if question {
///
///    answer1
/// } else {
///
///    answer2
/// }
///


let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//: 空合运算符(Nil Coalescing Operator)
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


//: 下文例子采用空合并运算符,实现了在默认颜色名和可选自定义颜色名之间抉择:

let defaultColorName = "red"
var userDefinedColorName:String?    //默认值为nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

//userDefinedColorName的值为空 ,所以colorNameToUse的值为`red`

/* 详解：
 userDefinedColorName 的值被定义为一个可选String类型，默认值为nil.
 由于 userDefinedColorName 是一个可选类型，我们可以使用空合运算符去判断其值。
 在上一个例子中,通过空合运算符为一个名为 colorNameToUse 的的变量赋予一个字符串类型初始值。
 由于 userDefinedColorName 值为空, 因此表达式 userDefinedColorName?? defaultColorName 返回 DefinedColorName 的值，即red
 */

/*   另一种情况,分配一个非空值（non-nil）给 userDefinedColorName ,再次执行空合运算,运算结果为封包在 userDefinedColorName中的值。
 而非默认值
 */

userDefinedColorName = "green"

colorNameToUse = userDefinedColorName ?? defaultColorName

//userDefinedColorName非空,因此colorNameToUsede的值为绿色


//: *****区间（也叫范围）运算符*****
/*:
 Swift 提供了两个方便表达一个区间的值的运算符。 
 
 闭区间运算符:
 
 闭区间运算符( a...b )定义一个包含从 a 到 b (包括 a 和 b )的所有值的区间, b 必须大于等于 a 。
 
 闭区间运算符在迭代一个区间的所有值时是非常有用的,如在 for-in 循环中:
 
 */

for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
// 1 * 5 = 5
// 2 * 5 = 10
// 3 * 5 = 15
// 4 * 5 = 20
// 5 * 5 = 25



//: 半开区间运算符
/*:
 半开区间( a..<b )定义一个从 a 到 b 但不包括 b 的区间。 
 
 之所以称为半开区间,是因为该区间包含第一个值而不包括最后的值。
 
 半开区间的实用性在于当你使用一个0始的列表(如数组)时,非常方便地从0数到列表的长度。
 */

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0..<count {
    
    print("第 \(i + 1) 个人叫 \(names[i])")
    
}
// 第 1 个人叫 Anna
// 第 2 个人叫 Alex
// 第 3 个人叫 Brian
// 第 4 个人叫 Jack

// 数组有4个元素,但 0..<count 只数到3(最后一个元素的下标),因为它是半开区间。
//: 8、逻辑运算符
/*:
 
 逻辑运算符修改或结合布尔逻辑值true和false。
 
 Swift支持这三个标准逻辑运算符基于c语言:
 
 Logical NOT (!a)        //逻辑非
 
 Logical AND (a && b)    //逻辑与
 
 Logical OR (a || b)     //逻辑或
 */

/*:
 
 以下列出了 Swift 语言支持的逻辑运算符，其中变量 A 为 true，变量 B 为 false：

 运算符        描述                               实例
 
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


//: 8.1逻辑非运算符
//逻辑非运算符(!a)转化一个Bollean值，以便true成为false，false变成true

let allowedEntry = false

if !allowedEntry {
    
    print("ACCESS DENIED")
}

//: 8.2逻辑与运算符

//:对于逻辑与运算，如果第一个操作数被判定为“false”，系统不再判定或求解第二个操作数。结果就为“ false”。

//:逻辑与运算符：（A && B），其中A和B两个值必须同时为true时表达式才正确。

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: 8.3逻辑或运算符
//表达式（a || b）运算符中、只要a或者b有一个为true、则表达式正确。
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: 8.4复合逻辑表达式 （ 逻辑运算符组合计算 ）

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
/*
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
