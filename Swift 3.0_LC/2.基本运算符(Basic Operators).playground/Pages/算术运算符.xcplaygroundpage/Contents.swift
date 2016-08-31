//: ### 算术运算符
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
//:不同于C和Objective-C，默认情况下Swift的算术运算符不允许值溢出。
//:你可以通过Swift的溢出运算符来选择值的溢出情况(例如 a & + b)。
//两个字符，或者一个字符一个字符串，能组合成一个新的字符串：
let dog: Character = "🐶"
let cow: Character = "🐮"
//let dogCow = dog + cow  // dogCow is equal to "🐶🐮"
var dogCow: String = ""
dogCow.append(dog)
dogCow.append(cow)
print(dogCow)

//: 求余运算符
//: - 求余运算符(a % b)a是b的几倍并且返回被留下的值(叫作余数)
9 % 4 // 余数 1

//浮点数求余数计算
//不同于C和Objective-C，Swift的余数运算符也能运用于浮点数：

//8 % 2.5 // 余数 0.5
//: 8 被 2.5 分成了 3 份，剩下了一个 0.5 ，所以 余数运算会返回一个 Double  值 0.5 。

/*:
 swift(自增++ )和(自减运算符 -- )被取消.
 Swift 2.2 正式将 (++) 和 (--) 否决掉了，意味着虽然在 Swift 2.2 版本还能工作，但编译器会给你一个警告。但在 3.0 版本会被完全移除。
 
 你可以使用 += 1 和 -= 1 来替代，至于为什么要将其移除，有这么几个解释：
 
 写 ++ 并不比 +=1 能节省多少时间, ++ 对学 Swift 没有任何帮助，+= 至少可读性更好
 传统 C styel for 循环中的 – 也被否决掉了
 
 */
var a1 = 0

//要注意的是，复合赋值操作符不返回值。例如，你不能写让成"let b1 = a1 += 1"
 let b1 = a1 += 1 // a和b是现在都等于1
 let c1 = a1 += 1 // 现在等于2,但c1前增量值被设置为1

//一元负号运算符（一个数值前加了符号-，叫作一元减运算符）
let three = 3
let minusThree = -three     // minusThree 等于 -3
let plusThree = -minusThree // plusThree 等于 3, or "minus minus three"


//一元正号算符（一元加运算符(+)返回的值，不做任何变动）
let minusSix = -6
let alsoMinusSix = +minusSix // alsoMinusSix 等于 -6

//: [赋值运算符](@previous) | [组合赋值运算符](@next)
