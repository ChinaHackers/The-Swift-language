//
//  ViewController.swift
//  UIScrollViewDemo3
//
//  Created by Liu Chuan on 16/6/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 定义3个常量用来表示 4个页面\页面宽度:320\高度: 360
    let numOfPages = 4
    let pageWidth = 320
    let pageHeight = 568

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIScrollView (滚动视图)
        
        // 初始化 UIScrollView 对象,并设置其位置
        let scrollView = UIScrollView(frame: self.view.frame)
        
        // 设置UIScrollView缩放最小比例\最大比例
        // scrollView.minimumZoomScale = 0.1
        // scrollView.maximumZoomScale = 3
        
        // 设置是否按照整页来滚动视图
        scrollView.pagingEnabled = true
        
        // 设置是否开启滚动效果
        scrollView.scrollEnabled = true
        
        // 设置画布大小, 画布显示在滚动视图内部, 一般大于 Frame 的大小
        // 为了能让内容横向滚动, 设置横向宽度为 3个页面的宽度总和
        scrollView.contentSize = CGSizeMake(CGFloat(pageWidth * numOfPages), CGFloat(pageHeight))
        
        // 设置是否边缘弹动效果
        scrollView.bounces = true
        
        // 开启横向弹动效果
        scrollView.alwaysBounceHorizontal = true
        
        // 开启纵向弹动效果
        scrollView.alwaysBounceVertical = true
        
        // 显示横向滚动条
        scrollView.showsHorizontalScrollIndicator = true
        
        // 显示纵向滚动条
        scrollView.showsVerticalScrollIndicator = true
        
        // 设置滚动视图的背景色
        scrollView.backgroundColor = UIColor.blackColor()
        
        self.view.addSubview(scrollView)
     
        // 使用 for in 循环创建 4张图片
        for i in 0..<numOfPages {
            
            let str = NSString(format: "%d.jpg", i+1)
            
            let image = UIImage(named: str as String)
            
            
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: pageWidth * i, y: 0, width: pageWidth, height: pageHeight)
            
            
            scrollView.addSubview(imageView)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

