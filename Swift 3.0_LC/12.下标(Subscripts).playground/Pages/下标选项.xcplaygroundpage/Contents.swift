//: ## 下标脚本选项
//: - 下标脚本允许任意数量的入参索引，并且每个入参类型也没有限制。
//: - 下标脚本的返回值也可以是任何类型。
//: - 下标脚本可以使用变量参数和可变参数。
//: - 一个`类`或`结构体`可以根据自身需要提供多个`下标脚本`实现，在定义下标脚本时通过传入参数的类型进行区分，使用下标脚本时会自动匹配合适的下标脚本实现运行，这就是下标脚本的重载。
// Matrix 结构体提供了一个两个传入参数的构造方法，两个参数分别是rows和columns，创建了一个足够容纳rows * columns个数的Double类型数组。为了存储，将数组的大小和数组每个元素初始值0.0。
//你可以通过传入合适的rows和columns的数量来构造一个新的Matrix实例。
struct Matrix {
    let rows: Int
    let columns: Int
    
    var print: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        print = Array(repeating: 0.0, count: rows * columns)
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            return print[(row * columns) + column]
        }
        set {
            print[(row * columns) + column] = newValue
        }
    }
}
// 创建了一个新的 3 行 3 列的Matrix实例
var mat = Matrix(rows: 3, columns: 3)

// 通过下标脚本设置值
mat[0,0] = 1.0
mat[0,1] = 2.0
mat[1,0] = 3.0
mat[1,1] = 5.0

// 通过下标脚本获取值
print("\(mat[0,0])")
print("\(mat[0,1])")
print("\(mat[1,0])")
print("\(mat[1,1])")

//以上程序执行输出结果为：
//1.0
//2.0
//3.0
//5.0

//: [上一页](@previous)
