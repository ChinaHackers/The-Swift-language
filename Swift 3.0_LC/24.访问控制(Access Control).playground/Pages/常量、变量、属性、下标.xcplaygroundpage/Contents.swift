//: ## 常量、变量、属性、下标
//: 常量、变量、属性不能拥有比它们的类型更高的访问级别。例如，你不能定义一个 `public` 级别的属性，但是它的类型却是 `private` 级别的。同样，下标也不能拥有比索引类型或返回类型更高的访问级别。

//: 如果常量、变量、属性、下标的类型是 `private` 级别的，那么它们必须明确指定访问级别为 `private：`
//private var privateInstance = SomePrivateClass()
//: ---
//: ## Getter 和 Setter
//: 常量、变量、属性、下标的 `Getters` 和 `Setters` 的访问级别和它们所属类型的访问级别相同。

//: `Setter` 的访问级别可以低于对应的 `Getter` 的访问级别，这样就可以控制变量、属性或下标的读写权限。在 `var` 或 `subscript` 关键字之前，你可以通过 `private(set)` 或 internal(set) 为它们的写入权限指定更低的访问级别。

//:>注意: 这个规则同时适用于存储型属性和计算型属性。即使你不明确指定存储型属性的 `Getter` 和 `Setter，``Swift` 也会隐式地为其创建 `Getter` 和 `Setter，`用于访问该属性的后备存储。使用 `private(set)` 和 `internal(set)` 可以改变 `Setter` 的访问级别，这对计算型属性也同样适用。
//下面的例子中定义了一个名为 TrackedString 的结构体，它记录了 value 属性被修改的次数：
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
//: `TrackedString` 结构体定义了一个用于存储 `String` 值的属性 `value，`并将初始值设为 `""`（一个空字符串）。该结构体还定义了另一个用于存储 `Int` 值的属性`numberOfEdits，`它用于记录属性 `value` 被修改的次数。这个功能通过属性 `value` 的 `didSet` 观察器实现，每当给 `value` 赋新值时就会调用 `didSet` 方法，然后将 `numberOfEdits` 的值加一。

//: 结构体 `TrackedString` 和它的属性 `value` 均没有显式指定访问级别，所以它们都拥有默认的访问级别 `internal。`但是该结构体的 `numberOfEdits` 属性使用了 `private(set) `修饰符，这意味着 `numberOfEdits` 属性只能在定义该结构体的源文件中赋值。`numberOfEdits` 属性的 `Getter` 依然是默认的访问级别 `internal，`但是 Setter 的访问级别是 `private，`这表示该属性只有在当前的源文件中是可读写的，而在当前源文件所属的模块中只是一个可读的属性。
//如果你实例化 TrackedString 结构体，并多次对 value 属性的值进行修改，你就会看到 numberOfEdits 的值会随着修改次数而变化：
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// 打印 "The number of edits is 3"
//: 虽然你可以在其他的源文件中实例化该结构体并且获取到 `numberOfEdits` 属性的值，但是你不能对其进行赋值。这一限制保护了该记录功能的实现细节，同时还提供了方便的访问方式。

//: - 请注意，您可以根据需要为一个`getter`和一个`setter`分配一个明确的访问级别。
//: - 下面的例子将 `TrackedString` 结构体明确指定为了 `public` 访问级别。结构体的成员（包括 `numberOfEdits` 属性）拥有默认的访问级别 `internal。`你可以结合 `public` 和 `private(set)` 修饰符把结构体中的 `numberOfEdits` 属性的 `Getter` 的访问级别设置为 `public，`而 Setter 的访问级别设置为` private：`
/*
public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}
*/

//: [上一页](@previous) | [下一页](@next)
