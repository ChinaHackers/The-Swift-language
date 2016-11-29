//: ##  For 循环
//: - Swift 提供两种for循环形式以来按照指定的次数多次执行一系列语句：

//:      for-in循环对一个集合里面的每个元素执行一系列语句。
//:      for 循环，用来重复执行一系列语句直到达成特定条件达成，一般通过在每次循环完成后增加计数器的值来实现。
//: ---

//: #### For-In 循环
//: 你可以使用for-in循环来遍历一个集合里面的所有元素，例如由数字表示的区间、数组中的元素、字符串中的字符。
// 下面的例子用来输出乘 5 乘法表前面一部分内容：
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25
/*:
 - 例子中用来进行遍历的元素是一组使用闭区间操作符（...）表示的从1到5的数字。`index`被赋值为闭区间中的第一个数字（1），然后循环中的语句被执行一次。在本例中，这个循环只包含一个语句，用来输出当前 `index` 值所对应的乘 5 乘法表结果。 该语句执行后，`index` 的值被更新为闭区间中的第二个数字（2），之后 `print(_:separator:terminator:)` 函数会再执行一次。整个过程会进行到闭区间结尾为止。
 
 - 上面的例子中，`index` 是一个每次循环遍历开始时被自动赋值的常量。这种情况下，`index` 在使用前不需要声明，只需要将它包含在循环的声明中，就可以对其进行隐式声明，而无需使用 `let` 关键字声明。
 */
//如果你不需要知道区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略对值的访问：
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// 输出 "3 to the power of 10 is 59049"
/*:
 - 这个例子计算 base 这个数的 power 次幂（本例中，是3的10次幂），从1（3的0次幂）开始做3的乘法， 进行10次，
 - 使用1到10的闭区间循环。这个计算并不需要知道每一次循环中计数器具体的值，只需要执行了正确的循环次数即可。
 - 下划线符号_（替代循环中的变量）能够忽略具体的值，并且不提供循环遍历时对值的访问。
 */

//:使用for-in遍历一个数组所有元素：
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!
/*:
 你也可以通过遍历一个字典来访问它的键值对。遍历字典时，字典的每项元素会以(key, value)元组的形式返回，你可以在for-in循环中使用显式的常量名称来解读(key, value)元组。下面的例子中，字典的键（key）解读为常量animalName，字典的值会被解读为常量legCount：
 */
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// cats have 4 legs
// spiders have 8 legs

//字典元素的遍历顺序和插入顺序可能不同，字典的内容在内部是无序的，所以遍历元素时不能保证顺序。关于数组和字典，详情参见集合类型。
//: ----
//: 在Swift2.2开始已经否决了 (`for var index = 0; index < 3; ++index `),传统 `C` 风格的 `for` 循环被干掉了
/*
 也就是说下面这种写法在 2.2 的版本被 否决 了
 for var i = 1; i <= 10; i++ {
    print("\(i)")
 }
 
 */

// 以后要这么写了：
 for i in 1...10 {
    print("\(i)")
 }

//如果想要创建一个由大到小的范围，你按照下面的写法编译或许没问题，但运行时会崩溃
// for i in 10...1 {
//    print("\(i) SwiftGG awesome")
// }

//应当这么写：
 for i in (1...10).reversed() {
    print("\(i)")
 }

// 另一种选择是使用标准的快速枚举来遍历数组
 var array = Array(1...10)
 
 for number in array {
    
    print("\(number) green bottles")
 }
//: [后退](@previous) | [While循环](@next)
