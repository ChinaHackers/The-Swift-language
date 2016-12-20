//
//  ViewController.swift
//  UIPageControl
//
//  Created by Liu Chuan on 16/7/19.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PageController_Demo()
        
    }
    
    
    // MARK: - UIPageControl (分页控制器)
    fileprivate func PageController_Demo() {
        
        // 获取当前屏幕尺寸
        let screenFrame = UIScreen.main.bounds
        
        // 获取屏幕尺寸的 宽\高
        let screenWidth = screenFrame.size.width
        let screenHight = screenFrame.size.height
        
        // 设置页面控制器的显示区域
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: screenHight - view.frame.height, width: screenWidth, height: self.view.bounds.height))
        
        // MARK: 设置页面控制器对象的总页数
        pageControl.numberOfPages = 6
        
        // MARK: 设置当前页码小白点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.white
        
        // MARK: 设置未选择页面小白点的颜色
        pageControl.pageIndicatorTintColor = UIColor.gray
        
        // MARK: 设置页面控制器的当前页码
        pageControl.currentPage = 0
        
        // MARK: 设置页面控制器的背景颜色
        pageControl.backgroundColor = UIColor.orange
        
        // MARK: 给页面控制器添加 监听方法
        pageControl.addTarget(self, action: #selector(changed(_:)), for: .valueChanged)
        
        view.addSubview(pageControl)
        
    }
    
    
    // 实现页面控制器的方法
   @objc fileprivate func changed(_ page: UIPageControl) {
        
         print("当前在第\(page.currentPage)页")
    }

}

