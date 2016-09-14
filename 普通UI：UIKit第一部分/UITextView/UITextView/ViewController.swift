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
        
        let textView = UITextView(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
        
        textView.layer.borderWidth = 1
        
        textView.layer.borderColor = UIColor.gray.cgColor
        
        textView.text="第一行\n第二行\n第三行\n第四行\n第五行"
        
        textView.isEditable = false
        
        textView.dataDetectorTypes = UIDataDetectorTypes.all
        
        textView.scrollRangeToVisible(NSMakeRange(0, 50))
        
        self.view.addSubview(textView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

