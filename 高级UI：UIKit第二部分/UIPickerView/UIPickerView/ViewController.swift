//
//  ViewController.swift
//  UIPickerView
//
//  Created by Liu Chuan on 16/6/13.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{

    
    var citys = ["北京", "上海", "广州", "重庆"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView(frame: CGRect(x: 30, y: 50, width: 300, height: 300))
        
        pickerView.showsSelectionIndicator = true
        
        // 设置数据源\代理
        pickerView.dataSource = self
        pickerView.delegate  = self
        
        let label = UILabel(frame: CGRect(x: 30, y: 70, width: 30, height: 30))
      
        self.view.addSubview(pickerView)
        self.view.addSubview(label)
        
      
        
        
    }
    // 实现dataSource方法
    // 实现delegate方法

    // UIPickerViewDataSource
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return citys.count
    }
    
    
    // 显示多少列
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return citys.count
        
    }
    
    
    // 标题
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return citys[row]
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

