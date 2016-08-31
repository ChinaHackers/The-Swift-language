//: ## Where 子句
//: - 类型约束让你能够为泛型函数或泛型类型的类型参数定义一些强制要求。

//: 为关联类型定义约束也是非常有用的。你可以在参数列表中通过 `where` 子句为关联类型定义约束。你能通过 `where` 子句要求一个关联类型遵从某个特定的协议，以及某个特定的类型参数和关联类型必须类型相同。你可以通过将 `where` 关键字紧跟在类型参数列表后面来定义 `where` 子句，`where` 子句后跟一个或者多个针对关联类型的约束，以及一个或多个类型参数和关联类型间的相等关系。
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
struct Stack<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item: item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: Container {}

//: - 下面的例子定义了一个名为 `allItemsMatch` 的泛型函数，用来检查两个 `Container` 实例是否包含相同顺序的相同元素。如果所有的元素能够匹配，那么返回 `true`，否则返回 `false`。
//: - 被检查的两个 `Container` 可以不是相同类型的容器（虽然它们可以相同），但它们必须拥有相同类型的元素。这个要求通过一个类型约束以及一个 `where` 子句来表示：
func allItemsMatch<C1: Container, C2: Container> (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    
     // 检查两个容器含有相同数量的元素
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // 检查每一对元素是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 所有元素都匹配，返回 true
    return true
    
}

//: 这个函数接受 `someContainer` 和 `anotherContainer` 两个参数。参数 `someContainer` 的类型为 C1，参数 `anotherContainer` 的类型为 C2。C1 和 C2 是容器的两个占位类型参数，函数被调用时才能确定它们的具体类型。

//: 这个函数的类型参数列表还定义了对两个类型参数的要求：
//: - `C1` 必须符合 `Container` 协议（写作 `C1: Container）。`
//: - `C2` 必须符合 `Container` 协议（写作 `C2: Container）。`
//: - `C1` 的 `ItemType` 必须和 `C2` 的 `ItemType`类型相同（写作 `C1.ItemType == C2.ItemType）。`
//: - `C1` 的 `ItemType` 必须符合 `Equatable` 协议（写作 `C1.ItemType: Equatable）。`
//: - 第三个和第四个要求被定义为一个 `where` 子句，写在关键字 `where` 后面，它们也是泛型函数类型参数列表的一部分。

//:这些要求意味着：
//: - `someContainer` 是一个 `C1` 类型的容器。
//: - `anotherContainer` 是一个 `C2` 类型的容器。
//: - `someContainer` 和 `anotherContainer` 包含相同类型的元素。
//: - `someContainer` 中的元素可以通过不等于操作符`（!=）`来检查它们是否彼此不同。
//: - 第三个和第四个要求结合起来意味着 `anotherContainer` 中的元素也可以通过 `!=` 操作符来比较，因为它们和 `someContainer` 中的元素类型相同。

//: 这些要求让 `allItemsMatch(_:_:)` 函数能够比较两个容器，即使它们的容器类型不同。
//: `allItemsMatch(_:_:)` 函数首先检查两个容器是否拥有相同数量的元素，如果它们的元素数量不同，那么一定不匹配，函数就会返回 `false。`

//: 进行这项检查之后，通过 `for-in` 循环和半闭区间操作符`（..<）`来迭代每个元素，检查 `someContainer` 中的元素是否不等于 `anotherContainer` 中的对应元素。如果两个元素不相等，那么两个容器不匹配，函数返回 `false。`
//如果循环体结束后未发现任何不匹配的情况，表明两个容器匹配，函数返回 true。

//下面演示了 allItemsMatch(_:_:) 函数的使用：
var stackOfStrings = Stack<String>()
stackOfStrings.push(item: "uno")
stackOfStrings.push(item: "dos")
stackOfStrings.push(item: "tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}
// 打印 “All items match.”

//: 上面的例子创建了一个 `Stack` 实例来存储一些 `String` 值，然后将三个字符串压入栈中。这个例子还通过数组字面量创建了一个 `Array` 实例，数组中包含同栈中一样的三个字符串。即使栈和数组是不同的类型，但它们都遵从 `Container`协议，而且它们都包含相同类型的值。因此你可以用这两个容器作为参数来调用 `allItemsMatch(_:_:)` 函数。在上面的例子中，`allItemsMatch(_:_:)` 函数正确地显示了这两个容器中的所有元素都是相互匹配的。

//: [上一页](@previous)
