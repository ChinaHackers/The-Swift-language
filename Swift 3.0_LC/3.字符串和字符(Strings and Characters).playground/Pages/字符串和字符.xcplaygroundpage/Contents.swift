//: ## 字符串和字符（Strings and Characters）
//: 本页包含内容：
/*:
 * 字符串字面量
 * 初始化空字符串
 * 字符串可变性
 * 字符串是值类型
 * 使用字符
 * 连接字符串和字符
 * 字符串插值
 * Unicode
 * 计算字符数量
 * 访问和修改字符串
 * 比较字符串
 * 字符串的 Unicode 表示形式
 */
//: ---
/*:
 `String`是例如`"hello, world"，"albatross"`这样的有序的`Character`（字符）类型的值的集合。
 
 通过`String`类型来表示。 一个`String`的内容可以用变量的方式读取，它包括一个`Character`值的集合。
 
 创建和操作字符串的语法与` C `语言中字符串操作相似，轻量并且易读。
 
 字符串连接操作只需要简单地通过+符号将两个字符串相连即可。
 
 与 `Swift` 中其他值一样，能否更改字符串的值，取决于其被定义为常量还是变量。
 
 你也可以在字符串内插过程中使用字符串插入常量、变量、字面量表达成更长的字符串，这样可以很容易的创建自定义的字符串值，进行展示、存储以及打印。
 
 尽管语法简易，但`String`类型是一种快速、现代化的字符串实现。
 
 每一个字符串都是由编码无关的 `Unicode` 字符组成，并支持访问字符的多种 `Unicode` 表示形式`（representations）。`
 
 */

/*:
//:> 注意：
 *   Swift 的String类型与 Foundation NSString类进行了无缝桥接。就像 AnyObject类型 中提到的一样，
 
 *   在使用 Cocoa 中的 Foundation 框架时，您可以将创建的任何字符串的值转换成NSString，并调用任意的NSString API。
 
 *   您也可以在任意要求传入NSString实例作为参数的 API 中用String类型的值代替。
 
 *   更多关于在 Foundation 和 Cocoa 中使用String的信息请查看 Using Swift with Cocoa and Objective-C (Swift 2.1)。
 
 */

//: ---
//: ### Unicode

/*:
 Unicode 是一个国际标准，用于文本的编码和表示。 它使您可以用标准格式表示来自任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。
 Swift 的String和Character类型是完全兼容 Unicode 标准的。
*/
 
//: ### Unicode 标量（Unicode Scalars）

/*:
 Swift 的String类型是基于 Unicode 标量 建立的。
 Unicode 标量是对应字符或者修饰符的唯一的21位数字，例如U+0061表示小写的拉丁字母(LATIN SMALL LETTER A)("a")，
 U+1F425表示小鸡表情(FRONT-FACING BABY CHICK) ("🐥")。
*/

//:> 注意： Unicode 码位(code poing) 的范围是U+0000到U+D7FF或者U+E000到U+10FFFF。
//:> Unicode 标量不包括 Unicode 代理项(surrogate pair) 码位，其码位范围是U+D800到U+DFFF。
//:> 注意不是所有的21位 Unicode 标量都代表一个字符，因为有一些标量是留作未来分配的。
//:> 已经代表一个典型字符的标量都有自己的名字，例如上面例子中的LATIN SMALL LETTER A和FRONT-FACING BABY CHICK。
//: ---
//: ### 字符串字面量的特殊字符 (Special Characters in String Literals)
/*:
 字符串字面量可以包含以下特殊字符：
 
 转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
 Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
 下面的代码为各种特殊字符的使用示例。 wiseWords常量包含了两个双引号。 dollarSign、blackHeart和sparklingHeart常量演示了三种不同格式的 Unicode 标量：
 
 */

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imageination is more important than knowledge" - Enistein
let dollarSign = "\u{24}"             // $, Unicode 标量 U+0024
let blackHeart = "\u{2665}"           // ♥, Unicode 标量 U+2665
let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496

//: ### 可扩展的字形群集(Extended Grapheme Clusters)
/*:
 每一个 Swift 的Character类型代表一个可扩展的字形群。 一个可扩展的字形群是一个或多个可生成人类可读的字符 Unicode 标量的有序排列。
 举个例子，字母é可以用单一的 Unicode 标量é(LATIN SMALL LETTER E WITH ACUTE, 或者U+00E9)来表示。
 然而一个标准的字母e(LATIN SMALL LETTER E或者U+0065) 加上一个急促重音(COMBINING ACTUE ACCENT)的标量(U+0301)，这样一对标量就表示了同样的字母é。
 这个急促重音的标量形象的将e转换成了é。
 
 在这两种情况中，字母é代表了一个单一的 Swift 的Character值，同时代表了一个可扩展的字形群。
 
 在第一种情况，这个字形群包含一个单一标量；而在第二种情况，它是包含两个标量的字形群：
 
 */

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 后面加上  ́
// eAcute 是 é, combinedEAcute 是 é

//: 可扩展的字符群集是一个灵活的方法，用许多复杂的脚本字符表示单一的Character值。
//例如，来自朝鲜语字母表的韩语音节能表示为组合或分解的有序排列。
 //在 Swift 都会表示为同一个单一的Character值：

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한
//: 可拓展的字符群集可以使包围记号(例如COMBINING ENCLOSING CIRCLE或者U+20DD)的标量包围其他 Unicode 标量，作为一个单一的Character值：
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute 是 é⃝

//局部的指示符号的 Unicode 标量可以组合成一个单一的Character值，
//例如REGIONAL INDICATOR SYMBOL LETTER U(U+1F1FA)和REGIONAL INDICATOR SYMBOL LETTER S(U+1F1F8)：

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS 是 🇺🇸


//: [下一页](@next)
