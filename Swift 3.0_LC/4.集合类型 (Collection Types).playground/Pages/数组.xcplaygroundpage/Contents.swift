//: #### 数组(Arrays)
//:数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。

/*:
- 数组的简单语法
- 写 Swift 数组应该遵循像 `Array<元素>` 这样的形式，其中 `元素` 是这个数组中唯一允许存在的数据类型。
- 我们也可以使用像 `[元素]` 这样的简单语法。尽管两种形式在功能上是一样的，但是推荐较短的那种，而且在本文中都会使用这种形式来使用数组。
 
 */
//创建一个空数组
//声明空数组
var emptyArray2 = [String]()
let emptyArray3: Array<String> = []

//Demo2:
var shoppingList = ["芒果", "橘子", "水", "葡萄", "香蕉"]
//:增加
shoppingList.append("苹果")  //append：在原有数组的末尾增加一个元素，方法1
shoppingList.insert("苹果", at: 2) // 在数组的下标为2的位置插入“苹果”， 方法2

shoppingList += ["柚子"]   //shoppingList += "柚子" //方法3
shoppingList += ["西瓜", "木瓜"]  //方法4
//:常用方法
print(shoppingList.count)     //数组的个数
print(shoppingList.capacity)  //数组的容量, 值为大于count的 最小的2的n次方的数, 比如2、4、8、16
print(shoppingList.isEmpty)   //判断数组是否为空
//:修改
shoppingList[1] = "哈密瓜"     //修改第一个元素的值
print(shoppingList)

//把下标为4、5、6、7的元素替换成后面的"Bananas", "Apples"， 值变了，count减少了
shoppingList[4...7] = ["Bananas", "Apples"]
print(shoppingList)

//:删除
shoppingList.removeLast()   //删除最后一个元素
shoppingList.remove(at: 4)   ///删除下标为4的元素，注意:需要index < count

//shoppingList.removeAll()     //删除全部元素
//:数组遍历
//Demo1
for item in shoppingList {
    print(item)
}

//Demo2
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
//: ---
//: #### 创建一个空数组
//: 我们可以使用构造语法来创建一个由特定数据类型构成的空数组：
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印 "someInts is of type [Int] with 0 items."
//: 注意 someInts变量的类型通过初始化器的类型推断为 [Int]。

//: 相反，如果内容已经提供了类型信息，比如说作为函数的实际参数或者已经分类了的变量或常量，你可以通过空数组字面量来创建一个空数组，它写作[ ]（一对空方括号）：
someInts.append(3)
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。

//: ---
//: #### 使用默认值创建数组
//: Swift 的 Array类型提供了初始化器来创建确定大小且元素都设定为相同默认值的数组。你可以传给初始化器对应类型的默认值（叫做 `repeating`）和新数组元素的数量（叫做 `count`）：
// threeDoubles 类型是[Double]，等价于 [0.0, 0.0, 0.0]
var threeDoubles = Array(repeating: 0.0, count: 3)

//: #### 通过连接两个数组来创建数组
//: 你可以通过把两个兼容类型的现存数组用加运算符（ +）加在一起来创建一个新数组。新数组的类型将从你相加的数组里推断出来：
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
var sixDoubles = threeDoubles + anotherThreeDoubles
//: ---
//: #### 使用数组字面量创建数组
//: 你同样可以使用数组字面量来初始化一个数组，它是一种以数组集合来写一个或者多个值的简写方式。数组字面量写做一系列的值，用逗号分隔，用方括号括起来：
//[value 1, value 2, value 3]

//下边的例子创建了一个叫做 `shoppingLi` 的数组来储存 `String`值：
var shoppingLi: [String] = ["Eggs", "Milk"]
//: `shoppingLi` 变量被声明为“字符串值的数组”写做 `[String]` 。由于这个特定的数组拥有特定的 `String` 值类型，它就只能储存 `String`值。这里， `shoppingLi` 被两个 `String` 值（ "Eggs"和 "Milk"）初始化，写在字符串字面量里。

//:> 注意: 数组 `shoppingLi` 被声明为变量（用 var提示符）而不是常量（用 let提示符）因为更多的元素会在下边的栗子中添加到数组当中。
//: 在这种情况下，数组的字面量只包含两个 `String`值。这与 `shoppingLi`变量声明类型一致（一个只能储存 String值的数组），因此用数组字面量作为 `shoppingLi` 以两个初始元素初始化的方式是被允许的。

