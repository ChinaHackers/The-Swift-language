//
//  ViewController.swift
//  UITableView_storyboard
//
//  Created by Liu Chuan on 16/6/27.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var month = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // 创建一个数组, 作为表格数据的来源
        month = ["一月：January", "二月：February", "三月：March", "四月：April",
                     "五月：May", "六月：June", "七月：July", "八月：August" ,"九月：September",
                     "十月：October", "十一月：November" ,"十二月：December"]
        
    }

    // MARK: - 设置表格的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return month.count
    }
    
    // 初始化\ 返回表格视图的单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "cell"

        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath as IndexPath)
        
        // 通过在 storyboard 中给标签设置的 tag 值获得标签控件
        let label = cell.viewWithTag(1) as! UILabel
        
        // 通过表格行的编号, 从数组中获得对应的字符串, 设置标签的文本内容
        label.text = month[indexPath.row]
        
        return cell
    }

}

