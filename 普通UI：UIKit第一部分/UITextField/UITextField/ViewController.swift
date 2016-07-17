//
//  ViewController.swift
//  UITextField
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright (c) 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //文本框（UITextField）
        
        //1.文本框的创建
        let textField = UITextField(frame: CGRectMake(10, 160, 200, 30))
        
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextBorderStyle.RoundedRect
/*
        borderStyle 属性值可以为：
        
        UITextBorderStyle.None          无边框
        UITextBorderStyle.Line          直线边框
        UITextBorderStyle.RoundedRect   圆角矩形边框
        UITextBorderStyle.Bezel         边线+阴影
*/
        
        // 2.设置文本样式
        
        // 给文本框设置提示文字
        textField.placeholder = "请输入用户名"
        
        // 设置文本框的默认值
        textField.text = "Swift prammming"
        
        //文字的自动调整
/*
        默认情况下，当文字超出文本框的宽度，会被隐藏一部分，如果不想文字被隐藏，希望全部显示出来，
        可以通过设置 adjustsFontSizeToFitWidth 属性来实现
*/
        textField.adjustsFontSizeToFitWidth = true
        
        // 设置 minimumFontSize 属性指定最小可缩小的字号
        textField.minimumFontSize = 12

        
        //对齐方式的设置
        /*
        可以用textAlignment 属性设置文字的对齐方式。
        
        属性值可以为：水平对齐
        
        textField.textAlignment = NStextAlignment.Left ->左对齐
        textField.textAlignment = NStextAlignment.Center ->居中对齐
        textField.textAlignment = NSTextAlignment.Right ->右对齐
       */
         textField.textAlignment = NSTextAlignment.Left
        
        /*
        //垂直对齐：contentVerticalAlignment
        
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Top  向上对齐
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Bottom  向下对齐
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center  垂直居中对齐
        
        */
 
        // 因为contentVerticalAlignment 是个结构体，所以可以省略。符号前面有个空格
        textField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
   
        // 3.键盘设置
        // 设置文本框的 returnKeyType 属性来设置return 的样式
        
        /*
         UIReturnKeyType.Done       : // 此时键盘的return 键盘为 Done 样式，暗示用户，点击return键后，完成输入
         UIReturnKeyType.Go         : // 此时键盘的return 键盘为 Go 样式，暗示用户，点击return键后完成输入，并跳转到另一页.
         UIReturnKeyType.Search     : // 此时键盘的return 键盘为Search 样式，暗示用户，点击return键后，用刚才输入的文字作为关键字进行搜索
         UIReturnKeyType.Join       : // 此时键盘的return 键盘为Join 样式，暗示用户，点击return键后，会注册用户或添加数据的操作
         UIReturnKeyType.Next       : // 此时键盘的return 键盘为Next 样式，暗示用户，点击return键后，会进行下一步
         UIReturnKeyType.Send       : // 此时键盘的return 键盘为Search 样式，暗示用户，点击return键后，会发送数据
         
         */
        
         // 此时键盘的return 键盘为 Done 样式，暗示用户，点击return键后，完成输入
        textField.returnKeyType = UIReturnKeyType.Done
        
            
        // 4.清除按钮
        
        // 属性 clearButtonMode 可以设置清除按钮（输入框上的小x）
        
        // UITextFieldViewMode.WhileEditing     : 表示编辑时出现清除按钮
        //  UITextFieldViewMode.UnlessEditing   : 编辑时，不出现清除按钮，完成编辑后才出现清除按钮
        // UITextFieldViewMode.Always           : 一直都显示清除按钮
        
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        
        
        // 5.背景设置
        // textField.background = UIImage(named:"background")
        
        // 设置 texeField 的光标颜色
        textField.tintColor = UIColor.orangeColor()
        
        
        textField.delegate = self
        
        self.view.addSubview(textField)
        
    }
    
    func textFieldShouldReturn(textField:UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        
        //打印出文本框中的值
        print(textField.text!)
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

