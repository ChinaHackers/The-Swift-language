//: ## 弱引用和无主引用
//: 在闭包和捕获的实例总是互相引用并且总是同时释放时，将闭包内的捕获定义为无主引用。

//: 相反，在被捕获的引用可能会变为 nil 时，定义一个弱引用的捕获。弱引用总是可选项，当实例的引用释放时会自动变为 nil 。这使我们可以在闭包体内检查它们是否存在。

//:> 注意: 如果被捕获的引用永远不会变为 nil ，应该用无主引用而不是弱引用。
//前面的 HTMLElement 例子中，无主引用是正确的解决循环强引用的方法。这样编写 HTMLElement 类来避免循环强引用：
class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: (Void) -> String = {
        [unowned self] in
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
//: [上一页](@previous)
