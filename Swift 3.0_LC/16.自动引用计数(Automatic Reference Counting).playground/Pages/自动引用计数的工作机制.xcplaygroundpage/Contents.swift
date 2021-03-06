//:## 自动引用计数的工作机制
/*: 
 
 每次你创建一个类的实例，ARC 会分配一大块内存来存储这个实例的信息。这些内存中保留有实例的类型信息，以及该实例所有存储属性值的信息。
 
 此外，当实例不需要时，ARC 会释放该实例所占用的内存，释放的内存用于其他用途。这确保类实例当它不在需要时，不会一直占用内存。
 
 然而，如果 ARC 释放了正在使用的实例内存，那么它将不会访问实例的属性，或者调用实例的方法。确实，如果你试图访问该实例，你的app很可能会崩溃。
 
 为了确保使用中的实例不会消失，ARC 会跟踪和计算当前实例被多少属性，常量和变量所引用。只要存在对该类实例的引用，ARC 将不会释放该实例。
 
 为了使这些成为可能，无论你将实例分配给属性，常量或变量，它们都会创建该实例的强引用。之所以称之为“强”引用，是因为它会将实例保持住，只要强引用还在，实例是不允许被销毁的。
 
*/

//: [上一页](@previous) | [下一页](@next)
