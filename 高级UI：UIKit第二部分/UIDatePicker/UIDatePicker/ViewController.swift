//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Liu Chuan on 15/8/2.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btnShow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 日期选择器（UIDatePicker）
        
        // 1.UIDatePicker 控件介绍 用于选择日期\时间
        //用于测试 UIDatePicker 的属性取值
        print(datePicker.locale!.localeIdentifier)
        print(datePicker.calendar.calendarIdentifier)
        
        let date = datePicker.date
        print(date.descriptionWithLocale(datePicker.locale))
        
    }

    @IBAction func showClicked(sender: UIButton) {
        
        let date = datePicker.date
        
        // 创建一个日期格式器
        let dformatter = NSDateFormatter()
        
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"

        // 使用日期格式器，格式化日期、时间
        let datestr = dformatter.stringFromDate(date)
        let message = "您选择的日期和时间是: \(datestr)"
        
        // 创建一个UIAlertController对象（警告框），并通过该警告框显示用户选择的日期、时间
        
        let alertView = UIAlertController(title: "当前日期和时间", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let OKAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertView.addAction(OKAction)
        
        self.presentViewController(alertView, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var searchBar: UISearchBar!
    
 
}
