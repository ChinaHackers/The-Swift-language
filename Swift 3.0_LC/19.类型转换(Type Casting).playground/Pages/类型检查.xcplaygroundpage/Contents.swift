//: ## 类型检查
//: - 使用类型检查操作符 `（ is ）`来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回 `true` ，否则返回 `false` 。

//:  第一个代码片段定义了一个叫做 `MediaItem` 的新基类。这个类为出现在数字媒体库中的所有成员提供了基本的功能。它声明了一个 `String` 类型的 `name` 和一个叫做 `init` 的 `name` 初始化器。（这里假设所有的媒体项目，包括所有电影和音乐，都有一个名字。）
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
//: 定义了两个 `MediaItem` 的子类。第一个子类-`Movie` ，封装了额外的电影的信息。在 `MediaItem` 的基础上添加了名为 `director` 的属性及其初始化器。第二个子类-`Song` ，增加了名为 `artist` 的属性及其初始化器。
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
//: 创建了名为 `library` 的常量数组，它包含了两个 `Movie` 实例和三个 `Song` 实例。 `library` 数组的类型是在初始化时根据常量字面量推断出来的。 `Swift` 的类型检查器能够推断 `Movie` 和 `Song` 有一个共同的父类 `MediaItem` ，因此 `library` 的类型推断为 `[MediaItem]`
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// "library" 的类型被推断为[MediaItem]

//: 下面的栗子定义了两个变量， `movieCount` 和 `songCount` ，用来计算数组 `library` 中 `Movie` 和 `Song` 实例的个数：
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
// Prints "Media library contains 2 movies and 3 songs"
//: 这个例子遍历了 `library` 数组中的每个元素。每一轮中， `for-in` 的循环都将 `item` 常量设置为数组中的下一个 `MediaItem` 。

//: 如果当前 `MediaItem` 是 `Movie` 类型的实例， `item is Movie` 返回 `true` ，反之返回 `false` 。同样的， `item is Song` 检查了该对象是否为 `Song` 类型的实例。在 `for-in` 循环的最后， `movieCount` 和 `songCount` 的值就是数组中对应类型实例的数量。

//: [上一页](@previous) | [下一页](@next)

