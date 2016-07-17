//
//  ViewController.swift
//  UIActionSheet
//
//  Created by Liu Chuan on 16/4/1.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func show( sender: UIButton) {
        
        
        // 3.操作表的使用 ( UIActionSheet )
        
        let actionSheet = UIAlertController(title: "请选择学习语言", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelButton = UIAlertAction(title: "取消", style: UIAlertActionStyle.Destructive) { (_) in
            
            print("用户没有喜欢的语言！")
        }
        
        let OneButton = UIAlertAction(title: "Objective - C", style: UIAlertActionStyle.Default) { (_) in
            
            print("Objective-C是非常实用的语言！")
        }
        
        let TwoButton = UIAlertAction(title: "Swift", style: UIAlertActionStyle.Default) { (_) in
        
            print("Swift是一款易学易用的编程语言！")
        }
        
        let ThreeButton = UIAlertAction(title: "HTML5", style: UIAlertActionStyle.Default) { (_) in
        
            print("HTML5是万维网的核心语言！")
        }
       
        
        actionSheet.addAction(OneButton)
        actionSheet.addAction(TwoButton)
        actionSheet.addAction(ThreeButton)
        actionSheet.addAction(cancelButton)
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

