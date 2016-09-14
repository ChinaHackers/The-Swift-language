//
//  ViewController.swift
//  UIButton
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright (c) 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 按钮（UIButton）
        /*
         按钮的类型:
         
         UIButtonType.ContactAdd         "+"图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.DetailDisclosure   "!"图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.System             不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.Custom             定制按钮，不带图标，默认文字颜色为白色，无触摸时的高亮效果
         UIButtonType.RoundedRect        圆角按钮
         */

        // 1.按钮的创建
        
        // 创建一个 ContactAdd (+号类型 )的按钮 默认文字颜色是蓝色，有按钮触摸高亮效果
        // let button = UIButton(type: UIButtonType.ContactAdd)
        
        //创建一个圆角按钮
        let button = UIButton(type: UIButtonType.roundedRect)
        
        
        // 设置按钮的位置、大小
        button.frame = CGRect(x: 10, y: 150, width: 100, height: 30)
        
        // 设置按钮的文字
        button.setTitle("点我啊", for: UIControlState())
        
        //创建一个Custom 定制类型的图标 创建按钮代码简化为：
        // var button = UIButton(frame: CGRectMake(10, 150, 200, 30))
        
        // 2.按钮的文字、颜色、状态
        
        // 不同状态下的按钮设置不同的文字和颜色。
        // setTitle 设置按钮的文字
        
        button.setTitle("普通状态", for: UIControlState())
//        button.setTitle("触摸状态", forState: UIControlState.Highlighted)
//        button.setTitle("禁用状态", forState: UIControlState.Disabled)
        
        // setTitleColor: 设置不同状态下的字体颜色
        button.setTitleColor(UIColor.black, for: UIControlState())
//        button.setTitleColor(UIColor.greenColor(), forState: .Highlighted)
//        button.setTitleColor(UIColor.grayColor(), forState: .Disabled)
        
        // setTitleShadowColor: 设置不同状态下的阴影颜色
        button.setTitleShadowColor(UIColor.green, for: UIControlState())
        button.setTitleShadowColor(UIColor.yellow, for: .highlighted)
        button.setTitleShadowColor(UIColor.gray, for: .disabled)
        
        
        // 设置按钮的背景色，用UIView 的 backgroundColor 属性设置
        button.backgroundColor = UIColor.yellow
        
        // 3.按钮的图片
        
        // 设置按钮的图标
        button.setImage(UIImage(named: "icon"), for: UIControlState())
        
        // 当按钮处于触摸（高亮）的状态下，按钮图标会变暗。
        // 如果不想变暗，可以设置:
        button.adjustsImageWhenHighlighted = false
        
        //同理，还可以设置按钮在禁用状态下 图标不变暗
        button.adjustsImageWhenDisabled = false

        // 用 setBackgroundImage 设置按钮的背景图片
        button.setBackgroundImage(UIImage(named:"background"),for:UIControlState())
        
        
        // 4.按钮的触摸事件
        
        // 在按钮被触摸时，会执行一些程序，用 addTarget 方法监听按钮触摸事件
        /*
            第一个参数：传递一个对象
            第二个参数 action：传递对象的方法
            第三个参数 forControlEvents：传递 事件类型
        
        */
        
        // 如果需要在tapped 方法中获得按钮对象，需要在定义action 参数时，方法名称后带上冒号
        button.addTarget(self, action: #selector(ViewController.tapped(_:)) , for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button)
        

    }
    
    // 因为上面按钮触摸代码第一个参数 传递为self，所以需要在当前类中声明一个 tapped方法
    // 当按钮被点击了，会调用这个方法
    
    func tapped(_ button:UIButton) {
        print(button.title(for: UIControlState()))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

