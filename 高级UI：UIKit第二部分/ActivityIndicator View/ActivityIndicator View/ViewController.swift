//
//  ViewController.swift
//  ActivityIndicator View
//
//  Created by Liu Chuan on 10/31/15.
//  Copyright © 2015 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    @IBAction func start() {
        // 开启动画
        loading.startAnimating()
        
    }
    @IBAction func stop() {
        
//      创建UIAlertView控件， 指定标题、指定消息、指定委托对象、为底部的取消按钮设置标题
        let alertView = UIAlertController(title: "警告", message:  "正在下载，你确定要取消下载吗？", preferredStyle: UIAlertControllerStyle.alert)
     
        alertView.addAction(UIAlertAction(title: "是", style: UIAlertActionStyle.default, handler: nil))
        alertView.addAction(UIAlertAction(title: "否", style: UIAlertActionStyle.cancel, handler: nil))
        
//      显示UIAlertView
        self.present(alertView, animated: true, completion: nil)
        
        // 停止动画
        loading.stopAnimating()
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

