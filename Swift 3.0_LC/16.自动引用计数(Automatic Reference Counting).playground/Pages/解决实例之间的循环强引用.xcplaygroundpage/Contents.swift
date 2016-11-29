//: ## 解决实例之间的循环强引用
/*:
 
Swift 提供了两种办法用来解决你在使用类的属性时所遇到的循环强引用问题：`弱引用（ weak reference ）` 和 `无主引用（ unowned reference )`。

弱引用 和 无主引用 允许循环引用中的一个实例引用另外一个实例而不保持强引用。这样实例能够互相引用而不产生循环强引用。

对于生命周期中会变为 `nil` 的实例使用弱引用。相反，对于初始化赋值后再也不会被赋值为 `nil` 的实例，使用无主引用。

*/

//: > 注意: 引用必须声明为变量，表明其值能在运行时被修改。引用不能声明为常量。

//: ---
//: ### 弱引用
//: 弱引用不会对其引用的实例保持强引用，因而不会阻止 ARC 释放被引用的实例。这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上 weak 关键字表明这是一个弱引用。

//: 在实例的生命周期中，当引用可能“没有值”的时候，就使用弱引用来避免循环引用。如同在无主引用中描述的那样，如果引用始终有值，则可以使用无主引用来代替。上面的 Apartment 例子中，在它的声明周期中，有时是”没有居民”的，因此适合使用弱引用来解决循环强引用。

//:     注意:引用必须声明为变量，表明其值能在运行时被修改。引用不能声明为常量。

//: 由于弱引用不会强保持对实例的引用，所以说实例被释放了弱引用仍旧引用着这个实例也是有可能的。因此，ARC 会在被引用的实例被释放是自动地设置弱引用为 nil 。由于弱引用需要允许它们的值为 nil ，它们一定得是可选类型。你可以检查弱引用的值是否存在，就像其他可选项的值一样，并且你将永远不会遇到“野指针”。

//下面的例子跟上面 Person 和 Apartment 的例子一致，但是有一个重要的区别。这次， Apartment 的 tenant 属性被声明为弱引用：
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

// 两个变量（ john 和 unit4A ）之间的强引用和关联创建得与上次相同：
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
//unit4A!.tenant = john

//现在，两个关联在一起的实例的引用关系如下图所示：

//: Person 实例依然保持对 Apartment 实例的强引用，但是 Apartment 实例现在对 Person 实例是弱引用。这意味着当你断开 john 变量所保持的强引用时，再也没有指向 Person 实例的强引用了，由于再也没有指向 Person 实例的强引用，该实例会被释放：
john = nil
// prints "John Appleseed is being deinitialized"
//:由于再也没有强引用到 Person 它被释放掉了并且 tenant 属性被设置为 nil ：

//: 现在只剩下来自 unit4A 变量对 Apartment 实例的强引用。如果你打断这个强引用，那么 Apartment 实例就再也没有强引用了：
unit4A = nil
// prints "Apartment 4A is being deinitialized"
//由于再也没有指向 Apartment 实例的强引用，该实例也会被释放：

//:> 注意: 在使用垃圾回收机制的系统中，由于没有强引用的对象会在内存有压力时触发垃圾回收而被释放，弱指针有时用来实现简单的缓存机制。总之，对于 ARC 来说，一旦最后的强引用被移除，值就会被释放，这样的话弱引用就不再适合这类用法了。

//: [上一页](@previous) | [下一页](@next)
