//: ## 泛型类型
//: - 除了泛型函数，Swift 还允许你定义泛型类型。这些自定义类、结构体和枚举可以适用于任何类型，类似于 `Array` 和 `Dictionary`。
//: - 这部分内容将向你展示如何编写一个名为 `Stack （栈）`的泛型集合类型。栈是一系列值的有序集合，和 `Array`类似，但它相比 Swift 的 Array 类型有更多的操作限制。数组允许在数组的任意位置插入新元素或是删除其中任意位置的元素。而栈只允许在集合的末端添加新的元素（称之为入栈）。类似的，栈也只能从末端移除元素（称之为出栈）。
import UIKit
//:下图展示了一个栈的入栈（push）和出栈（pop）的行为：
UIImage(named: "pushpop")
//: - 1.现在有三个值在栈中。
//: - 2.第四个值被压入到栈的顶部。
//: - 3.现在有四个值在栈中，最近入栈的那个值在顶部。
//: - 4.栈中最顶部的那个值被移除，或称之为出栈。
//: - 5.移除掉一个值后，现在栈又只有三个值了。
//下面展示了如何编写一个非泛型版本的栈，以 Int 型的栈为例：
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

//: 这个结构体在栈中使用一个名为 `items` 的 `Array` 属性来存储值。`Stack` 提供了两个方法：`push(_:)` 和 `pop()`，用来向栈中压入值以及从栈中移除值。这些方法被标记为 `mutating`，因为它们需要修改结构体的 `items` 数组。

//: 上面的 `IntStack` 结构体只能用于 `Int` 类型。不过，可以定义一个泛型 `Stack` 结构体，从而能够处理任意类型的值。
//下面是相同代码的泛型版本：
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
//:> 注意: `Stack` 基本上和 `IntStack` 相同，只是用占位类型参数 `Element` 代替了实际的 `Int` 类型。这个类型参数包裹在紧随结构体名的一对尖括号里`（<Element>）`。

//: `Element` 为待提供的类型定义了一个占位名。这种待提供的类型可以在结构体的定义中通过 `Element` 来引用。在这个例子中，`Element` 在如下三个地方被用作占位符：
//: - 创建 `items` 属性，使用 `Element` 类型的空数组对其进行初始化。
//: - 指定 `push(_:)` 方法的唯一参数 `item` 的类型必须是 `Element` 类型。
//: - 指定 `pop()` 方法的返回值类型必须是 `Element` 类型。

//: 由于 Stack 是泛型类型，因此可以用来创建 Swift 中任意有效类型的栈，就像 Array 和 Dictionary 那样。

//: 你可以通过在尖括号中写出栈中需要存储的数据类型来创建并初始化一个 Stack 实例。例如，要创建一个 String 类型的栈，可以写成 Stack<String>()：
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
// 栈中现在有 4 个字符串
//下图展示了 stackOfStrings 如何将这四个值入栈：
UIImage(named: "stackPushedFourStrings_2x")
//: 移除并返回栈顶部的值 "cuatro"，即将其出栈：
let fromTheTop = stackOfStrings.pop()
// fromTheTop 的值为 "cuatro"，现在栈中还有 3 个字符串

//下图展示了 stackOfStrings 如何将顶部的值出栈：
UIImage(named: "stackPoppedOneString_2x")


//: [上一页](@previous) | [下一页](@next)

