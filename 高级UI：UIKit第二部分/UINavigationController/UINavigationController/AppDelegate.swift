//
//  AppDelegate.swift
//  UINavigationController
//
//  Created by Liu Chuan on 16/6/24.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    // 创建导航控制器
    let nav = UINavigationController()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        // UINavigationController (导航控制器)
        
        // 设置导航控制器为 Window 的根控制器
        self.window?.rootViewController = nav
        
        // 设置导航控制器 UINavigationBar 颜色
        //  nav.navigationBar.barTintColor = UIColor.cyanColor()
        
        // 设置顶部导航区的提示文字
        //nav.navigationItem.prompt = "Loading..."
        
        // 设置导航栏的背景是否透明
        nav.navigationController?.navigationBar.translucent = false
        

        // 设置导航栏的系统样式
        nav.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        
        // 设置导航栏的前景颜色
        nav.navigationController?.navigationBar.tintColor = UIColor.orangeColor()
        
        
        // 创建第一个控制器, 并添加到导航控制器中
        let vc = UIViewController()
        nav.pushViewController(vc, animated: true)
        
        // 设置 UINavigationItem 的标题
        vc.navigationItem.title = "Girl One"
        
        // 设置 UINavigationItem 返回按钮标题
        // vc.navigationItem.backBarButtonItem?.title = "返回"
        // 设置第一个控制器的背景颜色
        // vc.view.backgroundColor = UIColor.blueColor()
        
        
        // 创建第一张图片对象, 并添加图片到第一个控制器
        let images = UIImageView(frame: vc.view.frame)
        images.image = UIImage(named: "14.jpg")
        vc.view.addSubview(images)
        
        // 设置图片显示比例
        //  UIViewContentMode.ScaleAspectFit 保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
        images.contentMode = UIViewContentMode.ScaleAspectFit
        
        // 设置右上角导航按钮的样式\功能.
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AppDelegate.next))
        
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
    // 添加第一个视图控制器跳转方法
    func next() {
        
        // 创建第二个控制器, 并添加到导航控制器中
        let vc2 = UIViewController()
        nav.pushViewController(vc2, animated: true)
        
        vc2.title = "Girl Two"
        
        // 设置第二个控制器的背景颜色
        //vc2.view.backgroundColor = UIColor.redColor()
        
        
        // 创建第二张图片对象, 并添加图片到第二个控制器
        let images2 = UIImageView(frame: vc2.view.frame)
        images2.image = UIImage(named: "12.jpg")
        vc2.view.addSubview(images2)
        
        // 设置图片显示比例
        //  UIViewContentMode.ScaleAspectFit 保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
        images2.contentMode = UIViewContentMode.ScaleAspectFit
       
        // 设置右上角导航按钮的样式\功能.
        vc2.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AppDelegate.next2))
    }
    // 添加第二个视图控制器跳转方法
    func next2() {
        
        // 创建第三个控制器, 并添加到导航控制器中
        let vc3 = UIViewController()
        nav.pushViewController(vc3, animated: true)
        
        vc3.title = "Girl Three"
        
        // 设置第三个控制器的背景颜色
        //vc3.view.backgroundColor = UIColor.redColor()
        
        
        // 创建第三张图片对象, 并添加图片到第二个控制器
        let images3 = UIImageView(frame: vc3.view.frame)
        images3.image = UIImage(named: "11.jpg")
        
        
        // 设置图片显示比例
        //  UIViewContentMode.ScaleAspectFit  保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。
        images3.contentMode = UIViewContentMode.ScaleAspectFit
        
        vc3.view.addSubview(images3)
 
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

