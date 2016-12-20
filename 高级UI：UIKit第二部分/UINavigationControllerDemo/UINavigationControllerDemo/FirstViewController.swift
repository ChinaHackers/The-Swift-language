//
//  FirstViewController.swift
//  UINavigationControllerDemo
//
//  Created by Liu Chuan on 16/6/24.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// MARK: - 第一视图控制器
class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // 设置当前视图控制器, 在导航视图控制器中的标题
        self.title = "First"

        // 设置当前视图控制器的背景颜色
        view.backgroundColor = UIColor.orange
        
        
        // 设置右上角导航按钮的样式\功能.
        // 当点击此导航按钮时, 页面就跳转第二个视图控制器
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstViewController.nextPage))
        
        
        // 实例化一个工具条按钮对象
        let leftBar = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh, target: self, action: #selector(FirstViewController.refresh))
        
        // 设置导航栏左侧按钮 为 工具条对象
        navigationItem.leftBarButtonItem = leftBar
        
        
        
        // 设置 UINavigationItem 返回按钮标题
        let item = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        
        navigationItem.backBarButtonItem? = item

//        navigationItem.backBarButtonItem?.title = "返回"

        
    }

    // 添加视图控制器跳转方法
    @objc fileprivate func nextPage() {
        
        // 初始化第二个视图控制器对象
        let second = SecondViewController()
        
        // 将第二个视图控制器 压入导航视图控制器中, 实现界面跳转.
        navigationController?.pushViewController(second, animated: true)
        
    }
    
    
    @objc fileprivate func refresh() {
        
        // 创建警告弹出窗口
        let alert = UIAlertController(title: "Info", message: "Refresh Feeling", preferredStyle: UIAlertControllerStyle.alert)
        
        // 创建提示窗口中的[确定]按钮
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // 将确定按钮添加到提示窗口中
        alert.addAction(okAction)
        
        // 显示提示窗口
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - 显示\隐藏 导航视图的导航栏\工具栏
    
    // 视图控制器生命周期中, 视图即将显示的代理方法
    // 视图即将可见时, 执行该方法
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 覆盖父类的同名方法
        super.viewWillAppear(animated)
        
        // 设置顶部导航区的提示文字
        navigationItem.prompt = "Loading..."
        
        // 设置导航栏的背景是否透明
        navigationController?.navigationBar.isTranslucent = false

        // 设置导航栏的样式
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        
              //修改导航栏文字颜色
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // 设置导航栏的item颜色
        navigationController?.navigationBar.tintColor = UIColor.blue
        
        // 设置导航栏的背景颜色
        // navigationController?.navigationBar.barTintColor = UIColor.red
       
        // 显示底部的工具栏
        navigationController?.setToolbarHidden(false, animated: true)
        
    }
    

}
