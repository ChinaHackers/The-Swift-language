//: ## AnyObject

//: 使用 `Cocoa API` 时，你有时会接收到 `[AnyObject]` 类型的数组，或者说“由任意类型对象构成的数组”。目前 `Objective-C` 支持显式类型的数组，但是旧版本的语言没有这个功能。总之，你通常可以从提供数组的 `API` 的信息中确定这个数组包含对象的类型。

//: 在这种情况中，你可以使用强制类型转换符`（ as! ）`将数组中的项目向下转换至比 `AnyObject` 更明确的类型，而无需将可选类型展开。
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
//: 下面的例子定义了一个 `[AnyObject]` 类型的数组，并实例化了三个 `Movie` 类：
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]
//: 由于我们已知这个数组只包含了 `Movie` 实例，你可以直接使用强制类型的类型转换符`（ as! ）`将其向下转换至非可选的 `Movie` 类型：
for object in someObjects {
    let movie = object as! Movie
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}
// Movie: '2001: A Space Odyssey', dir. Stanley Kubrick
// Movie: 'Moon', dir. Duncan Jones
// Movie: 'Alien', dir. Ridley Scott


//: 在这个循环中，直接将 `someObject` 向下转换为 `[Movie]` 类型而非挨个向下转换，可以使代码更短：
for movie in someObjects as! [Movie] {
    print("Movie: '\(movie.name)', dir. \(movie.director)")
}
// Movie: '2001: A Space Odyssey', dir. Stanley Kubrick
// Movie: 'Moon', dir. Duncan Jones
// Movie: 'Alien', dir. Ridley Scott



//: [上一页](@previous) | [下一页](@next)

