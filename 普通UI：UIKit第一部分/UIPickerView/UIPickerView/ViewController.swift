//
//  ViewController.swift
//  UIPickerView
//
//  Created by LiuChuan on 15/7/26.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 选择框（UIPickerView）
        // 选择框（UIPickerView）可以让用户以滑动的方式选择值
// 1. 建立选择框
        
        pickerView = UIPickerView()
        
        // 将 dataSource 设置成自己
        pickerView.dataSource = self
        
        // 将 delegate 设置成自己
        pickerView.delegate = self
        
        //设置选择框的默认值
        pickerView.selectRow(1, inComponent: 0, animated: true)
        pickerView.selectRow(2, inComponent: 1, animated: true)
        pickerView.selectRow(3, inComponent: 2, animated: true)

        self.view.addSubview(pickerView)
        
        
        // 建立一个按钮，触摸按钮时，获得选择框被选择的索引
        let button = UIButton(frame: CGRectMake(0, 0, 100, 30))
        button.center = self.view.center
        button.backgroundColor = UIColor.blueColor()
        button.setTitle("获取信息", forState: .Normal)
        button.addTarget(self, action: "getPickerViewValue", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)

    }
    

    // 设置选择框的列数为3，继承于UIPickerViewDataSource 协议
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {

        return 3
    }

    
    // 设置选择框的行数为9.继承于UIPickerViewDataSource 协议
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 9
    }
    
    // 设置选择框各选项的内容，继承于UIPickerViewDelegate 协议
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return String (row) + "-" + String (component)
    }
    
    // 触摸按钮时，获得被选中的索引
    
    func getPickerViewValue() {
        
        let alertView = UIAlertView()
        alertView.title = "被选中的索引为"
        
        alertView.message = String(pickerView.selectedRowInComponent(0)) + "-" + String(pickerView.selectedRowInComponent(1)) + "-" + String(pickerView.selectedRowInComponent(2))
        
        alertView.addButtonWithTitle("OK")
        
        alertView.show()
        
        
    }
    
//    2. 调整选择框的尺寸
//    UIPickerView用 frame、center 俩个属性，设置整个选择框的大小、位置
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

