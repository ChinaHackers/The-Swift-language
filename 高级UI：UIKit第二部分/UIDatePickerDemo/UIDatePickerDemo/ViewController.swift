//
//  ViewController.swift
//  UIDatePickerDemo
//
//  Created by Liu Chuan on 15/8/3.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

// =================
// MARK: 倒计时实例
// =================
class ViewController: UIViewController {
    

    var ctimer: UIDatePicker!
    var btnStart: UIButton!
    
    var leftTime = 180
    var alertView: UIAlertController!
    var timer: Timer!
    var stopBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        
        // 创建一个 UIDatePicker 对象,并设置尺寸\位置
        ctimer = UIDatePicker(frame: CGRect(x: 0.0, y: 120.0, width: 200.0, height: 200.0))
        
        // 设置 UIDatePicker 的模式为 倒计时
        self.ctimer.datePickerMode = UIDatePickerMode.countDownTimer
        
        // 必须为 60 的整数倍，比如设置为100，值自动变为 60
        self.ctimer.countDownDuration = TimeInterval(leftTime)

        // 添加事件 ,控制台打印倒计时数
        ctimer.addTarget(self, action: #selector(ViewController.timerChanged), for: UIControlEvents.valueChanged)
        
        self.view.addSubview(ctimer)
        
        // 开始按钮的类型\尺寸
        btnStart = UIButton(type: UIButtonType.system)
        btnStart.frame = CGRect(x: 80, y: 400, width: 90, height: 30)
        
        // 设置按钮的背景颜色
        btnStart.backgroundColor = UIColor(red:0.30, green:0.76, blue:0.65, alpha:1.00)
       
        // 设置按钮的不同状态下的文字 \ 文字颜色
        btnStart.setTitleColor(UIColor.red, for: UIControlState())         // 按钮默认状态-红色
        btnStart.setTitleColor(UIColor.orange, for: UIControlState.disabled)    // 按钮警告状态-橙色
        btnStart.setTitle("开始", for: UIControlState())                           // 设置默认状态下文字
        btnStart.setTitle("倒计时中", for: UIControlState.disabled)                      // 设置警告状态下的文字
        
        btnStart.clipsToBounds = false
        btnStart.layer.cornerRadius = 5  // 设置按钮的圆角半径
        
        // 添加点击事件
        btnStart.addTarget(self, action: #selector(ViewController.startCliked(_:)), for: UIControlEvents.touchUpInside)
       
        self.view.addSubview(btnStart)
        
        
    }
    
    func timerChanged() {
        
        print("倒计时: \(self.ctimer.countDownDuration)")
    }
    
    // 开始按钮的方法
    func startCliked(_ sender: UIButton) {
        
        // 不开启
        self.btnStart.isEnabled = false
        
        // 获取该倒计时器的剩余时间
        leftTime = Int(self.ctimer.countDownDuration)
        
       
        // 禁用UIDatePicker 控件、按钮
        self.ctimer.isEnabled = false
        
        // 初始化一个字符串
        let message = NSString(format: "倒计时开始，还有 %d 秒", leftTime)
        
        // 创建一个 UIAlertView 对象（警告框），并确认，倒计时开始
        alertView = UIAlertController(title: "倒计时开始", message:  message as String, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil)
        
        alertView?.addAction(okAction)
        
        // 显示 UIAlertController
        self.present(alertView!, animated: true, completion: nil)
        

        // 启用计时器，控制每秒执行一次 tickDown 方法
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(1), target: self, selector: #selector(ViewController.tickDown), userInfo: nil, repeats: true)
        
    }
    
    
    // 停止按钮
    func stopCliked()  {
        
        
        var stopBtn = UIButton(frame: CGRect(x: 110, y: 400, width: 90, height: 30))
        
        stopBtn = UIButton(type: .system)
        
        stopBtn.setTitle("停止", for: UIControlState())
        
        stopBtn.setTitleColor(UIColor.purple, for: UIControlState())
        
        self.view.addSubview(stopBtn)
  
        
        
    }
    
    
    func tickDown() {
        let message =  NSString(format:"倒计时开始，还有 %d 秒...", leftTime)
        alertView!.message = message as String
        
        // 将剩余时间减少1秒
        leftTime -= 1;
        
        // 修改UIDatePicker的剩余时间
        self.ctimer.countDownDuration = TimeInterval(leftTime);
        print(leftTime)
        
        // 如果剩余时间小于等于0
        if(leftTime <= 0) {
            // 取消定时器
            timer.invalidate();
            // 启用UIDatePicker控件和按钮
            self.ctimer.isEnabled = true;
            self.btnStart.isEnabled = true;
            alertView!.message = "时间到！"
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

