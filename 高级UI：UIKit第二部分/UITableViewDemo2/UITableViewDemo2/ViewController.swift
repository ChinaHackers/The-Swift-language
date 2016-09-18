//
//  ViewController.swift
//  UITableViewDemo2
//
//  Created by Liu Chuan on 16/6/27.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// 遵守表格代理\数据源协议
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    // 定义个字典保存分组数据
    var allnames:Dictionary<Int, [String]>?
    
    // 头部
    var adHeaders:[String]?
    
    var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        self.allnames =  [0:[String]([ "UILabel 标签","UITextField 文本框","UIButton 按钮", "开关按钮 UISwitch", "分段控件 UISegmentControl", "图像 UIImageView", "进度条 UIProgressView", "滑动条 UISlider", "警告框 UIAlertView" ]), 1:[String](["日期选择器 UIDatePiker", "微调器 UIStepper", "网页控件 UIWebView","工具条 UIToolbar","表格视图 UITableView", "搜索条 UISearchBar", "导航条 UINavigationBar", "网格 UICollectionView", "标签条 UITabBar", "分段控件 UIPageControl"])];
        

        print(self.allnames!)

        self.adHeaders = [
            "常见 UIKit 控件",
            "高级 UIKit 控件"]
        
        
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.grouped)
        
        // 设置表格的代理\数据源为当前视图控制器类
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //创建表头标签
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 10, width: self.view.bounds.size.width, height: 30))
        headerLabel.backgroundColor = UIColor.purple
        headerLabel.textColor = UIColor.white
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        headerLabel.text = "UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        // 添加表头视图为 headerLabel
        self.tableView!.tableHeaderView = headerLabel
        
        
        // 创建表尾标签
        let tailLabel = UILabel(frame: CGRect(x: 0, y: self.view.bounds.size.height-10, width: self.view.bounds.size.width,height: 30))
        tailLabel.backgroundColor = UIColor.orange
        tailLabel.textColor = UIColor.white
        tailLabel.numberOfLines = 0
        tailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        tailLabel.text = "UIKit 控件 简介"
        tailLabel.font = UIFont.italicSystemFont(ofSize: 20)
        
        // 添加页尾视图为 tailLabel
        self.tableView.tableFooterView = tailLabel
  
    }
    
    //导航栏编辑按钮点击事件
    @IBAction func editBtnClick(_ sender: UIBarButtonItem) {
        
        //在正常状态和编辑状态之间切换
        if(self.tableView.isEditing == false){
            
            self.tableView.setEditing(true, animated:true)
            sender.title = "保存"
        }
        else{
            self.tableView.setEditing(false, animated:true)
            sender.title = "编辑"
        }
        //重新加载表数据（改变单元格输入框编辑/只读状态）
        self.tableView?.reloadData()
        
    }
    
    
    // MARK - tableView Data scource
    
    // MARK -  有多少组数据
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    // MARK -  每-组有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        let data = self.allnames?[section]
        return data!.count
    }
  
    // MARK - 每一行显示的具体内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify = "SwiftCell"
        
       // indexpath.section : 代表单元格(cell)的第几个分区
        let secno = (indexPath as NSIndexPath).section
        let data = self.allnames?[secno]
        
        // 如果分区数为0, 返回 cell
        if(secno == 0) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as UITableViewCell
            
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            /*    
             //设置 UITableViewCell的style：
                (1）UITableViewCellStyle.Default     ：默认的，只有一个常规内容标签和一个可选的UIImageView
                (2）UITableViewCellStyle.Value1      ：内容标签在左，详细标签在右，右边是蓝色或灰色的文本
                (3）UITableViewCellStyle.Value2      ：同Value1位置相同，左边是蓝色文本
                (4）UITableViewCellStyle.Subtitle    ：标签上下放置
             */
            
            cell.textLabel?.text = data![(indexPath as NSIndexPath).row]
     
            return cell
            
        } else {    // 如果分区数不为0, 返回  adcell
        
            //第二个分组表格使用详细标签
            let adcell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "SwiftCell")
         
            adcell.textLabel?.text = data![(indexPath as NSIndexPath).row]
         
            print((adcell.textLabel?.text)!)
         
            adcell.detailTextLabel!.text = "这是\(data![(indexPath as NSIndexPath).row])的说明"
     
            return adcell
     
        }
        
    }
    
    /***********  MARK: - UITableView  Delegate ************/
    
    //设置编辑的样式: 进入编辑模式的cell是删除还是增加
    /*
    注意：这个方法里一般返回两种类型，还有一中默认类型
    删除：UITableViewCellEditingStyleDelete
    增加：UITableViewCellEditingStyleInsert
    */
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        // 如果分区为 1, 编辑模式为插入, 否为删除
        if((indexPath as NSIndexPath).section == 1) {
            
            return UITableViewCellEditingStyle.insert
        }
        return UITableViewCellEditingStyle.delete
        
    }

    
    // 处理列表项的选中事件

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView!.deselectRow(at: indexPath, animated: true)
        
        let itemString = self.allnames![(indexPath as NSIndexPath).section]![(indexPath as NSIndexPath).row]
       
        let alert = UIAlertController(title: "提示", message: "你选中了【\(itemString)】", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)

    }

    // 该方法的返回值, 决定指定分区的头部
        
    func tableView(_ tableView:UITableView, titleForHeaderInSection section:Int) -> String? {
        
        var headers = self.adHeaders!
        
        return headers[section]
    }
    
    // 该方法的返回值, 决定指定分区的尾部
    func tableView(_ tableView:UITableView, titleForFooterInSection  section:Int) -> String? {
        
        let data = self.allnames?[section]
        
        return "有\(data!.count)个控件"
    }
    
    
    //MARK: - 修改删除按钮的文字
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    // MARK: -  开启在Cell中滑动删除, 显示删除按钮，必须实现以下方法:
    
    // 响应单元格的删除事件：当点击delete后执行的删除过程
    // 注意：先除数据源里的数据，删除tableView中对应的行
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        // 如果编辑模式为删除
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            
            // dbhelper.deleteConversationBySay(conlist[indexPath.row].say)            
            // conlist.removeAtIndex(indexPath.row)
            
            // 获取待删除的单元格, 在段落中的行数.
//            let rowNum = indexPath.row
            
            // 从数组中将该单元格的内容清除, 以保证 单元格的一致性
//            allnames.removeAtIndex(rowNum)
            
         

            print("你点击了删除按钮!")
            
        }
        //再删除tableView中对应的行 , 具有动画效果
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    
    //MARK: -  在编辑状态，可以拖动设置cell位置
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
//    //MARK: - 移动cell事件
//    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//        
//        if fromIndexPath != toIndexPath {
//            
//            //获取移动行对应的值
////            let itemValue:ListItem = dataArray[fromIndexPath.row]
//
//            //删除移动的值
//            dataArray.removeAtIndex(fromIndexPath.row)
//            
//            //如果移动区域大于现有行数，直接在最后添加移动的值
//            
//            if toIndexPath.row > dataArray.count{
//                
//                dataArray.append(itemValue)
//                
//            }else{
//                
//                //没有超过最大行数，则在目标位置添加刚才删除的值
//                dataArray.insert(itemValue, atIndex:toIndexPath.row)
//            }
//        }
//    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

