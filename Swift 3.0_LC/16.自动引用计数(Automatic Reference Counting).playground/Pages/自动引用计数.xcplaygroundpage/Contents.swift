//:## 自动引用计数(Automatic Reference Counting)
//: 本页包含内容:
//: - 自动引用计数的工作机制
//: - 自动引用计数实践
//: - 类实例之间的循环强引用
//: - 解决实例之间的循环强引用
//: - 闭包引起的循环强引用
//: - 解决闭包引起的循环强引用

/*: 
 `Swift` 使用自动引用计数`(ARC)`机制来跟踪和管理你的应用程序的内存。
 通常情况下,`Swift` 内存管理机制会一直起作用,你无须自己来考虑内存的管理。
 `ARC` 会在类的实例不再被使用时,自动释放其占用的内存。
 然而,在少数情况下,`ARC` 为了能帮助你管理内存,需要更多的关于你的代码之间关系的信息。
 本章描述了这些 情况,并且为你示范怎样启用 `ARC` 来管理你的应用程序的内存。
 */
//:> 注意: 引用计数仅仅应用于类的实例。结构体和枚举类型是值类型,不是引用类型,也不是通过引用的方式存储和传 递。

//: [下一页](@next)