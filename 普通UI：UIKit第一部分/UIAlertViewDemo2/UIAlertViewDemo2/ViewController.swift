//
//  ViewController.swift
//  UIAlertViewDemo2
//
//  Created by Liu Chuan on 15/7/26.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个按钮, 点击按钮时,弹出警告窗口
        let btn = UIButton(type: UIButtonType.system)
        
        // 设置按钮的位置
        btn.frame = CGRect(x: 120, y: 166, width: 120, height: 30)
        
        // 设置按钮在正常状态下的标题文字
        btn.setTitle("弹出警告框", for: UIControlState())
        
        // 设置按钮字体\大小
        btn.titleLabel?.font = UIFont(name: "System", size: 15)
        
        // 给按钮绑定点击事件
        btn.addTarget(self, action: #selector(ViewController.showActionSheet), for: .touchUpInside)
        
        // 设置按钮背景色为 橙色
         btn.backgroundColor = UIColor.orange
        
        // 将按钮添加到当前视图控制器的根视图
        self.view.addSubview(btn)
  
    }

     func showActionSheet() {
        
        // 警告框 动作表(ActionSheet)
        
        // 初始化一个警告窗口,并设置窗口的标题文字和提示信息, 同时设置弹出窗口样式为: ActionSheet 动作表样式
        let alert = UIAlertController(title: "提示", message: "警告框用法真的很简单", preferredStyle: .actionSheet)
        
        // 创建一个默认样式的按钮,作为动作表的提示按钮,点击按钮,在控制台打印输出日志

        let actionOne = UIAlertAction(title: "确定", style: .default) { (UIAlertAction) in
             print("您点击了确定按钮")
        }
        //创建一个消除样式的按钮,作为动作表中的提示按钮,点击按钮,在控制台打印输出日志
        let actionTwo = UIAlertAction(title: "删除", style: .destructive) { (UIAlertAction) in
           
            print("您点击了删除按钮")
        }
        //创建一个取消样式的按钮,作为动作表中的提示按钮,点击按钮,在控制台打印输出日志
        let actionThree = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
           
            print("您点击了取消按钮")
        }
        
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
   
}

