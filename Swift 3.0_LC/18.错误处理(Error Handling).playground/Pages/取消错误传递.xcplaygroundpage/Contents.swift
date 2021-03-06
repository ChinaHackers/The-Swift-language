//: ## 取消错误传递

//: 事实上有时你已经知道一个抛出错误或者方法不会在运行时抛出错误。在这种情况下，你可以在表达式前写 try!来取消错误传递并且把调用放进不会有错误抛出的运行时断言当中。如果错误真的抛出了，你会得到一个运行时错误。

//; 比如说，下面的代码使用了 `loadImage(_:)`函数，它在给定路径下加载图像资源，如果图像不能被加载则抛出一个错误。在这种情况下，由于图像跟着应用走，运行时不会有错误抛出，所以取消错误传递是合适的。


let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")


//: [上一页](@previous) | [下一页](@next)
