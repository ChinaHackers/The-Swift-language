//: ## 下标用法
//: 通常下标脚本是用来访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。
//: - Swift 的字典（Dictionary）实现了通过下标脚本对其实例中存放的值进行存取操作。
//: -  在下标脚本中使用和字典索引相同类型的值，并且把一个字典值类型的值赋值给这个下标脚来为字典设值
// 定义一个名为numberOfLegs的变量并用一个字典字面量初始化出了包含三对键值的字典实例。
//numberOfLegs的字典存放值类型推断为 Dictionary
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

// 字典实例创建完成之后,通过下标脚本的方式将 整型值2 赋值到字典实例的索引为 bird 的位置中
numberOfLegs["bird"] = 2

print(numberOfLegs)
//: [上一页](@previous) | [下一页](@next)
