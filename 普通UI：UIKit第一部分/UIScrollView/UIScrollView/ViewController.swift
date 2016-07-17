//
//  ViewController.swift
//  UIScrollView
//
//  Created by Liu Chuan on 15/8/1.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit
// 遵守 滚动视图代理协议
class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //===============================
        //MARK: - 滚动视图（ UIScrollView ）
        //===============================
        
        /*
         -   当屏幕容纳不下图片的尺寸时，UIKit框架提供了 UIScrollView 类实现 滚动视图
         -   手指滚动屏幕来浏览整个页面
         */
        // 滚动视图的创建
        let scrollView = UIScrollView(frame: self.view.bounds)
        
        // 方法、缩小
        // 属性 minimumZoomScale 、maximumZoomScale 设置缩放的最小比例、最大比例 默认是1.0 ，如果默认值不修改表示不实现缩放
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 3
        
        scrollView.delegate = self
        
        let imageView = UIImageView(image: UIImage(named: "bigpic"))
        
        scrollView.contentSize = imageView.bounds.size
        
        scrollView.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        
    }

    //  delegate 属性指定一个委托类，委托类要继承 UIScrollViewDelegate 协议，
    //  并要在委托类中实现 viewForZoomingInScrollView 方法 才能实现缩放
    
    // 因为 viewForZoomingInScrollView 返回值 为 UIImageView 类型，因此这里进行缩放操作 就是图片的缩放
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        for subview: AnyObject in scrollView.subviews {
            
            if subview.isKindOfClass(UIImageView) {
                
                return subview as? UIView
            }
        }
        
        return nil
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

