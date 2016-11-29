
//
//  UcaiActivity.swift
//  UIActivity
//
//  Created by Liu Chuan on 16/7/30.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class WeiboActivity: UIActivity {
    
    //分享类型，在UIActivityViewController.completionHandler回调里可以用于判断，一般取当前类名
    override var activityType: UIActivityType? {
        
        return UIActivityType(rawValue: WeiboActivity.description())
    }
    
    //显示在分享框里的名称
    override var activityTitle : String? {
        return "微博"
    }
    //分享框的图片
    override var activityImage : UIImage? {
        return UIImage(named:"weibo.png")
    }
    //是否显示分享按钮，这里一般根据用户是否授权等来决定是否要隐藏分享按钮
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    //解析分享数据时调用，可以进行一定的处理
    override func prepare(withActivityItems activityItems: [Any]) {
        print("prepareWithActivityItems")
    }
    //分享时调用
    override var activityViewController : UIViewController? {
        print("activityViewController")
        return nil
    }
    //执行分享行为
    //这里根据自己的应用做相应的处理
    //例如你可以分享到另外的app例如微信分享，也可以保存数据到照片或其他地方，深圳分享到网络
    override func perform() {
        print("performActivity")
    }
    
    //按钮类型（分享按钮：在第一行，彩色，动作按钮：在第二行，黑白）
    override class var activityCategory : UIActivityCategory{
        return UIActivityCategory.share
    }
    
    //完成分享后调用
    override func activityDidFinish(_ completed: Bool) {
        print("activitydidfinish")
    }
    
}
