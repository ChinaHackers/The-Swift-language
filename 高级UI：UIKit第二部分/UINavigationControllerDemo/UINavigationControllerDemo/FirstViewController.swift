//
//  FirstViewController.swift
//  UINavigationControllerDemo
//
//  Created by Liu Chuan on 16/6/24.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// 第一视图控制器
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置当前视图控制器, 在导航视图控制器中的标题
        self.title = "First"
        
        // 设置当前视图控制器的背景颜色
        self.view.backgroundColor = UIColor.brownColor()
        
        
        // 设置右上角导航按钮的样式\功能.
        // 当点击此导航按钮时, 页面就跳转第二个视图控制器
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(FirstViewController.nextPage))
        
        
        // 实例化一个工具条按钮对象
        let leftBar = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Refresh, target: self, action: #selector(FirstViewController.refresh))
        
        // 设置导航栏左侧按钮 为 工具条对象
        self.navigationItem.leftBarButtonItem = leftBar
        
        
        
    }

    
    // 添加视图控制器跳转方法
    func nextPage() {
        
        // 初始化第二个视图控制器对象
        let second = SecondViewController()
        
        // 将第二个视图控制器 压入导航视图控制器中, 实现界面跳转.
        self.navigationController?.pushViewController(second, animated: true)
        
        
    }
    
    
    // MARK: - 显示\隐藏 导航视图的导航栏\工具栏
    
    // 视图控制器生命周期中, 视图即将显示的代理方法
    // 视图即将可见时, 执行该方法
    
    override func viewWillAppear(animated: Bool) {
        
        // 覆盖父类的同名方法
        super.viewWillAppear(animated)
        
        // 设置顶部导航区的提示文字
        self.navigationItem.prompt = "Loading..."
        
        // 设置导航栏的背景是否透明
        self.navigationController?.navigationBar.translucent = true

        // 设置导航栏的系统样式
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        // 设置导航栏的前景颜色
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
       
        // 显示底部的工具栏
        self.navigationController?.setToolbarHidden(false, animated: false)
        
    }
    
    
    func refresh() {
        
        // 创建警告弹出窗口
        let alert = UIAlertController(title: "Info", message: "Refresh Feeling", preferredStyle: UIAlertControllerStyle.Alert)
        
        // 创建提示窗口中的[确定]按钮
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        // 将确定按钮添加到提示窗口中
        alert.addAction(okAction)
        
        // 显示提示窗口
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
