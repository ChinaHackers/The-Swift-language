//: ## 类实例之间的循环强引用
//在上面的例子中，ARC 能够追踪你所创建的 Person 实例的引用数量，并且会在 Person 实例不在使用时销毁。
//: 总之，写出某个类永远不会变成零强引用的代码是可能的。如果两个类实例彼此持有对方的强引用，因而每个实例都让对方一直存在，就会发生这种情况。这就是所谓的循环强引用。

//: 解决循环强引用问题，可以通过定义类之间的关系为弱引用( weak )或无主引用( unowned )来代替强引用。这个过程在解决类实例之间的循环强引用中有描述。总之，在你学习如何解决循环强引用问题前，了解一下它是如何产生的也是很有意义的事情。
//下面的例子展示了一个如何意外地创建循环强引用的例子。这个例子定义了两个类，分别是 Person 和 Apartment ，用来建模公寓和它其中的居民：
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//: 每一个 `Person` 实例有一个类型为 `String` ，名字为 `name` 的属性，并有一个可选的初始化为 `nil` 的 `apartment` 属性。 `apartment` 属性是可选项，因为一个人并不总是拥有公寓。

//: 类似的，每个 `Apartment` 实例都有一个叫 `unit` ，类型为 `String` 的属性，并有一个可选的初始化为 `nil` 的 `tenant` 属性。 `tenant` 属性是可选的，因为一栋公寓并不总是有居民。
//这两个类都定义了反初始化器，用以在类实例被反初始化时输出信息。这让你能够知晓 Person 和 Apartment 的实例是否像预期的那样被释放。
//: 定义了两个可选项变量 `john` 和 `unit4A` ，它们分别被赋值为下面的 `Apartment` 和 `Person` 的实例。这两个变量都被初始化为 `nil` ，这正是可选项的优点：
var john: Person?
var unit4A: Apartment?
//现在你可以创建特定的 Person 和 Apartment 实例并将其赋值给 john 和 unit4A 变量：
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")


// 练习
class Teacher {
    var tName : String
    var student : Student?       //添加学生对象,初始时为nil
    
    init(name:String) {
        tName = name
        print("老师 \(tName) 实例初始化完成.")
    }
    
    func getName() -> String {
        return tName
    }
    
    func classing() {
        print("老师 \(tName) 正在给学生 \(student?.getName()) 讲课.")
    }
    
    deinit {
        print("老师 \(tName) 实例析构完成.")
    }
}

class Student {
    var tName : String
    var teacher : Teacher?       //添加老师对象,初始时为nil
    
    init(name:String) {
        tName = name
        print("学生 \(tName) 实例初始化完成.")
    }
    
    func getName() -> String {
        return tName
    }
    
    func listening() {
        print("学生 \(tName) 正在听 \(teacher?.getName()) 老师讲的课")
    }
    
    deinit {
        print("学生 \(tName) 实例析构化完成.")
    }
}

var teacher :Teacher?
var student :Student?

teacher = Teacher(name:"范佩西")   //(引用计数为1)
student = Student(name:"梅西")   //引用计数为1)

teacher!.student = student  //赋值后将产生"学生"对象的强引用 (引用计数+1)
student!.teacher = teacher  //赋值后将产生"老师"对象的强引用 (引用计数+1)

teacher!.classing()         //因为我清楚地知道teacher对象不可能为空,所以我用!解包
student!.listening()

//下面的代码，写与不写都不能使对象释放
teacher = nil           //引用计数－1 但还不能＝0,所以不会析构
student = nil   //引用计数－1 但还不能＝0,所以也不会析构

print("释放后输出")

teacher?.classing()//因为我不能确定teacher对象是否为空，所以必须用?来访问。
student?.listening()


//: [上一页](@previous) | [下一页](@next)

