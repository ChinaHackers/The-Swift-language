//
//  ViewController.swift
//  UITableView_Group
//
//  Created by Liu Chuan on 2016/12/19.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data:NSDictionary!

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 加载 plist 文件
        data = NSDictionary(contentsOf: Bundle.main.url(forResource: "Property", withExtension: "plist")!)
        
        table.delegate = self
        table.dataSource = self
        
    }
    
    // MARK: - tableView Data Source
    // MARK: 设置数据的分区数, 此方法默认1组
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return data.count
    }
    
    // MARK: 设置每组数据的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (data.allValues[section] as! NSArray).count
    }

    // MARK: 具体显示的数据
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify = "SwiftCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        
        let title = cell.viewWithTag(101) as! UILabel
        
        title.text = (data.allValues[indexPath.section] as! NSArray).object(at: indexPath.row) as? String
        
        return cell
        
    }
    
    //MARK: 该方法的返回值, 决定指定分区 - 头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return data.allKeys[section] as? String
    }
    
    //MARK: 设置分组标题内容高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    /*********** Index ************/
    
    // MARK: - 返回每组标题索引
    // 返回部分的章节标题显示列表索引视图(例如“ABCD…Z #”)
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["1","2"]
        
    }
 
    
}

