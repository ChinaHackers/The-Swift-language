//
//  ViewController.swift
//  UIDatePicker_use
//
//  Created by Liu Chuan on 16/6/11.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // =========================
        // UIDatePicker (日期选择器)
        // =========================
        
        
        // 创建UIDatePicker对象
        let datePicker = UIDatePicker(frame: CGRect(x: 30, y: 60, width: 280, height: 90))
        
        // 设置UIDatePicker显示模式 为 日期和时间
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        
        
        //UIDatePicker设置显示时区格式
        
        // 根据当前时区自动设置 UIDatePicker 语言环境
        // datePicker.locale = NSLocale.autoupdatingCurrentLocale()
        
        //将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = NSLocale(localeIdentifier: "zh_CN")
        
        self.view.addSubview(datePicker)
        
        // 监听方法
        datePicker.addTarget(self, action: #selector(ViewController.dateChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    //日期选择器响应方法
    func dateChanged(datePicker : UIDatePicker){
        
        //更新提醒时间文本框
        let formatter = NSDateFormatter()
        
        //日期样式
        // 为日期格式器设置格式字符串
        formatter.dateFormat = "当前时间:yyyy年MM月dd日 HH:mm:ss"
        
        print(formatter.stringFromDate(datePicker.date))
    }
  

   
}

