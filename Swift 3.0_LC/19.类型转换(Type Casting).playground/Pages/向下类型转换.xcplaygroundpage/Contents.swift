//: ## 向下类型转换
//: - 某个类类型的常量或变量可能实际上在后台引用自一个子类的实例。当你遇到这种情况时你可以尝试使用类型转换操作符`（ as? 或 as! ）`将它向下类型转换至其子类类型。
//: - 由于向下类型转换能失败，类型转换操作符就有了两个不同形式。条件形式， `as?` ，返回了一个你将要向下类型转换的值的可选项。强制形式， `as!` ，则将向下类型转换和强制展开结合为一个步骤。
//: - 如果你不确定你向下转换类型是否能够成功，请使用条件形式的类型转换操作符 `（ as? ）`。使用条件形式的类型转换操作符总是返回一个可选项，如果向下转换失败，可选值为 `nil` 。这允许你检查向下类型转换是否成功。
//: - 当你确信向下转换类型会成功时，使用强制形式的类型转换操作符`（ as! ）`。当你向下转换至一个错误的类型时，强制形式的类型转换操作符会触发一个运行错误。
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

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// "library" 的类型被推断为[MediaItem]
//: 下面的例子遍历了 `library` 中的每个 `MediaItem` ，并打印出相应的描述信息。要这样做的话，每个项目均需要被当做 `Movie` 或 `Song` 来访问，而不仅仅是 `MediaItem` 。为了在描述信息中访问 `Movie` 或 `Song` 的 `director` 和 `artist` 属性，这样做是必要的。

//: 在这个例子中，数组中每一个项目的类型可能是 `Movie` 也可能是 `Song` 。你不知道遍历时项目的确切类型是什么，所以这时使用条件形式的类型转换符`（ as? ）`来检查遍历中每次向下类型转换：
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by \(song.artist)")
    }
}

// Movie: 'Casablanca', dir. Michael Curtiz
// Song: 'Blue Suede Shoes', by Elvis Presley
// Movie: 'Citizen Kane', dir. Orson Welles
// Song: 'The One And Only', by Chesney Hawkes
// Song: 'Never Gonna Give You Up', by Rick Astley
/*:
例子开头尝试将当前 `item` 当做 `Movie` 向下类型转换。由于 `item` 是一个 `MediaItem` 的实例，它有可能是 `Movie` 类型；
也有可能是 `Song` 或者仅仅是 `MediaItem` 基类。介于这种不确定性，类型转换符 `as?` 在向下类型转换到子类时返回了一个可选项。 `item as? Movie`  的结果是 `Movie?` 类型，也就是“可选 `Movie` 类型”。

当数组中的 `Song` 实例使用向下转换至 `Movie` 类型时会失败。为了处理这种情况，上面的栗子使用了可选绑定来检查可选 Movie 类型是否包含了一个值（或者说检查向下类型转换是否成功）。这个可选绑定写作`“ if let movie = item as? Movie ”`，它可以被读作：

尝试以 `Movie` 类型访问 item 。如果成功，设置一个新的临时常量 `movie` 储存返回的可选 `Movie` 类型 。
    
如果向下类型转换成功， `movie` 的属性将用于输出 `Movie` 实例的描述信息，包括 `director` 的名字。同理，无论是否在数组中找到 `Song` ，均可以检查 `Song` 实例然后输出合适的描述（包括 `artist` 的名字）。
*/

//: >注意: 类型转换实际上不会改变实例及修改其值。实例不会改变；它只是将它当做要转换的类型来访问。

//: [上一页](@previous) | [下一页](@next)
