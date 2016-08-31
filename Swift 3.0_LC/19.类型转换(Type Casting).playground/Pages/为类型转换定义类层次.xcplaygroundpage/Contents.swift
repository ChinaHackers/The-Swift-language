//: ## 为类型转换定义类层次

//: 你可以在类及其子类层次中使用类型转换来判断特定类实例的类型并且在同一类层次中将该实例类型转换为另一个类。下面的三段代码定义了一个类层次以及一个包含了这些类实例的数组，作为类型转换的栗子。

//: 第一个代码片段定义了一个叫做 `MediaItem` 的新基类。这个类为出现在数字媒体库中的所有成员提供了基本的功能。它声明了一个 `String` 类型的 `name` 和一个叫做 `init` 的 `name` 初始化器。（这里假设所有的媒体项目，包括所有电影和音乐，都有一个名字。）
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
//: 下一个片段定义了两个 `MediaItem` 的子类。第一个子类-`Movie` ，封装了额外的电影的信息。在 `MediaItem` 的基础上添加了名为 `director`的属性及其初始化器。第二个子类 - `Song` ，增加了名为 `artist` 的属性及其初始化器。
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
//: 最后一个代码段创建了名为 `library` 的常量数组，它包含了两个 `Movie` 实例和三个 `Song` 实例。 `library` 数组的类型是在初始化时根据常量字面量推断出来的。 `Swift` 的类型检查器能够推断 `Movie` 和 `Song` 有一个共同的父类 `MediaItem` ，因此 `library` 的类型推断为` [MediaItem] ：`
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// "library" 的类型被推断为[MediaItem]

//: 事实上 library 储存的项目在后台依旧是 Movie 和 Song 实例。总之，如果你遍历这个数组的内容，你取出的项目将会是 MediaItem 类型而非 Movie 或 Song 类型。为了使用他们原生的类型，你需要检查他们的类型或将他们向下转换为不同的类型，如下所述。

//: [上一页](@previous) | [下一页](@next)

