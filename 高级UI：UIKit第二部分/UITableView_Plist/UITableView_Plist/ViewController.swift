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
  
    var ctrlnames:[String]?
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        table.delegate = self
        table.dataSource = self
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        
        //读取plist文件路径, 将plist内容放到 Array 中
        ctrlnames = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Property", ofType: "plist")!) as? Array
        
        //创建一个重用的单元格
        table!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.table!)
        
        //创建表头标签
        let headerLabel = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, 40))
        headerLabel.backgroundColor = UIColor.blackColor()
        headerLabel.textColor = UIColor.whiteColor()
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        headerLabel.text = "常见 UIKit 控件"
        headerLabel.font = UIFont.italicSystemFontOfSize(20)
        self.table!.tableHeaderView = headerLabel
    
    }

    // MARK: - tableView Data Source
    
    //设置数据有多少组, 此方法默认1组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // 设置每组数据的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ctrlnames!.count
    }
    // 具体显示的数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify = "SwiftCell"
       
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        // 设置 cell 显示的文本
        cell.textLabel?.text = self.ctrlnames![indexPath.row]

        return cell
     
    }
 
    // MARK: - UITableView Delegate
    
    // 处理列表项的选中事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.table!.deselectRowAtIndexPath(indexPath, animated: true)
        
        let itemString = self.ctrlnames![indexPath.row]
        
        let alertController = UIAlertController(title: "提示!", message: "你选中了【\(itemString)】", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "确定", style: .Default,handler: nil)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK: -  设置单元格的编辑模式
    //即Cell中显示 (删除按钮) 或 (添加按钮)
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        //设置单元格的编辑模式为 删除
        return UITableViewCellEditingStyle.Delete
    }
    
    
    // MARK: -  响应单元格的删除事件
    
    // 开启在Cell中滑动删除, 显示删除按钮，必须实现以下方法:
    // 点击当点击delete后执行的删除过程
    
    // 注意：先除数据源里的数据，删除tableView中对应的行
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // 如果编辑模式为删除,执行后面的方法
        if editingStyle == UITableViewCellEditingStyle.Delete {
        
            print("删除了数据\(indexPath.row)")
            
            // 获取待删除的单元格, 在段落中的行数.
            let index = indexPath.row
           
            // 从数组中将该单元格的内容清除, 以保证 单元格 的一致性
            self.ctrlnames?.removeAtIndex(index)
        }
        // 然后删除单元格在表格中对应的行, 带动画效果
        self.table?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }

    //修改删除按钮的文字
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        
        return "删除"
    }
    
    
    // 设置状态栏背景颜色
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.LightContent
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

