//: ## 元组类型(tuple)
//: - 元组类型可以将任意数据类型组装成一个元素
//: - 元组类型在作为函数返回值的时候特别适用，可以为函数返回更多的用户需要的信息。
//: - 元组（tuples）把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型。
//创建元组1
let (x, y) = (1, 2)

//访问元组 - key、value对应方式
print("x is \(x) and y is \(y)")
/*:
 下面这个例子中，`(404, "Not Found")`是一个描述 `HTTP `状态码`（HTTP status code）`的元组。
 `HTTP` 状态码是当你请求网页的时候` web `服务器返回的一个特殊值。
 如果你请求的网页不存在就会返回一个`404 Not Found`状态码。”
 */
//创建元组2
let http404Error = (404, "Not Found")   //由一个Int和一个字符串String组成
print(http404Error)

//:指名`value`的`key`。`statusCode`对应值`404`，`statusMessage`对应值`"Not Found"`
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")         //访问第一个值
print("The status message is \(statusMessage)")   //访问第二个值

//:如果仅需要元组中的个别值，可以使用(_)来忽略不需要的值
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")  //仅需要第一个值

//:访问元组 - 序号访问方式，序号从0开始
print("The status code is \(http404Error.0)")     //访问第一个值
print("The status message is \(http404Error.1)")  //访问第二个值
//创建元组3
//:在定义元组的时候给单个元素命名：
//:以下 `statusCode、description` 为元组的元素
let http200Status = (statusCode: 200, description: "OK")

// 给元组中的元素命名后，你可以通过名字来获取这些元素的值：
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


//: [Next](@next)
