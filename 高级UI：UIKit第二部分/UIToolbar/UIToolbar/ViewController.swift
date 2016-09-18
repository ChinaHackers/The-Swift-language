//
//  ViewController.swift
//  UIToolbar
//
//  Created by Liu Chuan on 15/8/9.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnClicked(_ sender:UIBarButtonItem) {
   
        let alertView = UIAlertController(title: "提示", message: "你点击了【\(sender.title!)】按钮", preferredStyle: UIAlertControllerStyle.alert)
        
        let OKAction = UIAlertAction(title: "知道了", style: UIAlertActionStyle.default, handler: nil)
        
        alertView.addAction(OKAction)
        
        self.present(alertView, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

}

