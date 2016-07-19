//
//  ViewController.swift
//  UIPickerView
//
//  Created by LiuChuan on 15/7/26.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

// 遵守 UIPickerView 的代理\数据源协议
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 选择框（UIPickerView）
        // 选择框（UIPickerView）可以让用户以滑动的方式选择值
        // 1. 建立选择框
        pickerView = UIPickerView()
        
        // 设置 pickerView 的代理\数据源协议为 当前视图控制器类
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // 2. 调整选择框的尺寸
        // UIPickerView用 frame、center 俩个属性，设置整个选择框的大小、位置
        
        
        //设置选择框的默认值
        pickerView.selectRow(1, inComponent: 0, animated: true)
        pickerView.selectRow(2, inComponent: 1, animated: true)
        pickerView.selectRow(3, inComponent: 2, animated: true)

        self.view.addSubview(pickerView)
        
        
        // 建立一个按钮，触摸按钮时，获得选择框被选择的索引
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        button.center = self.view.center
        button.backgroundColor = UIColor.blue()
        button.setTitle("获取信息", for: UIControlState())
        button.addTarget(self, action: #selector(ViewController.getPickerViewValue), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button)

    }
    

    //: MARK: - UIPicker View DataSource
    
    // 设置选择框的列数为3
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 3
    }

    // 设置选择框的行数为9.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return 9
    }
    
    //: MARK: - UIPicker View Delegate
    // 设置选择框各选项的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return String (row) + "-" + String (component)
    }
    
    // 触摸按钮时，获得被选中的索引
    
    func getPickerViewValue() {
        
        let message = String(pickerView.selectedRow(inComponent: 0)) + "-" + String(pickerView.selectedRow(inComponent: 1)) + "-" + String(pickerView.selectedRow(inComponent: 2))
        
        
        let alertView = UIAlertController(title: "被选中的索引为", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(okAction)
        
        self.present(alertView, animated: true, completion: nil)
       
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

