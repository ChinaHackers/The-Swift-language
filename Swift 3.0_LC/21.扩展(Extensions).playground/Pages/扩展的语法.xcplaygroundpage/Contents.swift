//: ## 扩展的语法
//使用 extension 关键字来声明扩展：
/*
extension SomeType {
    // 加到SomeType的新功能写到这里
}

//扩展可以使已有的类型遵循一个或多个协议。在这种情况下，协议名的书写方式与类或结构体完全一样：
extension SomeType: SomeProtocol, AnotherProtocol {
     // 协议实现写到这里
}
*/
//: 按照这种方式添加的协议遵循者（protocol conformance）被称之为在扩展中添加协议遵循者

//:     注意:如果你向已存在的类型添加新功能，新功能会在该类型的所有实例中可用，即使实例在该扩展定义之前就已经创建。

//: [上一页](@previous) | [下一页](@next)
