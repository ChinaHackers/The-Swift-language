//: ## 下标（Subscripts）
//: 扩展可以向一个已有类型添加新下标。这个例子向Swift内建类型Int添加了一个整型下标。该下标[n]返回十进制数字从右向左数的第n个数字
//123456789[0]返回9
//123456789[1]返回8
//...等等
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
//746381295[0]
// returns 5
746381295[1]
// returns 9
746381295[2]
// returns 2
746381295[8]
// returns 7

//: 如果该Int值没有足够的位数，即下标越界，那么上述实现的下标会返回0，因为它会在数字左边自动补0：

746381295[9]
//returns 0, 即等同于：
0746381295[9]


//: [上一页](@previous) | [下一页](@next)
