//: ## 扩展
//: - 你可以在访问级别允许的情况下对类、结构体、枚举进行扩展。扩展成员具有和原始类型成员一致的访问级别。例如，你扩展了一个 public 或者 internal 类型，扩展中的成员具有默认的 internal 访问级别，和原始类型中的成员一致 。如果你扩展了一个 private 类型，扩展成员则拥有默认的 private 访问级别。
//: - 或者，你可以明确指定扩展的访问级别（例如，private extension），从而给该扩展中的所有成员指定一个新的默认访问级别。这个新的默认访问级别仍然可以被单独指定的访问级别所覆盖。


//: ### 通过扩展添加协议一致性
//: 如果你通过扩展来采纳协议，那么你就不能显式指定该扩展的访问级别了。协议拥有相应的访问级别，并会为该扩展中所有协议要求的实现提供默认的访问级别。



//: [上一页](@previous) | [下一页](@next)
