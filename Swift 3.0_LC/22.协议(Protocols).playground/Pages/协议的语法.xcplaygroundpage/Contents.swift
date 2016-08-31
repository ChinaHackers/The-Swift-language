//: ## 协议的语法
//: 定义协议的方式与类、结构体、枚举类型非常相似：
protocol SomeProtocol {
     // 这里是协议的定义部分
}
//: 在自定义类型声明时，将协议名放在类型名的冒号之后来表示该类型采纳一个特定的协议。多个协议可以用逗号分开列出：
/*
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // 这里是结构体的定义部分
}
 */
//: 若一个类拥有父类，将这个父类名放在其采纳的协议名之前，并用逗号分隔：
/*
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
     // 这里是类的定义部分
}
*/
//: [上一页](@previous) | [下一页](@next)
