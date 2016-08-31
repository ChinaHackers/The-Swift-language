//: ## 函数参数与返回值
//: ---
//: 函数的参数
//: #### 无参函数:
//: - 函数可以没有参数. 下面这个函数就是一个无参函数,当被调用时,它返回固定的`String` 消息:
//: - 尽管这个函数没有参数,但是定义中在函数名后还是需要一对`()`圆括号。当被调用时,也需要在函数名后写一对`()`圆括号。
//实例
func sitename() -> String {
    return "The Swift Programming Languge !"
}
print(sitename())

//以上程序执行输出结果为：
//The Swift Programming Languge !
//: ---
//: #### 多参函数:
//: 函数可以接受一个或者多个参数，我们也可以使用元组（tuple）向函数传递一个或多个参数, 参数写在圆括号中，用逗号分隔.
func mult(no1: Int, no2: Int) -> Int {
    
    return no1 * no2
}
//: - 通过在类名后面的括号中添加参数列表来调用一个函数。
//: - 当你调用一个函数，参数列表 的 参数 需要加上 (参数名) .
print(mult(no1: 2, no2: 20))
print(mult(no1: 3, no2: 15))
print(mult(no1: 4, no2: 30))
print(mult(no1: 4, no2: 80))

//以上程序执行输出结果为：
//40
//45
//120
//320
//: ---
//: #### 无返回值函数
//: 函数可以没有返回值. 因为这个函数不需要返回值,所以这个函数的定义中没有 返回箭头(->) 和 返回类型。

//下面是 runoob(_:) 函数的另一个版本，这个函数接收 `Apple` 官网网址参数，没有指定返回值类型，并直接输出 `String` 值，而不是返回它：
func runoob(site: String) {
    print("苹果官网：\(site)")
}
runoob(site: "http://www.apple.com")

//:> 注意: 没有定义返回类型的函数会返回特殊的值，叫 `Void`。它其实是一个空的元组（tuple），没有任何元素，可以写成()
//: ---

//: #### 多返回值函数
//: - 函数返回值类型可以是`字符串`，`整型`，`浮点型`等。
//: - 元组作为函数返回值
//: - 元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号。
//: - 你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回。

//下面的这个例子中，定义了一个名为 minMax(_:)的函数，作用是在一个 Int数组中找出 最小值 与 最大值。

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")     //最小值为 -6 ，最大值为 109

//需要注意的是，元组的成员不需要在元组从函数中返回时命名，因为它们的名字已经在函数返回类型中指定了
/*:
minMax(_:)函数 返回一个包含两个`Int`值的元组，这些值被标记为`min`和`max`，以便查询函数的返回值时可以通过名字访问它们。
minMax(_:)函数体中,在开始的时候设置两个工作变量 `currentMin` 和 `currentMax` 作为数组中的第一个`Int`值.

然后函数会遍历数组中剩余的值,并检查该值是否比 `currentMin` 和 `currentMax` 更小或更大.
最后数组中的(最小值)与(最大值)返回两个`Int` 值最为一个元组.

因为元组的成员值被命名为函数的返回类型的一部分,可以通过 (点语法) 来访问与取回发现的最小值与最小值:
*/

//: ---
//: #### 可选元组返回类型
//: 如果你不确定返回的元组一定为`nil`，那么你可以返回一个可选的元组类型。
//: 你可以通过在元组类型的右括号后放置一个 `?` 来定义一个可选元组，例如(Int, Int)?或(String, Int, Bool)?

//:> 注意: - 可选元组类型如(Int, Int)?与元组包含可选类型如(Int?, Int?)是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。
//:>> 前面的minMax(_:)函数返回了一个包含两个Int值的元组。但是函数不会对传入的数组执行任何安全检查，如果array参数是一个空数组，如上定义的minMax(_:)在试图访问array[0]时会触发一个运行时错误。

//为了安全地处理这个"空数组"问题，将minMax(_:)函数改写为使用可选元组返回类型，并且当数组为空时返回nil：
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        
        if value < currentMin {
    
            currentMin = value
        
        } else if value > currentMax {
            
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// 你可以选择性的绑定当 minMax(_:) 函数返回的是一个实际的元组值还是 nil
if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
    print("最小值为 \(bounds.min)，组大值为 \(bounds.max)")
}

//以上程序执行输出结果为：
//最小值为 -6，组大值为 109


//: [后退](@previous)| [函数参数名称](@next)

