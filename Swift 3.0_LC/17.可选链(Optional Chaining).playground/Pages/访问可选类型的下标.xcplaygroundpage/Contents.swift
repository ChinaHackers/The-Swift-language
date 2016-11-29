//: ## 访问可选类型的下标
//: 如果下标返回一个可选类型的值——比如说 Swift 的 Dictionary 类型的键下标——放一个问号在下标的方括号后边来链接它的可选返回值：


var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
// the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]

//:上面的栗子中定义了一个叫做 testScores 的字典，它包含两个键值对把 String 类型的键映射到一个整型值的数组。这个栗子用可选链把 "Dave" 数组中第一个元素设为 91 ；把 "Bev" 数组的第一个元素增加 1 ；然后尝试设置 "Brian" 数组中的第一个元素。前两个调用是成功了，因为 testScores 字典包含了 "Dave" 和 "Bev" 这两个键。第三个调用失败了，因为字典 testScores 并没有包含 "Brian" 键。

//: [上一页](@previous) | [下一页](@next)
