//
//  ViewController.swift
//  UITextView
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright (c) 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        // 多行文本控件
        
        // 1.创建多行文本控件
        
        let textView = UITextView(frame: CGRectMake(10, 100, 200, 100))
        
        textView.layer.borderWidth = 1
        
        textView.layer.borderColor = UIColor.grayColor().CGColor
        
        textView.text="第一行\n第二行\n第三行\n第四行\n第五行"
        
        textView.editable = false
        
        textView.dataDetectorTypes = UIDataDetectorTypes.All
        
        textView.scrollRangeToVisible(NSMakeRange(0, 50))
        
        self.view.addSubview(textView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

