//
//  ViewController.swift
//  UIImageViewDemo
//
//  Created by Liu Chuan on 15/7/26.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //UIimageView 的基本使用
        
        // 创建 UIimageView
        let myimages = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        // 给 myimages设置图片
        myimages.image = UIImage(named: "mein")
        
        // 圆角
        //myimages.layer.masksToBounds = true
        // cornerRadius: 圆角半径
        // 如果设置一个完整的圆型图, 圆角的半径就为 图片高\宽的一半
        // myimages.layer.cornerRadius = 75
        
        // 阴影颜色
        myimages.layer.shadowColor = UIColor.lightGray.cgColor
        // 阴影的偏移度
        myimages.layer.shadowOffset = CGSize(width: 15, height: 15)
        
        // 设置阴影的不透明度, 1:不透明  0:透明
        myimages.layer.shadowOpacity = 1
        
        
        /*
         模糊效果样式、种类:
         UIBlurEffectStyle.Light         亮
         UIBlurEffectStyle.Dark          暗
         UIBlurEffectStyle.ExtraLight    加亮
         */
        
        // 创建模糊效果类实例
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        
        // 创建效果视图类实例
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        // 设置效果视图类实例的尺寸
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        
        //设置模糊透明度
        blurView.alpha = 0.8
        
        // 将模糊效果视图类实例放入背景中
        myimages.addSubview(blurView)
        
        
        //隐藏状态栏
        self.prefersStatusBarHidden
        

        // 创建按钮
        let btn = UIButton(frame: CGRect(x: 100, y: 250, width: 100, height: 30))
        btn.setTitle("帅哥,摸我!", for: UIControlState())
        btn.setTitleColor(UIColor.lightGray, for: UIControlState())
        btn.addSubview(myimages)
        btn.addTarget(self, action: #selector(ViewController.btnClicked(_:)), for: UIControlEvents.touchUpInside)
     
        // 显示
        self.view.addSubview(myimages)
        self.view.addSubview(btn)
    
    }
    
    // 按钮点击事件
    func btnClicked(_ btn: UIButton) {
        
        //调用alert()方法
        alert()
    }
    
    // 警告实例方法
    func alert() {
        
        
        let alert = UIAlertController(title: "The handsome boy hello!", message: "My name is tingting, nice to meet you!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "meet you!", style: UIAlertActionStyle.destructive, handler: nil)
        let cancelAction = UIAlertAction(title: "bye bye!", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    // 重写 prefersStatusBarHidden 隐藏状态栏方法
    override var prefersStatusBarHidden : Bool {
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

