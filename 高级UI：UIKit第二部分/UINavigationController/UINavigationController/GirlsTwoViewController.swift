//
//  GirlsTwoViewController.swift
//  UINavigationController
//
//  Created by Liu Chuan on 2016/12/9.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// MARK: - 美女控制器二
class GirlsTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)


        // 设置 UINavigationItem 返回按钮标题
        navigationItem.backBarButtonItem? = backBtn

   
    }

}
