//
//  ViewController.swift
//  UIProgressView
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 创建进度条
    // 实例化 UIProgressView 类可以创建一个进度条，在实例化时参数 progressViewStyle.Defailt 指定进度条风格为默认风格
    let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 进度条（UIProgressView）
        
        progressView.center = self.view.center
        
        
        // progress 属性可以设置进度条进度，0.5表示 进度为：50%
        // progressView.progress = 0
        
        // 进度设置为80%，animated 参数，表示在变化进度时是否需要动画效果
        //progressView.setProgress(0.8, animated: true)
        
        
        // 改变进度条的颜色
        // progressTintColor 属性: 设置已有的进度的颜色
        progressView.progressTintColor = UIColor.whiteColor()
        
        // trackTintColor 属性: 设置剩余的进度的颜色
        progressView.trackTintColor = UIColor.grayColor()
        
        // 设置背景色为黑色
        self.view.backgroundColor = UIColor.blackColor()
        
        // 先归零
        progressView.progress = 0
        
        // 用 NSTimer 计时器 更新 progress 进度
        // 1秒更新一次, 更新方法, 一直循环
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.update(_:)), userInfo: nil, repeats: true)
    
        self.view.addSubview(progressView)
        
    }

    
    func update(sender: NSTimer) {
        
        progressView.progress += 0.1
        
        if progressView.progress >= 1 {
            
            // 失效
            sender.invalidate()
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

