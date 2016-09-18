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
        
        
        // UIPageControl (分页控制器)
        
        // 获取当前屏幕尺寸
        let screenFrame = UIScreen.mainScreen().bounds
        
        // 获取屏幕尺寸的 宽\高
        let screenWidth = screenFrame.size.width
        let screenHight = screenFrame.size.height
        
       
        // 设置页面控制器的显示区域
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: screenHight - self.view.frame.height, width: screenWidth, height: self.view.bounds.height))
        
        // 设置页面控制器对象的 总页数: 6页
        pageControl.numberOfPages = 6
        
        // currentPageIndicatorTintColor: 设置当前页码小白点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        
        // pageIndicatorTintColor:  设置未选择页面小白点的颜色
        pageControl.pageIndicatorTintColor = UIColor.grayColor()
        
        // 设置页面控制器的当前页码
        pageControl.currentPage = 0
        
        // 设置页面控制器的背景颜色
        pageControl.backgroundColor = UIColor.orangeColor()
        
        // 给页面控制器添加 监听方法
        pageControl.addTarget(self, action: #selector(ViewController.changed(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addSubview(pageControl)
        
       
    }
    
    // 实现页面控制器的方法
    func changed(page: UIPageControl) {
        
         print("当前在第\(page.currentPage)页")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

