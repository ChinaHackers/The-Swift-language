//
//  ViewController.swift
//  UICollectionView
//
//  Created by Liu Chuan on 16/6/25.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

//  UICollectionViewController 本身继承了 UICollectionViewDelegate, UICollectionViewDataSource

class ViewController: UICollectionViewController {

    
    //课程名称和图片，每一门课程用字典来表示
    let courses = [
        ["name": "Swift", "pic": "swift.png"],
        ["name": "OC", "pic": "oc.jpg"],
        ["name": "java", "pic": "java.png"],
        ["name": "php", "pic": "php.jpeg"],
        ["name": "html", "pic": "html.jpeg"],
        ["name": "ruby", "pic": "ruby.png"],
        ["name": "js", "pic": "js.jpeg"]

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 已经在界面上设计了Cell并定义了identity，不需要注册CollectionViewCell
        
        //self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "DesignViewCell")
        
        self.collectionView?.backgroundColor = UIColor.whiteColor()
 
    }

    /******* 集合视图代理方法 ********/
    
    // 设置集合视图单元格数量
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return courses.count
    }
    
    // 获取单元格
    //初始化\返回集合视图的单元格 (主要)
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // storyboard里设计的单元格
        // 创建一个字符串作为单元格的重复标识符
        let identify = "DesignViewCell"
        
        // 获取设计的单元格，不需要再动态添加界面元素
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier(identify, forIndexPath: indexPath)
        
        // 从界面查找到控件元素并设置属性
        (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: courses[indexPath.item]["pic"]!)
        
        (cell.contentView.viewWithTag(2) as! UILabel).text = courses[indexPath.item]["name"]

        return cell
        
    }
    
     // 处理单元格点击事件
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("选择了\(indexPath.item)")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

