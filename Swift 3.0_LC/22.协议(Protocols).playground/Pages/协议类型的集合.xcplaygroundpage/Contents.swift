//: ## 协议类型的集合

//: 协议可以用作储存在集合比如数组或者字典中的类型，如同在协议作为类型（此处应有链接）。这个例子创建了一个 TextRepresentable 实例的数组：


let things: [TextRepresentable] = [game, d12, simonTheHamster]

//现在可以遍历数组中的元素了，并且打印每一个元素的文本化描述：
for thing in things {
    print(thing.textualDescription)
}
// A game of Snakes and Ladders with 25 squares
// A 12-sided dice
// A hamster named Simon

//注意 thing 常量是 TextRepresentable 类型。它不是 Dice 类型，抑或 DiceGame 还是 Hamster ，就算后台实际类型是它们之一。总之，由于它是 TextRepresentable ，并且 TextRepresentable 唯一已知的信息就是包含了 textualDescription 属性，所以每次循环来访问 thing.textualDescription 是安全的。



//: [上一页](@previous) | [下一页](@next)
