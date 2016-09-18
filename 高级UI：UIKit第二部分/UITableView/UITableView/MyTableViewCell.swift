//
//  MyTableViewCell.swift
//  UITableView
//
//  Created by Liu Chuan on 16/6/26.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// ====================
// MARK: - 自定义单元格类
// ====================

//表格数据实体类
class ListItem: NSObject {
    
    var text: String
    init(text: String) {
        self.text = text
    }
}

// 单元格类
class MyTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    // 单元格内部标签 (可输入)
    let label: UITextField
    
    // 单元格左边距
    var leftMargin: CGFloat = 15.0
    
    // 单元格数据
    
    var listItem: ListItem? {
        
        didSet {
            // 设置 text 显示的文本
            label.text = listItem!.text
        }
        
    }
 
    
    // 单元格是否可编辑
    var labelEditable: Bool? {
        
        didSet {
          //  label.userInteractionEnabled = true
            
            label.isUserInteractionEnabled = labelEditable!
            
            // 如果可以编辑的话, 加大左边距 (因为左边有个删除按钮)
            leftMargin = labelEditable! ? 45.0 : 15.0
            
            self.setNeedsLayout()

        }
    }
    
    // 初始化
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        
        // 初始化文本标签
        label = UITextField(frame: CGRect.null)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 设置文本标签代理
        label.delegate = self
        
        // 标签文本垂直对齐方式: 垂直居中
        label.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        // 添加文本标签
        addSubview(label)
    }
    
    
    // 布局
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        label.frame = CGRect(x: leftMargin, y: 0, width: bounds.size.width - leftMargin, height: bounds.size.height)
      
    }

    // 键盘回车
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return false
    }
    
    // 结束编辑
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if listItem != nil {
            
            listItem?.text = textField.text!
        }
        return true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

}








