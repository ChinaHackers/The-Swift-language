//: ## 访问控制（Access Control）
//: 本页内容包括：
//: - 1 - 模块和源文件
//: - 2 - 访问级别
//: - 2.1 - 访问级别基本原则
//: - 2.2 - 默认访问级别
//: - 2.3 - 单 `target` 应用程序的访问级别
//: - 2.4 - 框架的访问级别
//: - 2.5 - 单元测试 `target` 的访问级别
//: - 3 - 访问控制语法
//: - 4 - 自定义类型
//: - 4.1 - 元组类型
//: - 4.2 - 函数类型
//: - 4.3 - 枚举类型
//: - 4.4 - 嵌套类型
//: - 5 - 子类
//: - 6 - 常量、变量、属性、下标
//: - 6.1 - Getter和Setter
//: - 7 - 构造器
//: - 7.1 - 默认构造器
//: - 7.2 - 结构体默认的成员逐一构造器
//: - 8 - 协议
//: - 8.1 - 协议继承
//: - 8.2 - 协议一致性
//: - 9 - 扩展
//: - 9.1 - 通过扩展添加协议一致性
//: - 10 - 泛型
//: - 11 - 类型别名

//: ---
/*: 
 
 访问控制可以限定其他源文件或模块中的代码对你的代码的访问级别。这个特性可以让我们隐藏代码的一些实现细节，并且可以为其他人可以访问和使用的代码提供接口。

 你可以明确地给单个类型（类、结构体、枚举）设置访问级别，也可以给这些类型的属性、方法、构造器、下标等设置访问级别。协议也可以被限定在一定的范围内使用，包括协议里的全局常量、变量和函数。

 `Swift` 不仅提供了多种不同的访问级别，还为某些典型场景提供了默认的访问级别，这样就不需要我们在每段代码中都申明显式访问级别。其实，如果只是开发一个单一 `target` 的应用程序，我们完全可以不用显式申明代码的访问级别。

//:> 注意: 为了简单起见，对于代码中可以设置访问级别的特性（属性、基本类型、函数等），在下面的章节中我们会称之为“实体”。
*/

//: [下一页](@next)
