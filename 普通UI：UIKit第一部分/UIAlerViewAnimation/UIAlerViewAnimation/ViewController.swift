//
//  ViewController.swift
//  UIAlerViewAnimation
//
//  Created by Liu Chuan on 16/4/14.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func alert(sender: UIButton) {
        
    
        LCAlert().showAlert("警告框", subTitle: "这是一个动画警告框", buttonTitle: "取消", otherButtonTitle: "确认") { (OtherButton) in
            
            print("你点击了确认")
        }
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

