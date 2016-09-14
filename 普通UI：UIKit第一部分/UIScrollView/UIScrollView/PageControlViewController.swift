//
//  PageControlViewController.swift
//  UIScrollViewDemo3
//
//  Created by Liu Chuan on 16/6/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// 页面控制
// 为当前视图控制器 添加 滚动视图 UIScrollView 的代理协议
class PageControlViewController: UIViewController, UIScrollViewDelegate {

    // 为视图控制器添加一个滚动识图属性
    var scrollView = UIScrollView()
    
    // 添加控制翻页的属性
    // 通过 UIPageControl 组件中的小白点, 观察页面的位置
    var pageControl = UIPageControl()
    
    // 添加一个状态属性,用来标志页面的滑动状态
    var usePageControl = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 获取当前屏幕尺寸
        var screenFrame = UIScreen.main.bounds
        
        // 获取屏幕尺寸的 宽\高
        let screenWidth = screenFrame.size.width
        let screenHight = screenFrame.size.height
        
        // 创建一个区域,显示之前创建的视图控制器
        scrollView.frame = screenFrame
        
        // 设置滚动视图 为翻页属性, 每滚动一次就是一页
        scrollView.isPagingEnabled = true
        
        // 设置滚动视图尺寸, 之前创建了4个页面, 所以设置滚动视图 的宽度 为页面的4倍
        scrollView.contentSize = CGSize(width: screenWidth * 4, height: screenHight)
        
        // 设置滚动视图的背景颜色为黑色
        scrollView.backgroundColor = UIColor.black
        
        // 设置滚动视图的代理 为当前类 ,来实现捕捉滚动视图的动作
        scrollView.delegate = self
        
        // 创建一个高度常量,作为页面控制器(UIPageControl)的高度
        let pHight: CGFloat = 50.0
        
        // 创建一个区域, 显示页面控制器 对象
        let pRect = CGRect(x: 0, y: screenHight - pHight, width: screenWidth, height: pHight)
        
        // 设置页面控制器的显示区域
        pageControl.frame = pRect
        
        // 设置页面控制器对象的 总页数: 4页
        pageControl.numberOfPages = 4
        
        // currentPageIndicatorTintColor: 设置当前页码小白点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.24, green:0.73, blue:1.00, alpha:1.00)
        
        
        // pageIndicatorTintColor: 设置未选择页面小白点颜色
        pageControl.pageIndicatorTintColor = UIColor.white
        
        // 设置页面控制器的当前页码
        pageControl.currentPage = 0
        
        // 设置页面控制器的背景颜色 为 透明色
        pageControl.backgroundColor = UIColor.clear
        
        // 给页面控制器,添加 监听页面切换 的方法
        pageControl.addTarget(self, action: #selector(PageControlViewController.sliding), for: UIControlEvents.valueChanged)
        
      
        // 创建 First 视图控制器实例
        let firstController = FirstViewController()
        
        // 设置坐标的纵向 x 值为0
        screenFrame.origin.x = 0
        
        // 设置 First 控制器的显示区域
        firstController.view.frame = screenFrame
        
        // 创建 Second 视图控制器实例
        let secondController = SecondViewController()
        
        // 设置坐标原点 x 值为当前屏幕的宽度, 即 Second 控制器显示在屏幕之外
        screenFrame.origin.x = screenFrame.size.width
        
        // 显示 Second 视图控制器的显示区域
        secondController.view.frame = screenFrame
  
        // 创建 Three 视图控制器
        let threeController = ThreeViewController()
        screenFrame.origin.x = screenFrame.size.width * 2
        threeController.view.frame = screenFrame
        
        
        // 创建 Four 视图控制器
        let fourController = FourViewController()
        screenFrame.origin.x = screenFrame.size.width * 3
        fourController.view.frame = screenFrame
        
        
        // 将4个视图控制器的根视图,添加到滚动视图中
        scrollView.addSubview(firstController.view)
        scrollView.addSubview(secondController.view)
        scrollView.addSubview(threeController.view)
        scrollView.addSubview(fourController.view)
        
        
        // 将滚动视图对象 \ 页面控制器对象 添加到当前窗口的根视图
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)

    }
    
    // 监听页面滑动的方法
    func sliding()  {
        
        // 获取当前页面控制器 当前的页码
        let page = CGFloat(pageControl.currentPage)
        
        // 获取滚动视图当前的显示区域
        var frame = scrollView.frame
        
        // 根据页面控制器的页码,计算滚动视图在下一页中的显示区域
        frame.origin.x = frame.size.width * page
        frame.origin.y = 0
        
        // 滚动视图到目前区域, 展现当前页面内容
        scrollView.scrollRectToVisible(frame, animated: true)
        
        // 设置通过页面控制器 切换页面
        usePageControl = true
        
        
    }
    
    // 监听滚动视图事件 代理方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        // 如果切换页面 ,则不执行后面的代码
        if !usePageControl {
            
            // 获得滚动视图的宽度
            let pageWidth = scrollView.frame.size.width
            
            // 根据滚动视图的宽度值 和 横向 移动数值 计算当前页码
            let pages = floor((scrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1
            
            // 设置页面控制器页码 ,为计算后得到的页码
            pageControl.currentPage = Int(pages)
            
        }
    }
    
    // 创建监听滚动视图 的滚动减速事件代理方法, 重置标量的默认值
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        usePageControl = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
