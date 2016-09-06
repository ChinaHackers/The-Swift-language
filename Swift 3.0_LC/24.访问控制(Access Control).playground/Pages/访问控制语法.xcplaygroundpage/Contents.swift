//: ## 访问控制语法
//: 通过修饰符 public、internal、private 来声明实体的访问级别：
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}
//: 除非专门指定，否则实体默认的访问级别为 `internal，`可以查阅默认访问级别这一节。这意味着在不使用修饰符显式声明访问级别的情况下，`SomeInternalClass` 和 `someInternalConstant` 仍然拥有隐式的访问级别 `internal：`
//class SomeInternalClass {}   // 隐式访问级别 internal
//var someInternalConstant = 0 // 隐式访问级别 internal
//: [上一页](@previous) | [下一页](@next)
