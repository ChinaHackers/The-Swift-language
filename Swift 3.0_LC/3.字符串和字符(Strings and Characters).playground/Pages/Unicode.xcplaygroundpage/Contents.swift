//: ## Unicode
//: Unicode 是一种在不同书写系统中编码、表示和处理文本的国际标准。它允许你表示几乎标准化格式的任何语言中的任何字符，并且为外部源比如文本文档或者网页读写这些字符。如同这节中描述的那样，Swift 的 String和 Character类型是完全 Unicode 兼容的。

//: ---

//: #### Unicode 标量
//面板之下，Swift 的原生 String 类型建立于 Unicode 标量值之上。一个 Unicode 标量是一个为字符或者修饰符创建的独一无二的21位数字，比如 LATIN SMALL LETTER A (" a")的 U+0061 ，或者 FRONT-FACING BABY CHICK  ( "🐥" )的 U+1F425 。

//:> 注意: Unicode 标量码位位于 U+0000到 U+D7FF或者 U+E000到 U+10FFFF之间。Unicode 标量码位不包括从 U+D800到 U+DFFF的16位码元码位。

//: - 注意不是所有的 21 位 Unicode 标量都指定了字符——有些标量是为将来所保留的。那些有了字符的标量通常来说也会有个名字，比如上边栗子中的 LATIN SMALL LETTER A 和 FRONT-FACING BABY CHICK 。
//: ---

//: #### 字符串字面量中的特殊字符
//: 字符串字面量能包含以下特殊字符：
//: - 转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
//: - 任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。

//: 下边的代码展示了这些特殊字符的四个栗子。 wiseWords常量包含了两个转义双引号字符。 dollarSign， blackHeart和 sparklingHeart常量展示了 Unicode 标量格式：

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}" // $, Unicode scalar U+0024
let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

//: ---
//: #### 扩展字形集群

//: 每一个 Swift 的 Character类型实例都表示了单一的扩展字形集群。扩展字形集群是一个或者多个有序的 Unicode 标量（当组合起来时）产生的单个人类可读字符。

/*:
这有个例子。字母 é以单个 Unicode 标量 é ( LATIN SMALL LETTER E WITH ACUTE, 或者 U+00E9)表示。
 总之，同样的字母也可以用一对标量——一个标准的字母 e ( LATIN SMALL LETTER E,或者说  U+0065)，
 以及 COMBINING ACUTE ACCENT标量( U+0301)表示。 
 COMBINING ACUTE ACCENT标量会以图形方式应用到它前边的标量上，当 Unicode 文本渲染系统渲染时，
 就会把 e转换为 é来输出。
*/

//: 在这两种情况中，字母é都会作为单独的 Swift Character值以扩展字形集群来表示。在前者当中，集群包含了一个单独的标量；后者，则是两个标量的集群：
let eAcute: Character = "\u{E9}" // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by ́
// eAcute is é, combinedEAcute is é

//: 扩展字形集群是一种非常灵活的把各种复杂脚本字符作为单一 Character值来表示的方法。比如说韩文字母中的音节能被表示为复合和分解序列两种。这两种表示在 Swift 中都完全合格于单一 Character值：

let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한

//:  扩展字形集群允许封闭标记的标量 (比如 COMBINING ENCLOSING CIRCLE, 或者说 U+20DD) 作为单一 Character值来圈住其他 Unicode 标量：
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝
//: 区域指示符号的 Unicode 标量可以成对组合来成为单一的 Character值，比如说这个 REGIONAL INDICATOR SYMBOL LETTER U ( U+1F1FA)和 REGIONAL INDICATOR SYMBOL LETTER S  ( U+1F1F8)：
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is ??

//: [上一页](@previous) | [下一页](@next)
