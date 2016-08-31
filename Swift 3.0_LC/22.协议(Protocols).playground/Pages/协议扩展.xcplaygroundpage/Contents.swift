//: ## 协议扩展

//: 协议可以通过扩展来提供方法和属性的实现以遵循类型。这就允许你在协议自身定义行为，而不是在每一个遵循或者在全局函数里定义。比如说， RandomNumberGenerator 协议可以扩展来提供 randomBool() 方法，它使用要求的 random() 方法来返回随机的 Bool 值：

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
//通过给协议创建扩展，所有的遵循类型自动获得这个方法的实现而不需要任何额外的修改。

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And here's a random Boolean: \(generator.randomBool())")
// Prints "And here's a random Boolean: true"

//: ### 提供默认实现
//: 你可以使用协议扩展来给协议的任意方法或者计算属性要求提供默认实现。如果遵循类型给这个协议的要求提供了它自己的实现，那么它就会替代扩展中提供的默认实现。

//:> 注意: 通过扩展给协议要求提供默认实现与可选协议要求的区别是明确的。尽管遵循协议都不需要提供它们自己的实现。有默认实现的要求不需要使用可选链就能调用。
//举例来说，继承自 TextRepresentable 的 PrettyTextRepresentable 协议可以给它要求的 prettyTextualDescription 属性提供一个默认实现来简单的返回访问 textualDescription 属性的结果：
extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//: ### 给协议扩展添加限制

//当你定义一个协议扩展，你可以明确遵循类型必须在扩展的方法和属性可用之前满足的限制。如同 Where 分句（此处应有链接）中描述的那样，在扩展协议名字后边使用 where 分句来写这些限制。比如说，你可以给 Collection 定义一个扩展来应用于任意元素遵循上面 TextRepresentable 协议的集合。
extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
//textualDescription 属性返回整个集合写在花括号里通过用逗号组合集合中每个元素的文本化表示的文本化描述。
//
//考虑之前的 Hamster 结构体，它遵循 TextRepresentable 协议， Hamster 值的数组：


let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
//由于 Array 遵循 Collection 并且数组的元素遵循 TextRepresentable 协议，数组可以使用 textualDescription 属性来获取它内容的文本化表示：

print(hamsters.textualDescription)
// Prints "[A hamster named Murray, A hamster named Morgan, A hamster named Maurice]"

//:> 注意: 如果遵循类型满足了为相同方法或者属性提供实现的多限制扩展的要求，Swift 会使用最匹配限制的实现。

//: [上一页](@previous) | [下一页](@next)
