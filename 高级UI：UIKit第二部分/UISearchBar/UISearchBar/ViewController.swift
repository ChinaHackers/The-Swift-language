//
//  ViewController.swift
//  UISearchBar
//
//  Created by Liu Chuan on 16/6/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit


/*
 @IBOutlet weak var searchBar: UISearchBar!
 
 UISearchBar 控件 的不同部分会触发不同的事件, 这些事件由 UISearchBar 的委托对象处理.
 UISearchBar 的委托对象必须实现 UISearchBarDelegate 协议
 */
// 遵守 UISearchBarDelegate 使用 代理方法
class ViewController: UIViewController, UISearchBarDelegate {
    
    // 创建 UIsearchBar
    let searchBar = UISearchBar(frame: CGRect(x: 10, y: 100, width: 290, height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        UISearchBar_Demo()
        
        
    }
    
    // MARK: - UISearchBar 搜索框
    fileprivate func UISearchBar_Demo() {
        
        // 设置搜索框内默认文本
        // searchBar.text = "疯狂 iOS 讲义"
        
        // 设置搜索框的提示文本
        searchBar.placeholder = "请输入关键字"
        
        // 设置搜索框上方的文本标题
        searchBar.prompt = "Swift"
        
        // 设置搜索框的风格
        
        /*
         UIBarStyle.BlackOpaque
         UIBarStyle.Default
         UIBarStyle.Black
         */
        searchBar.barStyle = UIBarStyle.default
        
        // 设置搜索条渲染的颜色
        searchBar.tintColor = UIColor.blue
        
        // 设置搜索框背景颜色
        searchBar.barTintColor = UIColor.red
        
        // 设置搜索框是否显示查询按钮: 搜索框右边显示一个圆形向下的按钮，单击会发送特殊事件.
        //searchBar.showsSearchResultsButton = true
        
        // 设置搜索框是否显示书签按钮: 搜索框右边会显示一个书本的按钮，单击会发送特殊事件。
        searchBar.showsBookmarkButton = true
        
        // 设置搜索框是否显示取消按钮: 搜索框右边会出现一个“Cancel”按钮，单击会发送特殊事件。
        searchBar.showsCancelButton = true
        
        //修改搜索条（UISearchBar）中取消按钮的文字、颜色
        
        // 先获取到 searchBar 中的取消按钮，再设置这个按钮的 title 即可
        let Button = searchBar.value(forKey: "cancelButton") as! UIButton
        Button.setTitle("搜索", for: UIControlState())
        
        // showsScopeBar: 系统将会在搜索框下方显示分段条控制器
        searchBar.showsScopeBar = true
        
        // scopeButtonTitles: 设置分段控制器标题文字
        searchBar.scopeButtonTitles = ["IOS", "Swift", "Java", "Android"]
        
        // 设置代理
        searchBar.delegate = self
        
        view.addSubview(searchBar)
        

        
    }
    
    // MARK: - touchesBegan: 点击屏幕时,触发该方法
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 设置 searchBar 不再是第一响应
        searchBar.resignFirstResponder()
  
    }
    
    // MARK: - selectedScopeButtonIndexDidChange: 当用户点击分段条上的分段按钮, 触发该方法
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        print(selectedScope)
        
    }
    
    // MARK: - textDidChange: 当搜索框内文本发生改变时,触发该方法
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText)
    }
    
    // MARK: - shouldChangeTextInRange: 监测用户输入的文字
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        print(text)
        
        return true
    }
    
    // MARK: - searchBarBookmarkButtonClicked: 当用户点击搜索框上的查询(书签)按钮时,触发该方法
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
        print("点击了书签按钮!!!")
    }
    
    
    // searchBarSearchButtonClicked: 点击搜索框右边显示一个圆形向下的按钮,触发该方法
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        
    }
    
    
    // MARK: - 搜索框的文本结束编辑时调用
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
         
    }
    
    // MARK: - searchBarShouldBeginEditing: 当点击搜索框进行编辑时,触发该方法
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        // false: searchBar 成为第一响应者  true: searchBar 不成为第一响应者
        return true
    }
    
    
    // MARK: - searchBarShouldEndEditing: 当点击搜索框结束编辑时,触发该方法
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        
        // false: searchBar 结束第一响应者 true: searchBar 不会结束第一响应者
        return true
    }

}

