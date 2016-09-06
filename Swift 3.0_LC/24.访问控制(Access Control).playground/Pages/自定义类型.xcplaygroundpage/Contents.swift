//: ## 自定义类型
//: 如果想为一个自定义类型指定访问级别，在定义类型时进行指定即可。新类型只能在它的访问级别限制范围内使用。例如，你定义了一个 `private` 级别的类，那这个类就只能在定义它的源文件中使用，可以作为属性类型、函数参数类型或者返回类型，等等。

//: 一个类型的访问级别也会影响到类型成员（属性、方法、构造器、下标）的默认访问级别。如果你将类型指定为 `private` 级别，那么该类型的所有成员的默认访问级别也会变成 `private。`如果你将类型指定为 `public` 或者 `internal` 级别（或者不明确指定访问级别，而使用默认的 `internal` 访问级别），那么该类型的所有成员的默认访问级别将是 `internal。`

//:>注意: 上面提到，一个 `public` 类型的所有成员的访问级别默认为 `internal` 级别，而不是 `public` 级别。如果你想将某个成员指定为 `public` 级别，那么你必须显式指定。这样做的好处是，在你定义公共接口的时候，可以明确地选择哪些接口是需要公开的，哪些是内部使用的，避免不小心将内部使用的接口公开。
public class SomePublicClass {          // 显式的 public 类
    public var somePublicProperty = 0   // 显式的 public 类成员
    var someInternalProperty = 0        // 隐式的 internal 类成员
    private func somePrivateMethod() {} // 显式的 private 类成员
}

class SomeInternalClass {               // 隐式的 internal 类
    var someInternalProperty = 0        // 隐式的 internal 类成员
    private func somePrivateMethod() {} // 显式的 private 类成员
}

private class SomePrivateClass {        // 显式的 private 类
    var somePrivateProperty = 0         // 隐式的 private 类成员
    func somePrivateMethod() {}         // 隐式的 private 类成员
}
//: ### 元组类型
//: 元组的访问级别将由元组中访问级别最严格的类型来决定。例如，如果你构建了一个包含两种不同类型的元组，其中一个类型为 internal 级别，另一个类型为 private 级别，那么这个元组的访问级别为 private。

//:>注意: 元组不同于类、结构体、枚举、函数那样有单独的定义。元组的访问级别是在它被使用时自动推断出的，而无法明确指定。



//: ### 函数类型
//: 函数的访问级别根据访问级别最严格的参数类型或返回类型的访问级别来决定。但是，如果这种访问级别不符合函数定义所在环境的默认访问级别，那么就需要明确地指定该函数的访问级别。

//下面的例子定义了一个名为 someFunction 的全局函数，并且没有明确地指定其访问级别。也许你会认为该函数应该拥有默认的访问级别 internal，但事实并非如此。事实上，如果按下面这种写法，代码将无法通过编译：
/*
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // 此处是函数实现部分
}
*/
//: 这个函数的返回类型是一个元组，该元组中包含两个自定义的类（可查阅自定义类型）。其中一个类的访问级别是 internal，另一个的访问级别是 private，所以根据元组访问级别的原则，该元组的访问级别是 private（元组的访问级别与元组中访问级别最低的类型一致）。

//: 该函数返回类型的访问级别是 private，所以你必须使用 private 修饰符，明确指定该函数的访问级别：
/*
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // 此处是函数实现部分
}
*/
//: 将该函数指定为 `public` 或 `internal`，或者使用默认的访问级别 `internal` 都是错误的，因为如果把该函数当做 `public` 或 `internal` 级别来使用的话，可能会无法访问 `private` 级别的返回值。

//: ### 枚举类型
//: 枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。
//比如下面的例子，枚举 CompassPoint 被明确指定为 public 级别，那么它的成员 North、South、East、West 的访问级别同样也是 public：
public enum CompassPoint {
    case North
    case South
    case East
    case West
}
//: ### 原始值和关联值
//: 枚举定义中的任何原始值或关联值的类型的访问级别至少不能低于枚举类型的访问级别。例如，你不能在一个 internal 访问级别的枚举中定义 private 级别的原始值类型。

//: ### 嵌套类型
//: 如果在 `private` 级别的类型中定义嵌套类型，那么该嵌套类型就自动拥有 `private` 访问级别。如果在 `public` 或者 `internal` 级别的类型中定义嵌套类型，那么该嵌套类型自动拥有 `internal` 访问级别。如果想让嵌套类型拥有 `public` 访问级别，那么需要明确指定该嵌套类型的访问级别。

//: [上一页](@previous) | [下一页](@next)