//: 根据 `Swift` 的类型推断，如果你用包含相同类型值的数组字面量初始化数组，就不需要写明数组的类型。 `shoppingLi` 的初始化可以写得更短：
var shoppingLi2 = ["Eggs", "Milk"]
//因为数组字面量中的值都是相同的类型，Swift 就能够推断 [String]是 shoppingLi2变量最合适的类型。
//: ---
//: #### 访问和修改数组
//: 你可以通过数组的方法和属性来修改数组，或者使用下标脚本语法。

//: - 要得出数组中元素的数量，检查只读的 `count` 属性：
print("shopping li2 包含 \(shoppingLi2.count) 个项.")
// 输出 "shopping li2 包含2个项"
//: 使用布尔值属性 `isEmpty` 作为检查 `count` 属性的值是否为 0 的捷径：
if shoppingLi2.isEmpty {
    print("The shopping li2 is empty.")
} else {
    print("The shopping li2 is not empty.")
}
// 打印 "The shopping li2 is not empty."

//: 也可以使用 `append(_:)` 方法在数组后面添加新的数据项：
shoppingLi2.append("Flour")
// shoppingLi2 现在有3个数据项，有人在摊煎饼


//: 除此之外，使用加法赋值运算符（+=）也可以直接在数组后面添加一个或多个拥有相同类型的数据项：
shoppingLi2 += ["Baking Powder"]            // shoppingLi2 现在有四项了
shoppingLi2 += ["Chocolate Spread", "Cheese", "Butter"]     // shoppingLi2 现在有七项了
//: 可以直接使用 (下标语法) 来获取数组中的数据项，把我们需要的 数据项 的 索引值 放在直接放在数组名称的方括号中：
var firstItem = shoppingList[0]     // 第一项是 "Eggs"
//:> 注意：第一项在数组中的索引值是0而不是1。 Swift 中的数组索引总是从零开始。
// 可以用下标来改变某个已有索引值对应的数据值：
shoppingLi2[0] = "Six eggs"                 // 其中的第一项现在是 "Six eggs" 而不是 "Eggs"
//: 同样可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。下面的例子把"Chocolate Spread"，"Cheese"，和"Butter"替换为"Bananas"和 "Apples"：
shoppingLi2[4...6] = ["Bananas", "Apples"]          // shoppingLi2 现在有6项
//:> 注意：不可以用下标访问的形式去在数组尾部添加新项。
//要把元素插入到特定的索引位置，调用数组的 `insert(_:at:)` 方法：

// "Maple Syrup" 现在是这个列表中的第一项, shoppingLi2 现在有7项
shoppingLi2.insert("Maple Syrup", at: 0)
//: - 调用 insert(_:at:)方法插入了一个新元素值为 "Maple Syrup"到 shopping li2 的最前面，通过明确索引位置为 0 .
//: - 类似地，你可以使用 `remove(at:)`方法来移除一个元素。这个方法移除特定索引的元素并且返回它（尽管你不需要的话可以无视返回的值）：
let mapleSyrup = shoppingLi2.remove(at: 0)

// 索引值为0的数据项被移除
// shoppingList 现在只有6项，而且不包括 Maple Syrup
// mapleSyrup 常量的值等于被移除数据项的值 "Maple Syrup"

//:> 注意: 如果你访问或者修改一个超出数组边界索引的值，你将会触发运行时错误。你可以在使用索引前通过对比数组的 count属性来检查它。除非当 count为 （就是说数组为空），否则最大的合法索引永远都是 count - 1，因为数组的索引从零开始。

//当数组中元素被移除，任何留下的空白都会被封闭，所以索引 0 的值再一次等于 "Six eggs"：
firstItem = shoppingLi2[0]             // firstItem 现在等于 "Six eggs"

//: 如果你想要移除数组最后一个元素，使用 `removeLast()`方法而不是 `removeAtIndex(_:)` 方法以避免查询数组的 `count` 属性。与 `removeAtIndex(_:)` 方法相同， `removeLast()` 返回删除了的元素：
let apples = shoppingLi2.removeLast()

//数组的遍历
//我们可以使用for-in循环来遍历所有数组中的数据项：

for item in shoppingLi2 {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
//: 如果你需要每个元素以及值的整数索引，使用 `enumerated()` 方法来遍历数组。 `enumerated()` 方法返回数组中每一个元素的元组，包含了这个元素的索引和值。你可以分解元组为临时的常量或者变量作为遍历的一部分：
for (index, value) in shoppingLi2.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
//: [上一页](@previous) | [下一页](@next)
