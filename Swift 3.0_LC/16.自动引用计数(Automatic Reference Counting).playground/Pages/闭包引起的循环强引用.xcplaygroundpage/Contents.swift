//: ## 闭包的循环强引用
//上面我们看到了循环强引用是如何在两个实例属性互相保持对方的强引用时产生的，还知道了如何用弱引用和无主引用来打破这些循环强引用。
//: - 循环强引用还会出现在你把一个闭包分配给类实例属性的时候，并且这个闭包中又捕获了这个实例。捕获可能发生于这个闭包函数体中访问了实例的某个属性，比如 self.someProperty ，或者这个闭包调用了一个实例的方法，例如 self.someMethod() 。这两种情况都导致了闭包 “捕获”了  self ，从而产生了循环强引用。
//: - 循环强引用的产生，是因为闭包和类相似，都是引用类型。当你把闭包赋值给了一个属性，你实际上是把一个引用赋值给了这个闭包。实质上，这跟之前上面的问题是一样的——两个强引用让彼此一直有效。总之，和两个类实例不同，这次一个是类实例和一个闭包互相引用。
//: - Swift 提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表（ closuer capture list ）。不过，在学习如何用闭包捕获列表打破循环强引用之前，我们还是先来了解一下这个循环强引用是如何产生的，这对我们很有帮助。

//下面的例子为你展示了当一个闭包引用了 self 后是如何产生一个循环强引用的。例子中定义了一个叫 HTMLElement 的类，用一种简单的模型表示 HTML 中的一个单独的元素：
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

//: - `HTMLElement` 类定义了一个 name 属性来表示这个元素的名称，例如表示标题元素的 `"h1" `、代表段落元素的` "p" `、或者代表换行元素的 `"br"` 。 `HTMLElement `还定义了一个可选的属性 `text` ，它可以用来设置和展现 `HTML`  元素的文本。
//: - 除了上面的两个属性， `HTMLElement` 还定义了一个 `lazy` 属性 `asHTML` 。这个属性引用了一个将 `name` 和 `text` 组合成 `HTML`  字符串片段的闭包。该属性是 Void -> `String` 类型，或者可以理解为“一个没有参数，但返回 `String` 的函数”。
//: - 默认情况下，闭包赋值给了 `asHTML` 属性，这个闭包返回一个代表 `HTML` 标签的字符串。如果 `text` 值存在，该标签就包含可选值 `text` ；如果 `text` 不存在，该标签就不包含文本。对于段落元素，根据 `text` 是 `"some text" `还是 `nil` ，闭包会返回 `"<p>some text</p>" 或者 "<p />" 。`
//可以像实例方法那样去命名、使用 asHTML 属性。总之，由于 asHTML 是闭包而不是实例方法，如果你想改变特定元素的 HTML 处理的话，可以用自定义的闭包来取代默认值。
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// prints "<h1>some default text</h1>"
//:> 注意: `asHTML` 声明为 `lazy` 属性，因为只有当元素确实需要处理为 `HTML` 输出的字符串时，才需要使用 `asHTML` 。实际上 `asHTML` 是延迟加载属性意味着你在默认的闭包中可以使用 `self`，因为只有当初始化完成以 `self` 确实存在后，才能访问延迟加载属性。


//: [上一页](@previous) | [下一页](@next)
