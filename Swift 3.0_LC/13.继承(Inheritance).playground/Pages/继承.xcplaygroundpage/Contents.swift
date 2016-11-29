//: ## 继承（Inheritance）
//: 本页包含内容：
//: - 定义一个基类`（Defining a Base Class）`
//: - 子类生成`（Subclassing）`
//: - 重写`（Overriding）`
//: - 防止重写`（Preventing Overrides）`

//: ---
//: 一个类可以继承`（inherit）`另一个类的方法`（methods）`，属性`（properties）`和其它特性。当一个类继承其它类时，继承类叫子类`（subclass）`，被继承类叫超类（或父类，`superclass`）。在 `Swift` 中，继承是区分「类」与其它类型的一个基本特征。

//: 在 `Swift` 中，类可以调用和访问超类的方法，属性和下标`（subscripts）`，并且可以重写`（override）`这些方法，属性和下标来优化或修改它们的行为。Swift 会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。

//: 可以为类中继承来的属性添加属性观察器`（property observers）`，这样一来，当属性值改变时，类就会被通知到。可以为任何属性添加属性观察器，无论它原本被定义为存储型属性`（stored property）`还是计算型属性`（computed property）`。

//: [下一页](@next)
