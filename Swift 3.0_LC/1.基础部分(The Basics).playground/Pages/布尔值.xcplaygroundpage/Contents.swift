//: ## 布尔值（boolean）
//: ### Swift 有一个基本的布尔（Boolean）类型，叫做Bool。
//: ### 布尔值指逻辑上的值，因为它们只能是真或者假。Swift 有两个布尔常量，true和false

// 当你编写条件语句比如if语句的时候，布尔值非常有用：
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// 输出 "Eww, turnips are horrible."

//: 如果你在需要使用 `Bool` 类型的地方使用了非布尔值，`Swift` 的 (类型安全机制)会报错。下面的例子会报告一个编译时错误：
/*
 let i = 1
 if i {         // 这个例子不会通过编译，会报错
 }

 */

//然而，下面的例子是合法的：
let i = 1
if i == 1 {         //i == 1的比较结果是Bool类型”
    // 这个例子会编译成功
}

//: [上一页](@previous) | [下一页](@next)
