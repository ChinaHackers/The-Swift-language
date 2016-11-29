//: ## 子类
//: - 子类的访问级别不得高于父类的访问级别。例如，父类的访问级别是 `internal，`子类的访问级别就不能是 `public。`
//: - 可以通过重写为继承来的类成员提供更高的访问级别。可以重写任意类成员（方法、属性、构造器、下标等）。

//: 下面的例子中，类 A 的访问级别是 `public，`它包含一个方法 `someMethod()，`访问级别为 `private。`类 B 继承自类 A，访问级别为 `internal，`但是在类 B 中重写了类 A 中访问级别为` private `的方法` someMethod()，`并重新指定为 `internal` 级别。通过这种方式，我们就可以将某类中 `private` 级别的类成员重新指定为更高的访问级别，以便其他人使用：
/*
public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}
 */
//: 我们甚至可以在子类中，用子类成员去访问访问级别更低的父类成员，只要这一操作在相应访问级别的限制范围内（也就是说，在同一源文件中访问父类 private 级别的成员，在同一模块内访问父类 internal 级别的成员）：
/*
public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

*/
//: 因为父类 `A` 和子类 `B` 定义在同一个源文件中，所以在子类 `B` 可以在重写的 `someMethod()` 方法中调用 `super.someMethod()。`

//: [上一页](@previous) | [下一页](@next)
