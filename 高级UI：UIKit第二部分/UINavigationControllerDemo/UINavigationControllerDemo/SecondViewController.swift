//
//  SecondViewController.swift
//  UINavigationControllerDemo
//
//  Created by Liu Chuan on 16/6/24.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// MARK: - 第二个视图控制器
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // 设置当前视图控制器, 在导航视图控制器中的显示标题
         self.title = "Second"
        
        // 设置当前视图控制器的背景颜色
        view.backgroundColor = UIColor.gray

        // 添加2个按钮
        Add_Two_Btn()
        
    }
    
    
    // MARK: 添加2个按钮
    fileprivate func Add_Two_Btn() {

        // 添加一个按钮, 点击按钮时,隐藏导航栏
        let btHiddenBar = UIButton(frame: CGRect(x: 40, y: 200, width: 240, height: 30))
        
        // 设置按钮标题文字
        btHiddenBar.setTitle("Hide Navigation Bar", for: UIControlState())
        
        // 设置按钮的背景颜色
        btHiddenBar.backgroundColor = UIColor.blue
        
        // 给按钮绑定点击事件
        btHiddenBar.addTarget(self, action: #selector(HiddenNaviBar), for: .touchUpInside)
        
        // 创建第二个按钮, 点击该按钮 隐藏底部的工具栏
        let btHiddenToolBar = UIButton(frame: CGRect(x: 40, y: 260, width: 240, height: 30))
        
        // 设置按钮的标题文字
        btHiddenToolBar.setTitle("Hide Tool Bar", for: UIControlState())
        
        // 设置按钮的背景颜色
        btHiddenToolBar.backgroundColor = UIColor.blue
        
        // 给按钮绑定点击事件
        btHiddenToolBar.addTarget(self, action: #selector(HiddenToolBar), for: .touchUpInside)
        
        // 将按钮添加到当前视图控制器 的根视图
        view.addSubview(btHiddenBar)
        view.addSubview(btHiddenToolBar)

    }
    
    
    // 第一个按钮点击事件方法
    @objc fileprivate func HiddenNaviBar() {
        
        // MARK: 隐藏导航视图控制器 - 顶部导航栏
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    // 第二个按钮点击事件方法
    @objc fileprivate func HiddenToolBar() {
        
        // MARK: 隐藏导航视图控制器 - 底部工具栏
        navigationController?.setToolbarHidden(true, animated: true)
        
    }
}
