//
//  ViewController.swift
//  UIStepper
//
//  Created by Liu Chuan on 15/8/1.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var stepper:UIStepper!
    
    var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 微调器（UIStepper）
        
        // 1.微调器的基本设置
        
        stepper = UIStepper()
    
    
        stepper.center = self.view.center

        //设置stepper的范围与初始值
        
        //属性 maximumValue：设置最大值
        stepper.maximumValue = 10
        
        //属性 minimumValue：设置最小值
        stepper.minimumValue = 0
        
        stepper.value = 5
        
        //设置每次增加减小的值
        stepper.stepValue = 1
        
        // continuous属性为true，表示可以按住不放来连续更改值
        stepper.isContinuous = true
        
        // wraps属性设置stepper是否循环（当到最大值时，再点击加号来增加数值，将又从最小值开始）
        stepper.wraps = true
        
        // 监听 UIControlEvents.ValueChanged 事件来获取数值的变化
        stepper.addTarget(self,action:#selector(ViewController.stepperValueIschanged),for: UIControlEvents.valueChanged)
        
        self.view.addSubview(stepper)
        
        label = UILabel(frame:CGRect(x: 100,y: 190,width: 300,height: 30))
        
        print(stepper.value)

        label.text = "当前值为：\(stepper.value)"
        
        self.view.addSubview(label)
        
        
        
        // 2.微调器的外观设置
        
/*
        微调器的外观可以灵活的设置，可以调用tintColor 属性设置微调器的颜色
        也可以将 （+）加号、（-）减号 设置为图片，方法如下：
        
        func setBackgroundImage(image: UIImage!, forState state: UIControlState)  设置背景图片

        func setIncrementImage(image: UIImage!, forState state: UIControlState)   设置加号图标
        
        func setDecrementImage(image: UIImage!, forState state: UIControlState)   设置减号图标
        
        // 设置 减号、加号之间的分割线图标
        func setDividerImage(image: UIImage!, forLeftSegmentState leftSate:UIControlState, rightSegmentState rightState: UIControlState)
        
*/
        
        
    }
    
    
        func stepperValueIschanged() {
            
            label.text="当前值为：\(stepper.value)"
        }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

