//
//  ViewController.swift
//  UISwitch
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var uiswitch:UISwitch!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        // 开关控件（UISwitch）
        
        // 创建UISwitch
        uiswitch = UISwitch()
        
        // 初始化uiswitch的时候，指定frame参数。
        // uiswitch = UISwitch(frame: CGRectMake(100, 50, 1000, 1000))
        
        //设置位置
        // uiswitch 位于当前视图的中心点
        uiswitch.center = self.view.center
        
        //设置默认值  开关on属性是开关的值，为true表示打开，为false表示关闭
//        uiswitch.on = true
        // 设置开关默认状态 被选中
        uiswitch.setOn(true, animated: true)
        
        // 给开关对象添加点击事件.
        uiswitch.addTarget(self, action: #selector(ViewController.switchDidChange), forControlEvents: UIControlEvents.ValueChanged)
        
        // 将开关对象,添加到当前视图控制器的根视图
        self.view.addSubview(uiswitch)
    
    }
    
    func switchDidChange() {
        
        var message = "打开 switch"
        
        // 获取开关对象的状态, 根据状态,设置不同的文字内容
        if !uiswitch.on {
            message = "关闭 switch"
        }
        
        // 创建一个信息提示窗口,并设置其显示的内容
        let  alert = UIAlertController(title: "信息", message:  message, preferredStyle: UIAlertControllerStyle.Alert)
        
        // 创建一个按钮,作为提示窗口中的 ( 确定 ) 按钮. 当点击该按钮时, 将关闭提示窗口
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        // 将 OK 按钮 ,添加到提示窗口中
        alert.addAction(action)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
      
        print(uiswitch.on)
    }

  
}

