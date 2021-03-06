//
//  ViewController.swift
//  UISearchBarDemo
//
//  Created by Liu Chuan on 16/6/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

/*
 通常 UIsearchBar 搜索框 经常和 UItableView 结合使用, 当 UItableView 包含内容较多时,
 可用搜索框对 UItableView 中的数据进行搜索.
 
 */

// 使用视图控制器对象作为 UItableView 控件的 dateSource 和 delegate 对象, 控制器需要作为搜索框的委托对象,
// 因此该控制器要遵守 UITableViewDataSource \ UITableViewDelegate 协议. 和 UISearchBarDelegate 协议

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    // 通过 storyboard 创建控件
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    
    // 定义一个数组,用来保存表格原始显示的数据
    var language = ["Swift入门实战", "iOS开发进阶","Swift 精讲第2季","玩转 Swift第2季","轻量级Java EE企业应用实战", "疯狂Android讲义", "疯狂iOS讲义", "疯狂Java讲义"]
    
    // 保存搜索结果数据
    var searchData = [String]()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // 加载全部内容
        searchData = language
        
        // 注册 TableViewCell
        table.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        
        
    }
    
    
    
    // MARK: - 返回表格行数 ,返回的就是 language 存储的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return searchData.count
        
    }
    
    // MARK: - 每组显示的内容 (创建参数indexPath指定的单元)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify = "SwiftCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        cell.textLabel?.text = self.searchData[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    // MARK: - UISearchBarDelegate 搜索代理方法. 
    //每次改变搜搜内容时调用
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // 没有搜索时,显示全部内容
        if searchText == "" {
            self.searchData = self.language
            
        } else {
            
            self.searchData = []
            
            for lang in self.language {
                
                if lang.lowercased().hasPrefix(searchText) {
                    
                    self.searchData.append(lang)
                }
            }

        }
        
        // 刷新 TableView 显示
        table.reloadData()
        
    }
    
    // touchesBegan: 点击屏幕时,触发该方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 设置 searchBar 不再是第一响应
        searchBar.resignFirstResponder()
    }
}

