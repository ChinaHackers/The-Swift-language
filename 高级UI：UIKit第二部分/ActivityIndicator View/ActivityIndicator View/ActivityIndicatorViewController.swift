//
//  ActivityIndicatorViewController.swift
//  ActivityIndicator View
//
//  Created by Liu Chuan on 2016/12/5.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ActivityIndicatorViewController: UITableViewController {
    
    // MARK: - 属性
    
    @IBOutlet weak var grayStyleActivityIndicatorView: UIActivityIndicatorView!
   
    @IBOutlet weak var tintedActivityIndicatorView: UIActivityIndicatorView!

    var applicationPurpleColor = UIColor(red: 0.659, green: 0.271, blue: 0.988, alpha: 1)
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        Setup_TintedActivityIndicatorView()
        Setup_GrayStyleActivityIndicatorView()
    }
    
    
    // MARK: - 配置
    fileprivate func Setup_GrayStyleActivityIndicatorView() {
        
        grayStyleActivityIndicatorView.activityIndicatorViewStyle = .gray
        
        grayStyleActivityIndicatorView.startAnimating()
        //当停止动画的时候，是否隐藏。默认为TRUE
        grayStyleActivityIndicatorView.hidesWhenStopped = true
    }
    
    fileprivate func Setup_TintedActivityIndicatorView() {
        
        tintedActivityIndicatorView.activityIndicatorViewStyle = .gray
        
        tintedActivityIndicatorView.color = applicationPurpleColor
        
        tintedActivityIndicatorView.startAnimating()
        
    }
}
