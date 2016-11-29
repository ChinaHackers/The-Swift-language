//: ## 下标语法（subscript)
//: - 下标脚本`（subscript）`可以定义在类、结构体和枚举中，作为访问集合、列表或序列的快捷方式
//: - 允许通过在实例后面的方括号传入一个或者多个索引值来对实例进行访问和赋值
//: - 定义下标使用`subscript`关键字，指定一个或多个输入参数和返回类型
//: - 与实例方法不同的是，下标可以设定为读写或只读。这种行为由 `getter` 和 `setter` 实现，有点类似计算型属性：
/*
subscript(index: Int) -> Int {
    get {
        // 返回一个适当的 Int 类型的值
    }
    
    set(newValue) {
        // 执行赋值操作
    }
}
*/
//: - `newValue`的类型和下标的返回类型相同。如同计算型属性，可以不指定 `setter` 的参数`（newValue）`。如果不指定参数，`setter` 会提供一个名为`newValue`的默认参数。

//: 如同只读计算型属性，可以省略只读下标的`get`关键字：
/*
subscript(index: Int) -> Int {
    // 返回一个适当的 Int 类型的值
}
 
*/

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍等于 \(threeTimesTable[6])")
// 输出 "3的6倍等于18"

print("3的9倍 等于 \(threeTimesTable[9])")
print("3的2倍 等于 \(threeTimesTable[2])")
print("3的3倍 等于 \(threeTimesTable[3])")
print("3的5倍 等于 \(threeTimesTable[5])")
print("3的7倍 等于 \(threeTimesTable[7])")
//: 在上例中，通过 `subexample` 结构体创建了一个 `TimesTable`实例，用来表示整数3的乘法表。数值3被传递给结构体的构造函数，作为实例成员`multiplier`的值。
//你可以通过下标访问threeTimesTable实例，例如上面演示的threeTimesTable[6]。这条语句查询了3的乘法表中的第六个元素，返回3的6倍即18...以此类推

//你可以通过下标脚本来得到结果，比如 threeTimesTable[3] 即为 3的3倍。
//: [后退](@previous) | [下标用法](@next)
