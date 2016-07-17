//
//  ThreeViewController.swift
//  UIScrollViewDemo3
//
//  Created by Liu Chuan on 16/6/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit
// 第三页
class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置当前视图控制器的背景图片
        let images = UIImageView(frame: self.view.frame)
        
        images.image = UIImage(named: "13.jpg")
        
        self.view.addSubview(images)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
