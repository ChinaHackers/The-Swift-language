//
//  ViewController.swift
//  UITableView_Plist
//
//  Created by Liu Chuan on 16/6/29.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    // 控件名称
    var Controller_Names:[String]?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        //读取plist文件路径, 将plist内容放到 Array 中
        Controller_Names = NSArray(contentsOfFile: Bundle.main.path(forResource: "Property", ofType: "plist")!) as? Array
        
        //注册重用的单元格
        table!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        
        // iOS7以后, 导航控制器中ScrollView顶部会添加 64 的额外高度
        automaticallyAdjustsScrollViewInsets = false
        
        table.delegate = self
        table.dataSource = self
        
        // 设置表头\表尾标签
        setup_Header_And_Tail_Label()
        
        view.addSubview(table)
        
        
    }
    
    
    // MARK:- 设置表头\表尾标签
   fileprivate func setup_Header_And_Tail_Label() {
        
        //创建表头标签
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 60))
        headerLabel.backgroundColor = UIColor.black
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        headerLabel.textAlignment = NSTextAlignment.center
        headerLabel.text = "常见 UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
    
        // 创建表尾标签
        let tailLabel = UILabel(frame: CGRect(x: 0, y: view.bounds.size.height - 3, width: view.bounds.size.width,height: 40))
        tailLabel.backgroundColor = UIColor.black
        tailLabel.textColor = UIColor.white
        tailLabel.numberOfLines = 0
        tailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        tailLabel.textAlignment = .center
        tailLabel.text = "UIKit 控件简介"
        tailLabel.font = UIFont.italicSystemFont(ofSize: 20)
    
        // 添加表头视图: headerLabel
        table.tableHeaderView = headerLabel
        // 添加页尾视图: tailLabel
        table.tableFooterView = tailLabel
    }
    

    // MARK: - tableView Data Source
    // MARK: 设置数据的分区数, 此方法默认1组
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: 设置每组数据的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Controller_Names!.count
    }
    
    // MARK: 具体显示的数据
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify = "SwiftCell"
       
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        // 设置 cell 显示的文本
        cell.textLabel?.text = Controller_Names?[indexPath.row]

        return cell
     
    }
 
    // MARK: - UITableView Delegate
    // MARK: 处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 跳转到detailViewController，取消选中状态
        tableView.deselectRow(at: indexPath, animated: true)

        // 创建DetailViewController
        let detailViewController = DetailViewController()

        // 传递控件的title，在detailView里用于判断生成响应的控件
        detailViewController.title = Controller_Names?[indexPath.row]

        // navigationController跳转到detailViewController
        self.navigationController!.pushViewController(detailViewController, animated:true)
        
        
/*
        self.table!.deselectRow(at: indexPath, animated: true)
        
        let itemString = self.Controller_Names![(indexPath as NSIndexPath).row]
        
        let alertController = UIAlertController(title: "提示!", message: "你选中了【\(itemString)】", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default,handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
 */
    }
    
    //MARK: 设置单元格的编辑模式
    //即Cell中显示 (删除按钮) 或 (添加按钮)
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        //设置单元格的编辑模式为 删除
        return UITableViewCellEditingStyle.delete
    }
    
    
    // MARK: 响应单元格的删除事件
    
    // 开启在Cell中滑动删除, 显示删除按钮，必须实现以下方法:
    // 点击当点击delete后执行的删除过程
    // 注意：先除数据源里的数据，删除tableView中对应的行
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // 如果编辑模式为删除,执行后面的方法
        if editingStyle == UITableViewCellEditingStyle.delete {
        
            print("删除了数据\(indexPath.row)")
            
            // 获取待删除的单元格, 在段落中的行数.
            let index = indexPath.row
           
            // 从数组中将该单元格的内容清除, 以保证 单元格 的一致性
            Controller_Names?.remove(at: index)
        }
        // 然后删除单元格在表格中对应的行, 带动画效果
        table?.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)
    }

    // MARK: 修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        return "删除"
    }
    
    // 设置状态栏背景颜色
    override var preferredStatusBarStyle : UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
    }
    
}

