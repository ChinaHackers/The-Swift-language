//: ## 集合（Sets)
//: 集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组。

//:> 注意：`Swift` 的 `Set` 类型被桥接到 `Fundation` 中的 `NSSet` 类。

//: ---
//: #### 集合类型的哈希值
/*:
 
 一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。
 
 一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a==b,因此必须a.hashValue == b.hashValue。
 */

//:  Swift 的所有基本类型(比如String,Int,Double和Bool)默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。没有关联值的枚举成员值(在枚举有讲述)默认也是可哈希化的。

/*:
 
 注意：

 你可以使用你自己自定义的类型作为合集的值类型或者字典的键类型，只要让它们遵循 Swift 基础库的 Hashable协议即可。遵循 Hashable协议的类型必须提供可获取的叫做 hashValue的 Int属性。通过 hashValue属性返回的值不需要在同一个程序的不同的执行当中都相同，或者不同程序。
 

 因为Hashable协议符合Equatable协议，所以符合该协议的类型也必须提供一个"是否相等"运算符(==)的实现。

 这个Equatable协议要求任何符合==实现的实例间都是一种相等的关系。
 
 也就是说，对于a,b,c三个值来说，==的实现必须满足下面三种情况：
 
//: - a == a  (自反性)
//: - a == b 意味着 b == a  (对称性)
//: - a == b && b == c 意味着 a == c  (传递性)
*/

//: ---
//: #### 集合类型语法
//: Swift 中的Set类型被写为Set<Element>，这里的Element表示Set中允许存储的类型，和数组不同的是，集合没有等价的简化形式。
//创建和初始化一个空的集合
//你可以通过构造器语法创建一个特定类型的空集合：

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印 "letters is of type Set<Character> with 0 items."
//:> 注意：通过构造器，这里的letters变量的类型被推断为Set<Character>。
//此外，如果上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或常量，我们可以通过一个空的数组字面量创建一个空的Set：
letters.insert("a")         // letters 现在含有1个 Character 类型的值
letters = []                // letters 现在是一个空的 Set, 但是它依然是 Set<Character> 类型
//: ---
//: #### 用数组字面量创建集合
//你可以使用数组字面量来构造集合，并且可以使用简化形式写一个或者多个值作为集合元素。

//下面的例子创建一个称之为favoriteGenres的集合来存储String类型的值：
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres 被构造成含有三个初始值的集合
/*:
 这个 `favoriteGenres` 变量被声明为“一个`String`值的集合”，写为`Set<String>`。
 由于这个特定的集合含有指定String类型的值，所以它只允许存储String类型值。
 这里的`favoriteGenres`变量有三个`String`类型的初始值("Rock"，"Classical"和"Hip hop")，并以数组字面量的方式出现。
 */

//:> 注意：favoriteGenres被声明为一个变量(拥有 `var` 标示符)而不是一个常量(拥有`let`标示符),因为它里面的元素将会在下面的例子中被增加或者移除。

//: 集合类型不能从数组字面量推断出来，所以 Set类型必须被显式地声明。总之，由于 Swift 的类型推断，你不需要在使用包含相同类型值的数组字面量初始化合集的时候写合集的类型。 favoriteGenres2 的初始化可以写的更短一些：
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]
//: 由于数组字面量中所有的值都是相同类型的，Swift 就可以推断 Set<String>是 favoriteGenres变量的正确类型。

//: ---
//: #### 访问和修改集合
//:你可以通过Set的属性和方法来访问和修改一个Set。

//: 为了找出一个 Set 中元素的数量，可以使用其只读属性 count：
print("I have \(favoriteGenres.count) favorite music genres.")  // 打印 "I have 3 favorite music genres."
//: 使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为0：
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
//: 你可以通过调用Set的insert(_:)方法来添加一个新元素：
favoriteGenres.insert("Jazz")           // favoriteGenres 现在包含4个元素

//: 你可以通过调用 `Set` 的 `remove(_:)` 方法去删除一个元素，如果该值是该 `Set` 的一个元素则删除该元素并且返回被删除的元素值，否则如果该 `Set` 不包含该值，则返回`nil`。另外，`Set` 中的所有元素可以通过它的 `removeAll()` 方法删除。
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")   // 打印 "Rock? I'm over it."
}
//: 使用contains(_:)方法去检查Set中是否包含一个特定的值：
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")        // 打印 "It's too funky in here."
}
//: ---
//: #### 遍历集合
//: 你可以在一个 `for-in` 循环中遍历一个Set中的所有值。

for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop

//: Swift 的 Set类型是无序的。要以特定的顺序遍历集合的值，使用 sorted()方法，它把合集的元素作为使用 < 运算符排序了的数组返回。
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// prints "Classical"
// prints "Hip hop"
// prints "Jazz

//: ---
//: #### 集合操作
//: 你可以高效地完成Set的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。

//: 基本集合操作
//: - 使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集；
//: - 使用 symmetricDifference(_:)方法来创建一个只包含两个合集各自有的非共有值的新合集；
//: - 使用 union(_:)方法来创建一个包含两个合集所有值的新合集；
//: - 使用 subtracting(_:)方法来创建一个两个合集当中不包含某个合集值的新合集。
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()                            // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()                     // []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()         // [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // [1, 2, 9]


//集合成员关系和相等性
// 下面的插图描述了三个集合-a,b和c,以及通过重叠区域表述集合间共享的元素。集合a是集合b的父集合，因为a包含了b中所有的元素，相反的，集合b是集合a的子集合，因为属于b的元素也被a包含。集合b和集合c彼此不关联，因为它们之间没有共同的元素。

//: - 使用“相等”运算符 ( == )来判断两个合集是否包含有相同的值；
//: - 使用 `isSubset(of:)` 方法来确定一个合集的所有值是被某合集包含；
//: - 使用 `isSuperset(of:)`方法来确定一个合集是否包含某个合集的所有值；
//: - 使用 `isStrictSubset(of:)` 或者 `isStrictSuperset(of:)` 方法来确定是个合集是否为某一个合集的子集或者超集，但并不相等；
//: - 使用 `isDisjoint(with:)` 方法来判断两个合集是否拥有相同的值。
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true
//: [字典（Dictionaries）](@next)
