//
//  ViewController.swift
//  UINavigationController
//
//  Created by Liu Chuan on 2016/12/12.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationController_Demo()

    }
    
    
    // MARK: - UINavigationController 使用
    
    fileprivate func UINavigationController_Demo() {
        
        // 设置导航控制器 UINavigationBar 颜色
        //  nav.navigationBar.barTintColor = UIColor.cyan
        
        // 设置顶部导航区的提示文字
        navigationItem.prompt = "Loading..."
        
        // 设置当前视图控制器, 在导航视图控制器中的标题
        navigationItem.title = "Girl One"

        
        //修改“返回按钮”图标
        
        let leftBarBtn = UIBarButtonItem(title: " ", style: .plain, target: self, action: #selector(backToPrevious))
        leftBarBtn.image = UIImage(named: "back")
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = -10
        navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        

        
        // 设置 UINavigationItem 返回按钮标题
        let item = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem? = item
        
        
        // 设置导航栏的背景是否透明
        navigationController?.navigationBar.isTranslucent = true
        
        // 设置导航栏的系统样式
        navigationController?.navigationBar.barStyle = UIBarStyle.default
        
        // 设置导航栏的items颜色
         navigationController?.navigationBar.tintColor = UIColor.red
        
        // 设置导航栏的背景颜色
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        // 设置右上角导航按钮的样式\功能.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "GirlsTwo", style: UIBarButtonItemStyle.plain, target: self, action: #selector(next1))
        
        // 创建第一张图片对象, 并添加图片到第一个控制器
        let images = UIImageView(frame: self.view.frame)
        images.image = UIImage(named: "14.jpg")
        
        // 设置图片显示比例
        //  UIViewContentMode.ScaleAspectFit: 保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
        images.contentMode = UIViewContentMode.scaleAspectFill
        
        view.addSubview(images)
    }
    
    
    // MARK: 第一个视图控制器跳转方法
    @objc fileprivate func next1() {
        
        // 创建第二个控制器, 并添加到导航控制器中
        let GirlsTwo = GirlsTwoViewController()

        
       // GirlsTwo.navigationItem.title = "Girl Two"
        GirlsTwo.title = "Girl Two"
        
        
        // 设置 UINavigationItem 返回按钮标题
        let item = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem? = item
        
        
        // 推入 GirlsTwo 控制器
        navigationController?.pushViewController(GirlsTwo, animated: true)
        
        
        
        // 创建第二张图片对象, 并添加图片到第二个控制器
        let images2 = UIImageView(frame: GirlsTwo.view.frame)
        images2.image = UIImage(named: "12.jpg")
        GirlsTwo.view.addSubview(images2)
        
        // 设置图片显示比例
        //  UIViewContentMode.ScaleAspectFit 保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
        images2.contentMode = UIViewContentMode.scaleAspectFill
        
        // 设置右上角导航按钮的样式\功能.
        GirlsTwo.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "GirlsThree", style: UIBarButtonItemStyle.plain, target: self, action: #selector(next2))
    }
    
    // MARK: 第二个视图控制器跳转方法
    @objc fileprivate func next2() {
        
        // 创建第三个控制器, 并添加到导航控制器中
        let GirlsThree = GirlsThreeViewController()
        
        // GirlsThree.navigationItem.title = "Girl Three"
        GirlsThree.title = "Girl Three"
       
        // 推入 GirlsThree 控制器
        navigationController?.pushViewController(GirlsThree, animated: true)
      
        // 创建第三张图片对象, 并添加图片到第二个控制器
        let images3 = UIImageView(frame: GirlsThree.view.frame)
        images3.image = UIImage(named: "11.jpg")
        
        // 设置图片显示比例
        //  UIViewContentMode.ScaleAspectFit:  保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
        images3.contentMode = UIViewContentMode.scaleAspectFill
        
        GirlsThree.view.addSubview(images3)
        
    }
    
    //返回按钮点击响应
    func backToPrevious(){
        print("点击了返回箭头!")
        
    }
    

}
