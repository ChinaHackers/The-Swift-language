//: ## 检测API可用性
/*:
 - Swift 有检查 API 可用性的内置支持，这可以确保我们不会不小心地使用对于当前部署目标不可用的 API。
 - 编译器使用 SDK 中的可用信息来验证我们的代码中使用的所有 API 在项目指定的部署目标上是否可用。
 -  如果我们尝试使用一个不可用的 API，Swift 会在编译期报错。
 - 我们使用一个可用性条件在一个if或guard语句中去有条件的执行一段代码，这取决于我们想要使用的 API 是否在运行时是可用的。
 - 编译器使用从可用性条件语句中获取的信息去验证在代码块中调用的 API 是否都可用。

 */
if #available(iOS 9, OSX 10.10, *) {
    // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
    // 使用先前版本的 iOS 和 OS X 的 API
}

/*:
- 以上可用性条件指定了在 iOS 系统上，if段的代码仅会在 iOS 9 及更高版本的系统上执行；在 OS X，仅会在 OS X v10.10 及更高版本的系统上执行。
- 最后一个参数，*，是必须写的，用于处理未来潜在的平台。
- 在它的一般形式中，可用性条件获取了一系列平台名字和版本。平台名字可以是iOS，OSX或watchOS。
- 除了特定的主板本号像 iOS 8，我们可以指定较小的版本号像 iOS 8.3 以及 OS X v10.10.3。

 */
/*

if #available(platform name version, ..., *) {
    statements to execute if the APIs are available
} else {
    fallback statements to execute if the APIs are unavailable
}
 
 */

//: [后退](@previous)
