//
//  ViewController.swift
//  UIAlertViewDemo
//
//  Created by Liu Chuan on 15/7/26.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    /*
    
    在iOS 8中，UIAlertController 在功能上是和 UIAlertView 以及 UIActionSheet 相同的，UIAlertController以一种模块化替换的方式来代替这两货的功能和作用。
    是使用对话框(alert)还是使用上拉菜单(action sheet)，就取决于在创建控制器时，您是如何设置首选样式的。
    
    
    同创建UIAlertView相比，我们无需指定代理，也无需在初始化过程中指定按钮。不过要特别注意第三个参数，要确定您选择的是对话框样式还是上拉菜单样式。
    
    通过创建UIAlertAction的实例，您可以将动作按钮添加到控制器上。UIAlertAction由标题字符串、样式以及当用户选中该动作时运行的代码块组成。
     
    通过UIAlertActionStyle，您可以选择如下三种动作样式：常规(default)、取消(cancel)以及警示(destruective)。
    
    为了实现原来我们在创建UIAlertView时创建的按钮效果，我们只需创建这两个动作按钮并将它们添加到控制器上即可。
     
    //最后，我们只需显示这个对话框视图控制器即可：
    
    */
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func clicked() {
        
        // 创建UIAlertView控件， 指定标题、指定消息、指定委托对象、为底部的取消按钮设置标题
        
        let alert = UIAlertController(title:"登录", message:  "请输入用户名和密码登录系统", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) { (_) -> Void in
            
        }
        

        // 设置该警告框显示输入用户名和密码的输入框
    
        alert.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "登录"
        }
       
        alert.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "密码"
            
            //开启密码暗文
            textField.isSecureTextEntry = true
            
        }
        
        alert.addAction(okAction)
        
        
        //弹出提示框
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

