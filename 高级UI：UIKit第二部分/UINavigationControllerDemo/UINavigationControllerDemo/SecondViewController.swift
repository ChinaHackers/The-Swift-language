//
//  SecondViewController.swift
//  UINavigationControllerDemo
//
//  Created by Liu Chuan on 16/6/24.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// 定义一个全局变量, 记录当前显示视图的编号
var pageNum = 0

// 第二个视图控制器
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 当视图控制器每创建一次, 全局变量增加1
        pageNum += 1
        
        // 根据当前全局变量的数值, 设置当前视图控制器的标题
        self.title = "page\(pageNum)"

        
        // 设置当前视图控制器, 在导航视图控制器中的显示标题
        // self.title = "Second"
        
        // 设置当前视图控制器的背景颜色
        self.view.backgroundColor = UIColor.purple
        
        
        // 添加2个按钮
        
        // 添加一个按钮, 点击按钮时,隐藏导航栏
        let btHiddenBar = UIButton(frame: CGRect(x: 40, y: 200, width: 240, height: 30))
        
        // 设置按钮标题文字
        btHiddenBar.setTitle("Hide Navigation Bar", for: UIControlState())
        
        // 设置按钮的背景颜色
        btHiddenBar.backgroundColor = UIColor.orange
        
        // 给按钮绑定点击事件
        btHiddenBar.addTarget(self, action: #selector(SecondViewController.HiddenNaviBar), for: UIControlEvents.touchUpInside)
        
        
        // 创建第二个按钮, 点击该按钮 隐藏底部的工具栏
        let btHiddenToolBar = UIButton(frame: CGRect(x: 40, y: 260, width: 240, height: 30))
        
        // 设置按钮的标题文字
        btHiddenToolBar.setTitle("Hide Tool Bar", for: UIControlState())
        
        // 设置按钮的背景颜色
        btHiddenToolBar.backgroundColor = UIColor.orange
        
        
        // 给按钮绑定点击事件
        btHiddenToolBar.addTarget(self, action: #selector(SecondViewController.HiddenToolBar), for: UIControlEvents.touchUpInside)
        
        
        // 将按钮添加到当前视图控制器 的根视图
        self.view.addSubview(btHiddenBar)
        self.view.addSubview(btHiddenToolBar)
        
        
    }
    
    // 第一个按钮点击事件方法
    func HiddenNaviBar() {
        
        // 当点击第一个按钮时, 隐藏导航视图控制器的 顶部导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        
    }
    
    // 第二个按钮点击事件方法
    func HiddenToolBar() {
        
        // 当点击第儿个按钮时, 隐藏导航视图控制器的 底部工具栏
        self.navigationController?.setToolbarHidden(true, animated: true)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
}
