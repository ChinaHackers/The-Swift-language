//: ## 计算型属性（Computed Properties）
//: 扩展可以向已有类型添加计算型实例属性和计算型类型属性。下面的例子向 Swift 的内建Double类型添加了5个计算型实例属性，从而提供与距离单位协作的基本支持。
extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印输出："One inch is 0.0254 meters"
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印输出："Three feet is 0.914399970739201 meters"

//: - 这些计算属性表达的含义是把一个Double型的值看作是某单位下的长度值。即使它们被实现为计算型属性，这些属性的名字仍可使用点符号添加在浮点型的字面量之后，作为一种使用该字面量来执行距离转换的方法。
//: - 在上述例子中，一个Double型的值1.0被用来表示“1米”。这就是为什么m计算型属性返回self——表达式1.m被认为是计算1.0的Double值。
//: - 其它单位则需要一些转换来表示在米下测量的值。1千米等于1,000米，所以km计算型属性要把值乘以1_000.00来转化成单位米下的数值。类似地，1米有3.28024英尺，所以ft计算型属性要把对应的Double值除以3.28024来实现英尺到米的单位换算。

//: 这些属性是只读的计算型属性，所有从简考虑它们不用get关键字表示。它们的返回值是Double型，而且可以用于所有接受Double的数学计算中：

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
// 打印输出："A marathon is 42495.0 meters long"

//: > 注意： 扩展可以添加新的计算属性，但是不可以添加存储属性，也不可以向已有属性添加属性观测器(property observers)。


//: [上一页](@previous) | [下一页](@next)