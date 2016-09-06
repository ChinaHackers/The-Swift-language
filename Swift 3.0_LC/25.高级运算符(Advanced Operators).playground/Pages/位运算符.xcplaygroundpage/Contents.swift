import UIKit
//: ## 位运算符
//位运算符可以操作数据结构中每个独立的比特位。它们通常被用在底层开发中，比如图形编程和创建设备驱动。位运算符在处理外部资源的原始数据时也十分有用，比如对自定义通信协议传输的数据进行编码和解码。


//: ### 按位取反运算符
//: - 按位取反运算符（~）可以对一个数值的全部比特位进行取反：

UIImageView(image: UIImage(named: "bitwiseNOT_2x"))
//按位取反运算符是一个前缀运算符，需要直接放在运算的数之前，并且它们之间不能添加任何空格：

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits // 等于 0b11110000

//: UInt8整数有8位，可以存储之间的任意值0和255。这个例子初始化一个UInt8与二进制值的整数00001111，其设置为前四位0，其第二四位设置1。这等同于一个十进制值15。

//: 接着使用按位取反运算符创建了一个名为 invertedBits 的常量，这个常量的值与全部位取反后的 initialBits 相等。即所有的 0 都变成了 1，同时所有的 1 都变成 0。invertedBits 的二进制值为 11110000，等价于无符号十进制数的 240。

//: ### 按位与运算符
//: 按位与运算符（&）可以对两个数的比特位进行合并。它返回一个新的数，只有当两个数的对应位都为 1 的时候，新数的对应位才为 1：
UIImageView(image: UIImage(named: "bitwiseAND_2x"))
//在下面的示例当中，firstSixBits 和 lastSixBits 中间 4 个位的值都为 1。按位与运算符对它们进行了运算，得到二进制数值 00111100，等价于无符号十进制数的 60：

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits // 等于 00111100

//: ### 按位或运算符
//: 按位或运算符（|）可以对两个数的比特位进行比较。它返回一个新的数，只要两个数的对应位中有任意一个为 1 时，新数的对应位就为 1：
UIImageView(image: UIImage(named: "bitwiseOR_2x"))
//在下面的示例中，someBits 和 moreBits 不同的位会被设置为 1。接位或运算符对它们进行了运算，得到二进制数值 11111110，等价于无符号十进制数的 254：
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits // 等于 11111110

//: ### 按位异或运算符
//: 按位异或运算符（^）可以对两个数的比特位进行比较。它返回一个新的数，当两个数的对应位不相同时，新数的对应位就为 1：
UIImageView(image: UIImage(named: "bitwiseXOR_2x"))
//在下面的示例当中，firstBits 和 otherBits 都有一个自己的位为 1 而对方的对应位为 0 的位。 按位异或运算符将新数的这两个位都设置为 1，同时将其它位都设置为 0：
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits // 等于 00010001

//: ### 按位左移、右移运算符

//: 按位左移运算符（<<）和按位右移运算符（>>）可以对一个数的所有位进行指定位数的左移和右移，但是需要遵守下面定义的规则。

//对一个数进行按位左移或按位右移，相当于对这个数进行乘以 2 或除以 2 的运算。将一个整数左移一位，等价于将这个数乘以 2，同样地，将一个整数右移一位，等价于将这个数除以 2。






//: [上一页](@previous) | [下一页](@next)
