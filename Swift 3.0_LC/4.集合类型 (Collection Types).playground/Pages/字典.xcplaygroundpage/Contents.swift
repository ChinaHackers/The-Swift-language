//: ## 字典（key : value）
//: #### 字典的使用
//: #### 字典：
//: #### key ----> value
//: #### 索引 ----> 文字内容
//: #### 里面存储的东西都是: 键(key) 值(value) 对
//: ---
//: #### 创建一个空字典
//就像数组，你可以用初始化器语法来创建一个空 Dictionary：

//创建了类型为 [Int: String]的空字典来储存整数的可读名称。它的键是 Int类型，值是 String类型
var namesOfIntegers = [Int: String]()       // namesOfIntegers 是一个空的 [Int: String] 字典

//声明一个空的字典，key为String类型，value为Float类型
let emptyDictionary2 = Dictionary<String, Float>()

let emptyDictionary3 = [String: Float]()
print(emptyDictionary2.count)

//: ---

//: #### 访问和修改字典

//:添加、修改
//查找原来的字典，如果原来的字典包含此key，那么就把原来字典对应的value换成新的value，
//如果没有找到此key，就添加一对新的值


//var airports: Dictionary<String, String> = ["TYO": "Tokyo", "DUB": "Dublin"]
var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
print(airports["TYO"])

//添加、修改
airports["LHR"] = "London"
print(airports)

airports["LHR"] = "London Heathrow" // the value for "LHR" has been changed to "London Heathrow
print(airports)

airports.updateValue("Dublin International", forKey: "DUB")
print(airports)

//删除
airports["LHR"] = nil
print(airports)

//: 通过key来删除
airports.removeValue(forKey: "DUB")
print(airports)

//输出count
print("airports count is " + String(airports.count))
print("The dictionary of airports contains \(airports.count) items.")

print(airports.startIndex)
print(airports.endIndex)


//:遍历字典
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// 遍历所有的key
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

// 遍历所有的value
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//把所有的key转换成数组
let airportCodes = Array(airports.keys)     // airportCodes is ["TYO", "LHR"]

//把所有的value转换成数组
let airportNames = Array(airports.values)   // airportNames is ["Tokyo", "London Heathrow"]

print(airportCodes)
print(airportNames)

//: [上一页](@previous)
