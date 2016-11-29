//: ## 类型属性
//: - 类型属性是作为类型定义的一部分写在类型最外层的花括号（{}）内。
//: - 使用关键字 `static` 来定义值类型的类型属性，关键字 `class` 来为类定义类型属性。
//: - 存储型类型属性 可以是(变量) 或 (常量) ，(计算型类型属性)跟(实例的计算型属性)一样只能定义成变量属性。

//:> 注意
//: - 跟实例的存储型属性不同，必须给 (存储型类型属性) 指定默认值，因为类型本身没有 (构造器)，也就无法在初始化过程中使用构造器给类型属性赋值。
//: - 存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
//: ### 获取和设置类型属性的值
//:  跟实例属性一样，类型属性也是通过 `点运算符` 来访问。类型属性是通过类型本身来访问，而不是通过实例.
print(SomeStructure.storedTypeProperty)
// 输出 "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// 输出 "Another value.”
print(SomeEnumeration.computedTypeProperty)
// 输出 "6"
print(SomeClass.computedTypeProperty)
// 输出 "27"
//:> 注意：例子中的计算型类型属性是只读的，但也可以定义可读可写的计算型类型属性，跟实例计算属性的语法类似。

//: [上一页](@previous)
