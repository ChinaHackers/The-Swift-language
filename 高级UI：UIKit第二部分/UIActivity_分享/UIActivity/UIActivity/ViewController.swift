//
//  ViewController.swift
//  UIActivity
//
//  Created by Liu Chuan on 16/7/30.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ShareBtn(_ sender: UIButton) {
        
        //准备分享内容，文本图片链接
        let items = ["Swift实战入门", UIImage(named:"swift.png")!, URL(fileURLWithPath:"http://ucai.cn")] as [Any]
        
        //新建自定义的分享对象数组
        let acts = [WeiXinActivity(),UcaiActivity()]
        
        //根据分享内容和自定义的分享按钮调用分享视图
        let actView = UIActivityViewController(activityItems: items, applicationActivities: acts)
        
        //要排除的分享按钮，不显示在分享框里
        actView.excludedActivityTypes = [UIActivityType.mail,UIActivityType.copyToPasteboard,UIActivityType.print,UIActivityType.assignToContact,UIActivityType.saveToCameraRoll]
       
        //显示分享视图
        self.present(actView, animated:true, completion:nil)
        
        
    }

}

