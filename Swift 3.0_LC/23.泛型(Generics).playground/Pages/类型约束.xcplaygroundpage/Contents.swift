//: ## 类型约束
//: - `swapTwoValues(_:_:)` 函数和 `Stack` 类型可以作用于任何类型。不过，有的时候如果能将使用在泛型函数和泛型类型中的类型添加一个特定的类型约束，将会是非常有用的。类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
//: - 例如，`Swift` 的 `Dictionary` 类型对字典的键的类型做了些限制。在字典的描述中，字典的键的类型必须是可哈希`（hashable）`的。也就是说，必须有一种方法能够唯一地表示它。`Dictionary` 的键之所以要是可哈希的，是为了便于检查字典是否已经包含某个特定键的值。若没有这个要求，`Dictionary` 将无法判断是否可以插入或者替换某个指定键的值，也不能查找到已经存储在字典中的指定键的值。
//: - 为了实现这个要求，一个类型约束被强制加到 `Dictionary` 的键类型上，要求其键类型必须符合 `Hashable` 协议，这是 `Swift` 标准库中定义的一个特定协议。所有的 `Swift` 基本类型（例如 `String、Int、Double 和 Bool`）默认都是可哈希的。
//: - 当你创建自定义泛型类型时，你可以定义你自己的类型约束，这些约束将提供更为强大的泛型编程能力。抽象概念，例如可哈希的，描述的是类型在概念上的特征，而不是它们的显式类型。

//: ### 类型约束语法
//: - 你可以在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔，来定义类型约束，它们将成为类型参数列表的一部分。对泛型函数添加类型约束的基本语法如下所示（作用于泛型类型时的语法与之相同）：
/*
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // 这里是泛型函数的函数体部分
}
*/
//: 上面这个函数有两个类型参数。第一个类型参数 T，有一个要求 T 必须是 SomeClass 子类的类型约束；第二个类型参数 U，有一个要求 U 必须符合 SomeProtocol 协议的类型约束。

//: ### 类型约束实践
//: 这里有个名为 `findStringIndex` 的非泛型函数，该函数的功能是在一个 `String` 数组中查找给定 `String` 值的索引。若查找到匹配的字符串，`findStringIndex(_:_:)` 函数返回该字符串在数组中的索引值，否则返回 `nil：`
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
//: `findIndex(ofString:in:) ` 函数可以用于查找字符串数组中的某个字符串：
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}
// 打印 “The index of llama is 2”
//:如果只能查找字符串在数组中的索引，用处不是很大。不过，你可以用占位类型 `T` 替换 `String` 类型来写出具有相同功能的泛型函数 `findIndex(_:_:)。`

//: 下面展示了 `findStringIndex(_:_:)` 函数的泛型版本 `findIndex(_:_:)。`请注意这个函数返回值的类型仍然是 `Int?`，这是因为函数返回的是一个可选的索引数，而不是从数组中得到的一个可选值。需要提醒的是，这个函数无法通过编译，原因会在例子后面说明：
/*
func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
 */

//上面所写的函数无法通过编译。问题出在相等性检查上，即 "if value == valueToFind"。不是所有的 Swift 类型都可以用等式符（==）进行比较。比如说，如果你创建一个自定义的类或结构体来表示一个复杂的数据模型，那么 Swift 无法猜到对于这个类或结构体而言“相等”意味着什么。正因如此，这部分代码无法保证适用于每个可能的类型 T，当你试图编译这部分代码时会出现相应的错误。

//不过，所有的这些并不会让我们无从下手。Swift 标准库中定义了一个 Equatable 协议，该协议要求任何遵循该协议的类型必须实现等式符（==）及不等符(!=)，从而能对该类型的任意两个值进行比较。所有的 Swift 标准类型自动支持 Equatable 协议。
//:任何 Equatable 类型都可以安全地使用在 `findIndex(of:in:)` 函数中，因为其保证支持等式操作符。为了说明这个事实，当你定义一个函数时，你可以定义一个 `Equatable` 类型约束作为类型参数定义的一部分：
func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
//: - `findIndex(of:in:)`  唯一的类型参数写做 `T: Equatable`，也就意味着“任何符合 `Equatable` 协议的类型 T ”。
//: - `findIndex(of:in:)` 函数现在可以成功编译了，并且可以作用于任何符合 `Equatable` 的类型，如 `Double` 或 `String：`
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex 类型为 Int?，其值为 nil，因为 9.3 不在数组中

let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex 类型为 Int?，其值为 2

//: [上一页](@previous) | [下一页](@next)
