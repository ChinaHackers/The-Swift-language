//: ## 使用字符（Working with Characters)

//: 您可通过 `for-in` 循环, 来遍历字符串中的 `characters` 属性来获取每一个字符的值.
for character in "Dog!🐶".characters {
    print(character)
}
// D
// o
// g
// !
// 🐶
//: 通过标明一个 `Character` 类型, 并用字符字面量进行赋值，可以建立一个独立的字符常量或变量：
let exclamationMark: Character = "!"
//: 字符串可以通过传递一个值类型为 `Character` 的数组作为 自变量来初始化：
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//: [上一页](@previous) | [下一页](@next)
