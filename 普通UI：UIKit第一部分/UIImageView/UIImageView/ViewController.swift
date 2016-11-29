//
//  ViewController.swift
//  UIImageView
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 图像控件（UIImageView）
        
        
/*
 UIImageView的contentMode 属性 :
         UIViewContentModeScaleToFill     会导致图片变形。根据视图的比例去拉伸图片内容。
         UIViewContentModeScaleAspectFit  保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
         UIViewContentModeScaleAspectFill 保证图片比例不变，但是会填充整个ImageView，可能只有部分图片显示出来。
         UIViewContentModeCenter          保持图片原比例在视图中间显示图片内容

*/
        
        // 1.图片的显示
        //定义图片名数组
        let imageArray:[UIImage]! = [UIImage(named: "IMG_1691.JPG")!,
                                     UIImage(named: "IMG_2044.JPG")!,
                                     UIImage(named: "IMG_2215.JPG")!,
                                     UIImage(named: "IMG_4144.JPG")!,
                                     UIImage(named: "IMG_7863.JPG")!,
                                     UIImage(named: "IMG_7866.JPG")!,
                                     UIImage(named: "IMG_7869.JPG")!,]
        
        // 设置动画图片
        // 设置image控件需要动画显示的图片为images集合元素
        image.animationImages = imageArray
        
        // 设置动画持续时间，秒为单位
        image.animationDuration = 18
        
        // 设置动画播放次数(0 为无限播放)
        image.animationRepeatCount = 0
        
        // 开始播放动画
        image.startAnimating()
        
       
    }
 
}

