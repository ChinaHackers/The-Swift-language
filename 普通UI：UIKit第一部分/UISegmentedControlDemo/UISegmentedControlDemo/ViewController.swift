//
//  ViewController.swift
//  UISegmentedControlDemo
//
//  Created by Liu Chuan on 16/7/8.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 选择控件（UISegmentedControl）
        
        // 选择控件的创建
        //var items = ["选项一", "选项二", UIImage(named: "xin")]
        //items.append(UIImage(named:"xin")!)
        
        
        let items=["选项一","选项二", "选项三"]
        
        // 设置传递参数 items 为 初始化的选项列表
        let segmented = UISegmentedControl(items:items)
  
        
        // 设置 segmented 的位置
        segmented.center = self.view.center
        
        // 设置默认选中第二个选项, 从0开始
        segmented.selectedSegmentIndex = 0
        
        //设置控件统一颜色为 红色
        segmented.tintColor = UIColor.red
        
        // 选择控件基本设置
        
        // 用setTitle方法修改选项的文字.
        // 这里修改索引为1的选项，将文字修改为 Swift
        segmented.setTitle("Swfit", forSegmentAt:1)
        
        // setImage 方法修改选项中的图片
        // segmented.setImage(UIImage(named:"icon"),forSegmentAtIndex:2)
        
        
        // setContentOffset：设置选项内容的偏移距离
        
        // 设置索引为1的选项，让内容在X轴上偏移3，Y轴上偏移2
        segmented.setContentOffset(CGSize(width: 3,height: 2),forSegmentAt:1)
        
        
        
         // 选择控件选项的插入、删除
         
         // insertSegmentWithTitle：方法 可以插入一个文字选项
         //insertSegmentWithTitle 第一个参数是新增的文字，第二个参数atIndex 为新增选项的索引，为1表示插入为第二个选项，animated 参数设置插入时是否显示动画效果
         segmented.insertSegment(withTitle: "新增选项", at:1,animated:true)
         
         // insertSegmentWithImage ： 插入图片选项
//         segmented.insertSegmentWithImage(UIImage(named:"icon")!,atIndex:1,animated: true)
        
         
         // removeSegmentAtIndex 删除选项
         
         // 删除索引为1的选项，需要动画效果
         segmented.removeSegment(at: 1,animated:true);
        
        
        // 监听ValueChanged 事件
        segmented.addTarget(self, action: #selector(ViewController.segmentDidchange(_:)), for: UIControlEvents.valueChanged)
        
        
        self.view.addSubview(segmented)
        
        
        let textField = UITextField(frame: CGRect(x: 20, y: 40, width: 80, height: 30))
        textField.tintColor = UIColor.black
        
        let btn = UIButton(frame: CGRect(x: 130, y: 40, width: 40, height: 20))
        btn.backgroundColor = UIColor.purple
        btn.setTitle("添加", for: UIControlState())
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(textField)
        

    }
    
    
    
    func segmentDidchange(_ segmented:UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        //获得选择的文字
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex)!)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

