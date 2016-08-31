//: ## 嵌套类型（Nested Types）
//: 扩展可以为已有的类、结构体和枚举添加新的嵌套类型：
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}
//: - 该例子为 `Int` 添加了嵌套枚举。这个名为 `Kind` 的枚举表示特定整数的类型。具体来说，就是表示整数是正数、零或者负数。
//: - 这个例子还为 `Int` 添加了一个计算型实例属性，即 `kind`，用来根据整数返回适当的 `Kind` 枚举成员。
//现在，这个嵌套枚举可以和任意 Int 值一起使用了：
func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", terminator: "")
        case .Zero:
            print("0 ", terminator: "")
        case .Positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds(numbers: [3, 19, -27, 0, -6, 0, 7])
// 打印 “+ + - 0 - 0 + ”
//: 函数 `printIntegerKinds(_:)` 接受一个 `Int` 数组，然后对该数组进行迭代。在每次迭代过程中，对当前整数的计算型属性 `kind` 的值进行评估，并打印出适当的描述。

//:> 注意 由于已知 `number.kind` 是 `Int.Kind` 类型，因此在 `switch` 语句中，`Int.Kind` 中的所有成员值都可以使用简写形式，例如使用 `. Negative` 而不是 `Int.Kind.Negative。`

//: [上一页](@previous)
