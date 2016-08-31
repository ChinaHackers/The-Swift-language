//: Playground - noun: a place where people can play


//: - 枚举（Enumerations）

1.0 翻译：yankuangshi 校对：shinyzhu

2.0 翻译+校对：futantan

2.1 翻译：Channe 校对：shanks，

2.2 翻译+校对：SketchK 2016-05-13
本页内容包含：

枚举语法（Enumeration Syntax）
使用 Switch 语句匹配枚举值（Matching Enumeration Values with a Switch Statement）
关联值（Associated Values）
原始值（Raw Values）
递归枚举（Recursive Enumerations）
枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。

如果你熟悉 C 语言，你会知道在 C 语言中，枚举会为一组整型值分配相关联的名称。Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值（称为“原始”值），则该值的类型可以是字符串，字符，或是一个整型值或浮点数。

此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其他语言中的联合体（unions）和变体（variants）。每一个枚举成员都可以有适当类型的关联值。

在 Swift 中，枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性，例如计算型属性（computed properties），用于提供枚举值的附加信息，实例方法（instance methods），用于提供和枚举值相关联的功能。枚举也可以定义构造函数（initializers）来提供一个初始值；可以在原始实现的基础上扩展它们的功能；还可以遵守协议（protocols）来提供标准的功能。

欲了解更多相关信息，请参见属性（Properties），方法（Methods），构造过程（Initialization），扩展（Extensions）和协议（Protocols）。