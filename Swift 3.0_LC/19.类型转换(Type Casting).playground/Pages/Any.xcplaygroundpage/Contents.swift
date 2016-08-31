//: ## Any

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
//: 这里有一个使用 Any 类型来对不同类型进行操作的例子，包含了函数类型以及非类类型。这个例子定义了一个名为 `things` 的数组，它用于储存 `Any` 类型的值：
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })
//: 这个 `things` 数组包含了两个 `Int` 值、两个 `Double` 值、一个 `String` 值、一个 `(Double, Double)` 的元组、 `Movie` 实例`Ghostbusters`、以及一个接收 `String` 值并返回 `String` 值的闭包表达式。

//: 你可以在 `switch` 结构的 `case` 中使用 `is` 和 `as` 操作符找出已知 `Any` 或 `AnyObject` 类型的常量或变量的具体类型。下面的例子使用 `switch` 语句遍历了 `things` 数组并查询每一项的类型。其中几个 `switch` 的 `case` 将确定的值和确定类型的常量绑定在一起，使其值可以被输出：
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
// zero as an Int
// zero as a Double
// an integer value of 42
// a positive double value of 3.14159
// a string value of "hello"
// an (x, y) point at 3.0, 5.0
// a movie called Ghostbusters, dir. Ivan Reitman
// Hello, Michael

//: [上一页](@previous)
