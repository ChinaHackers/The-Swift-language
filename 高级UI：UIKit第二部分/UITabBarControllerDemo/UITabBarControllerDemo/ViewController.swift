//
//  ViewController.swift
//  UITabBarControllerDemo
//
//  Created by Liu Chuan on 16/7/17.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// 遵守 UITabBar 代理协议
class ViewController: UIViewController, UITabBarDelegate {
    
    // 添加 Tab Bar 控件
    var tabBar: UITabBar!
    
    // Tab Bar item 的名称
    var tabs = ["iOS", "Swift", "HTML", "Java"]
    
    // Tab Bar 上方的视图
    var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITabBarController (标签控件)
        // 创建 Tab Bar
        // Tab Bar 默认高度: 44\ 48
        tabBar = UITabBar(frame: CGRect(x: 0, y: self.view.bounds.height - 48, width: self.view.bounds.width, height: 48))
        
        // 设置 tabBar 的颜色
        tabBar.tintColor = UIColor.orange()
        
        var items = [UITabBarItem]()
        
        for tab in self.tabs {
        
            let tabItem = UITabBarItem()
            
            // 设置 tabItem 的标题
            tabItem.title = tab
            
            items.append(tabItem)
            
            // 设置 tabItem 图片\选中图片
            tabItem.image = UIImage(named: "home_tab_personal_btn")
            tabItem.selectedImage = UIImage(named: "home_tab_personal_selected_btn")
            
            //设置渲染模式为原始
            // tabBarItem.selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            // 设置TabBar 是否禁用
            tabItem.isEnabled = true
            
        }
        
        // 设置 Tab Bar 的标签页
        tabBar.setItems(items, animated: true)
        
        // 设置 UITabBar 代理协议为当前视图控制器类
        tabBar.delegate = self
        
        // 添加 tabBar 当视图上
        self.view.addSubview(tabBar)
        
        // TabBar上方的视图
        contentView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height-48))
        
        contentView.backgroundColor = UIColor.blue()
        
        self.view.addSubview(contentView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

