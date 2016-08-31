//: ## 关联值
//: Swift的枚举允许对每个成员定义更多的信息
//: 允许存储任意类型的相关值，如果需要的话每个成员的相关值类型可以各不相同
// 相关值在枚举定义时只声明类型，具体值在使用时初始化
//: 每一种类型都可附加一个或多个值，形式是元组。

//定义一个名为 Barcode 的枚举类型
enum Barcode {
    
    //成员值:具有(Int，Int，Int，Int)类型关联值的UPCA
    case UPCA(Int, Int, Int, Int)
    
    //具有 String 类型关联值的 QRCode
    case QRCode(String)
}

//创建了一个名为 productBarcode 的变量，并将 Barcode.UPCA 赋值给它，关联的元组值为(8, 85909, 51226, 3)
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("AFFJFLJSFJKSLJFSF")
//: [原始值](@next)
