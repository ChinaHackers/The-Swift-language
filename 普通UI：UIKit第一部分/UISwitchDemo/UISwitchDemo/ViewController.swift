//
//  ViewController.swift
//  UISwitchDemo
//
//  Created by Liu Chuan on 15/7/26.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var mylabel2: UILabel!
    @IBOutlet weak var mylabel1: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var WWDC16: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func backChanged(_ sender: UISwitch) {
    
        // 如果该开关已经打开
        if sender.isOn == true {
            
            // 将应用背景设为黑色
            self.view.backgroundColor = UIColor.black
            
            mylabel2.text      = "开启暗黑模式"
            mylabel2.textColor = UIColor.white
            mylabel1.textColor = UIColor.white
            myImage.image      = UIImage(named: "light")
            WWDC16.image       = UIImage(named: "wwdc16-light")

        } else {
            
            // 将应用背景设为白色
            self.view.backgroundColor = UIColor.white
            
            mylabel2.text      = "关闭暗黑模式"
            mylabel2.textColor = UIColor.black
            mylabel1.textColor = UIColor.black
            myImage.image      = UIImage(named: "dark")
            WWDC16.image       = UIImage(named: "wwdc16-dark")
        }
       
    }

  
}

