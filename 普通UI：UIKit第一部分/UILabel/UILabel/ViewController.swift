//
//  ViewController.swift
//  UILabel
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright (c) 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // 1.标签（Label）的创建
        
        //创建标签（Label）
        let label = UILabel(frame: CGRect(x: 20, y: 100, width: 300, height: 100))
        
        //设置标签显示文字
        label.text = "The Swift Programming Language ！"

        // 添加到视图中
        self.view.addSubview(label)
        
        // 2.背景颜色、文字颜色的设置
        
        // 设置标签文字颜色为白色
        label.textColor = UIColor.white
        
        // 设置标签背景颜色为紫色
        label.backgroundColor = UIColor.purple
        
        // 3.对齐方式的设置
        /*
        可以用textAlignment 属性设置文字的对齐方式。
        属性值可以为：
         NStextAlignment.Center ->居中对齐
         NSTextAlignment.Right ->右对齐
         NStextAlignment.Left ->左对齐
        */
        
        label.textAlignment = NSTextAlignment.center

        // 4.文字阴影的设置
        // 文字阴影的颜色用 shadowColor 属性设置，阴影的偏移量可以用属性 shadowOffset 来指定。
        
        // 设置文字阴影颜色为 gray（灰色）
        label.shadowColor = UIColor.gray
        
        // shadowOffset 属性值，需要用到 CGSizeMake 函数来生成，
        // 函数的第一个参数表示 X 轴的偏移量，第二个参数表示 Y 轴的偏移量
        label.shadowOffset = CGSize(width: -5, height: 5)
        
        //遍历系统所有的字体
        for name in UIFont.familyNames {
            print("\(name)")
        }


        // 5.字体的设置
        
        // 通过font属性，可以设置文字的字体
        //该属性值为UIfont 对象，如果找不到定义的字体，将会使用系统默认的字体、大小。
        label.font = UIFont(name: "Bodoni 72", size: 20)
      
        
        // 6.文字的省略方式

        /*
        当标签的文字超过了容器的宽度时，隐藏尾部的文字，并显示省略号.
        通过 lineBreakMode 属性设置省略方式。
        
        属性值可以为：
           NSLineBreakMode.ByWordWrapping      按照单词换行
           NSLineBreakMode.ByTruncatingTail    隐藏尾部文字并显示省略号
           NSLineBreakMode.ByTruncatingMiddle  隐藏中间文字并显示省略号
           NSLineBreakMode.ByTruncatingHead    隐藏头部文字并显示省略号
           NSLineBreakMode.ByClipping          截取多于的部分，并不显示省略号
           NSLineBreakMode.ByCharWrapping      按照字符换行
      
        */
        
        label.lineBreakMode = NSLineBreakMode.byTruncatingMiddle
     
        // 7.文字的自动调整
        /*
         
        默认情况下，当文字超出标签的宽度，会被隐藏一部分，如果不想文字被隐藏，希望全部显示出来，
        可以通过设置 adjustsFontSizeToFitWidth 属性来实现
         
         */
        
        label.adjustsFontSizeToFitWidth = true
        
        // 8.多行字符串
        // 默认标签中的文字只会显示一行，如果需要显示多行文字，通过设置 numberOfLines 属性来实现

        label.numberOfLines = 2
        
        //设置标签中的文字的行数( 0 可以不限制行数)
        
        // label.numberOfLines = 0
        
    }

}

