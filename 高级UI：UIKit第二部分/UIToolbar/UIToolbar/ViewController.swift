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

    @IBAction func btnClicked(sender:UIBarButtonItem) {
   
        let alertView = UIAlertController(title: "提示", message: "你点击了【\(sender.title!)】按钮", preferredStyle: UIAlertControllerStyle.Alert)
        
        let OKAction = UIAlertAction(title: "知道了", style: UIAlertActionStyle.Default, handler: nil)
        
        alertView.addAction(OKAction)
        
        self.presentViewController(alertView, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

}

