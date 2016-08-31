
//: ---- 集合类型 (Collection Types) -----

/*:
 
 内容：
 - *集合的可变性（Mutability of Collections）
 - *数组（Arrays）
 - *集合（Sets）
 - *字典（Dictionaries）
 
 */

/*:
 
 - Swift 语言提供 (Arrays)、(Sets) 和 (Dictionaries) 三种基本的集合类型用来存储集合数据。
 
 - 数组（Arrays）是有序数据的集。
 - 集合（Sets）是无序无重复数据的集。
 - 字典（Dictionaries）是无序的键值对的集。
 
*/


/*:
 
 - Swift 语言中的Arrays、Sets和Dictionaries中存储的数据值类型必须明确。
 - 这意味着我们不能把不正确的数据类型插入其中。 同时这也说明我们完全可以对取回值的类型非常自信。
 - 注意：
 - Swift 的Arrays、Sets和Dictionaries类型被实现为泛型集合。更多关于泛型类型和集合，参见 泛型章节。
 
 */


//: ****** 集合的可变性 ******

/*
 如果创建一个Arrays、Sets或Dictionaries并且把它分配成一个变量，这个集合将会是可变的。
 这意味着我们可以在创建之后添加更多或移除已存在的数据项来改变这个集合的大小。
 如果我们把Arrays、Sets或Dictionaries分配成常量，那么它就是不可变的，它的大小不能被改变。
 
 注意：
 在我们不需要改变集合大小的时候创建不可变集合是很好的习惯。如此 Swift 编译器可以优化我们创建的集合。
 
 */
