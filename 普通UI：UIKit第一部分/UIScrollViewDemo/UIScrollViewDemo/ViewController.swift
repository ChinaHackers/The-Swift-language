//
//  ViewController.swift
//  UIScrollViewDemo
//
//  Created by Liu Chuan on 15/8/2.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // 3个页面
    let numOfPages = 3
    
    // 页面宽度：320
    let pagesWidth = 320
    
    // 页面高度：360
    let pagesHight = 360
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //页面滚动
        // UIScrollView 提供了以页面为单位滚动显示内容的功能，每次手指滑动后滚动到下一屏内容
        
       // scrollView的初始化
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        
        //为了让内容横向滚动，横向内容宽度为 3个页面的宽度总和
        
        scrollView.contentSize = CGSizeMake(CGFloat(pagesWidth*numOfPages), CGFloat(CGFloat(pagesHight)))
        
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator =  false
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        
        self.view.addSubview(scrollView)
        
        for i in 0..<numOfPages {
            
            
//            _ = MyViewController(number:(i + 1))
            
            
            _ = MyViewController(number:(i + 1))
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

