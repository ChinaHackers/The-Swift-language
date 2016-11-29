//: ## 比较字符串 (Comparing Strings)
//: Swift 提供了三种方式来比较文本值：字符串字符相等、前缀相等 和 后缀相等。

//: ---
//: #### 字符串/字符相等 (String and Character Equality)

//: 字符串/字符可以用等于操作符(==)和不等于操作符(!=)
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"

//: - 如果两个字符串（或者两个字符）的可扩展的字形群集是标准相等的，那就认为它们是相等的。在这个情况下，即使可扩展的字形群集是有不同的 Unicode 标量构成的，只要它们有同样的语言意义和外观，就认为它们标准相等。

/*:
 例如，LATIN SMALL LETTER E WITH ACUTE(U+00E9)就是标准相等于LATIN SMALL LETTER E(U+0065)后面加上COMBINING ACUTE ACCENT(U+0301)。
 这两个字符群集都是表示字符é的有效方式，所以它们被认为是标准相等的：
 */
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"

//: 相反，英语中的LATIN CAPITAL LETTER A(U+0041，或者A)不等于俄语中的CYRILLIC CAPITAL LETTER A(U+0410，或者A)。两个字符看着是一样的，但却有不同的语言意义：
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
// 打印 "These two characters are not equivalent"

//:> 注意： 在 Swift 中，字符串 和 字符 的比较, 并不区分区域

//: ---

//: #### 前缀/后缀相等 (Prefix and Suffix Equality)
//: 通过调用字符串的 `hasPrefix(_:)` 和 `hasSuffix(_:)` 方法来检查字符串是否拥有特定前缀 或 后缀，两个方法均接收一个String类型的参数，并返回一个布尔值。
// 下面的例子以一个字符串数组表示莎士比亚话剧《罗密欧与朱丽叶》中前两场的场景位置：
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

//: 你可以调用 `hasPrefix(_:)` 方法来计算话剧中第一幕的场景数：
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// 打印输出 "There are 5 scenes in Act 1"
//: 使用 `hasSuffix(_:)` 方法来计算发生在不同地方的场景数：
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// 打印输出 "6 mansion scenes; 2 cell scenes"
//:> 注意： `hasPrefix(_:)` 和 `hasSuffix(_:)` 方法都是在每个字符串中逐字符比较其可扩展的字符群集是否标准相等，详细描述在字符串/字符相等。

//: [上一页](@previous) | [下一页](@next)
