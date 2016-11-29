//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by Liu Chuan on 16/6/25.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// 遵守集合视图的: 代理\数据源协议
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //创建数组 存储集合数据的来源
    var images = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 给数组对象赋值
        images = ["lxm1.JPG" , "lxm2.JPG", "lxm3.JPG", "lxm4.JPG" , "lxm5.JPG", "lxm6.JPG", "lxm7.JPG" , "lxm8.JPG", "lxm9.JPG", "lxm10.JPG" , "lxm11.JPG", "lxm12.JPG"]
   
    }
    
    
    /******* 集合视图代理方法 ********/
    
    // MARK: - UICollectionView 代理协议
    
    // 设置集合视图单元格数量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }

    
    //初始化\返回集合视图的单元格 (主要)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 创建字符串 作为 单元格标识符. storyboard 里面设置的 重用标识符
        let identify = "reusedCell"
        
        // 从所有单元格里面,选择具有同样标识符的 空闲单元格
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identify, for: indexPath)
        
        // 通过 storyboard 里面设置的标识值, 获得单元格中的图像控件
        let imageView = cell.viewWithTag(1) as! UIImageView
        
        // 设置图像视图 默认为半透明
        imageView.layer.opacity = 0.5
        
        // 根据表格行编号, 从数组中获得对应的图像名称
        let imageName = images[(indexPath as NSIndexPath).row]
        
        // 将加载的图像,指定给图像视图
        imageView.image = UIImage(named: imageName )
        
        // 返回单元格对象
        return cell
    }
    
    
    // 处理单元格点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        // 根据单元格的编号, 获得被点击的单元格
        let cell = collectionView.cellForItem(at: indexPath)
        
        // 通过 storyboard 里面设置的标识值, 获得单元格中的图像控件
        let view = cell?.viewWithTag(1)
        
        // 设置图像视图的透明度 为 完全不透明
        view?.layer.opacity = 1.0
        
        print("点击了图片lxm\((indexPath as NSIndexPath).item+1).JPG")
        
    }
}

