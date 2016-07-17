//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()    }
    
      /******  根据UISegmentedControl被选中的索引,变换背景颜色 ******/
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        // 根据UISegmentedControl被选中的索引
        switch (sender.selectedSegmentIndex) {
        case 0:
            // 将应用背景设为红色
            self.view.backgroundColor = UIColor.redColor()
            break
        case 1:
            // 将应用背景设为绿色
            self.view.backgroundColor = UIColor.greenColor()
            break
        case 2:
            // 将应用背景设为橙色
            self.view.backgroundColor = UIColor.orangeColor()
            break
        case 3:
            // 将应用背景设为紫色
            self.view.backgroundColor = UIColor.purpleColor()
            break
        default:
            print("---------")
        }
        
    }

 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

