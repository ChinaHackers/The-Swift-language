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
    var allnames = [Int: [String]]()
    
    // 头部标题
    var adHeaders:[String]?
    
    var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据，这一次数据，我们放在属性列表文件里
        allnames =  [0:[String]([ "UILabel 标签","UITextField 文本框","UIButton 按钮", "开关按钮 UISwitch", "分段控件 UISegmentControl", "图像 UIImageView", "进度条 UIProgressView", "滑动条 UISlider", "警告框 UIAlertView" ]), 1:[String](["日期选择器 UIDatePiker", "微调器 UIStepper", "网页控件 UIWebView","工具条 UIToolbar","表格视图 UITableView", "搜索条 UISearchBar", "导航条 UINavigationBar", "网格 UICollectionView", "标签条 UITabBar", "分段控件 UIPageControl"])];
    
        print(self.allnames)

        adHeaders = [
            "常见 UIKit 控件",
            "高级 UIKit 控件"]
        
        
        // 创建表视图
        tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.grouped)
        
        // 设置表格的代理\数据源为当前视图控制器类
        tableView!.delegate = self
        tableView!.dataSource = self
        
        //创建一个重用的单元格
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        
        // 设置表头\表尾标签
        //setup_Header_And_Tail_Label()
        
        // 设置 UITableViewCell 分割线
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.purple
        
        view.addSubview(self.tableView!)
    }
    
    // MARK: - 设置表头\表尾标签
    fileprivate func setup_Header_And_Tail_Label() {
        
        //创建表头标签
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 10, width: self.view.bounds.size.width, height: 30))
        headerLabel.backgroundColor = UIColor.orange
        headerLabel.textColor = UIColor.white
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        headerLabel.text = "UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 20)
        
        // 创建表尾标签
        let tailLabel = UILabel(frame: CGRect(x: 0, y: self.view.bounds.size.height-10, width: self.view.bounds.size.width,height: 30))
        tailLabel.backgroundColor = UIColor.orange
        tailLabel.textColor = UIColor.white
        tailLabel.textAlignment = .center
        tailLabel.numberOfLines = 0
        tailLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        tailLabel.text = "UIKit 控件简介"
        tailLabel.font = UIFont.italicSystemFont(ofSize: 20)
        
        // 添加表头视图为 headerLabel
        tableView.tableHeaderView = headerLabel
        
        // 添加页尾视图为 tailLabel
        tableView.tableFooterView = tailLabel
        

    }
    
    //导航栏编辑按钮点击事件
    @IBAction func editBtnClick(_ sender: UIBarButtonItem) {
        
        //在正常状态和编辑状态之间切换
        if(self.tableView.isEditing == false){
            
            tableView.setEditing(true, animated:true)
            sender.title = "保存"
        }
        else{
            tableView.setEditing(false, animated:true)
            sender.title = "编辑"
        }
        //重新加载表数据（改变单元格输入框编辑/只读状态）
        tableView.reloadData()
        
    }
    
    
    // MARK: - UITableView Data scource
    // MARK: 有多少组数据
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // MARK: 每-组有多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames[section]
        return data!.count
    }
  
    // MARK: 每一行显示的具体内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify = "SwiftCell"
        let secno = indexPath.section        // indexpath.section : 代表单元格(cell)的第几个分区
        let data = self.allnames[secno]
        
        // 如果分区数为0, 返回 cell
        if(secno == 0) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            
            /*    
             //设置 UITableViewCell的style：
                (1）UITableViewCellStyle.Default     ：默认的，只有一个常规内容标签和一个可选的UIImageView
                (2）UITableViewCellStyle.Value1      ：内容标签在左，详细标签在右，右边是蓝色或灰色的文本
                (3）UITableViewCellStyle.Value2      ：同Value1位置相同，左边是蓝色文本
                (4）UITableViewCellStyle.Subtitle    ：标签上下放置
             */
            
            cell.textLabel?.text = data![indexPath.row]
     
            return cell
            
        } else {    // 如果分区数不为0, 返回  adcell
        
            //第二个分组表格使用详细标签
            let adcell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "SwiftCell")
         
            adcell.textLabel?.text = data![indexPath.row]
         
            print((adcell.textLabel?.text)!)
         
            //adcell.detailTextLabel!.text = "这是\(data![(indexPath as NSIndexPath).row])的说明"
     
            return adcell
     
        }
        
    }
    
    //MARK: - UITableView  Delegate
    
    //MARK: 设置编辑的样式: 进入编辑模式的cell是删除还是增加
    /*
    注意：这个方法里一般返回两种类型，还有一中默认类型
    删除：UITableViewCellEditingStyleDelete
    增加：UITableViewCellEditingStyleInsert
    */
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        // 如果分区为 1, 编辑模式为插入, 否为删除
        if indexPath.section == 1 {
            
            return UITableViewCellEditingStyle.insert
        }
        return UITableViewCellEditingStyle.delete
        
    }

    
    //MARK: 处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // 跳转到detailViewController，取消选中状态
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 创建DetailViewController
        let detailViewController = DetailViewController()
        
        if indexPath.section == 0 {
            // 传递控件的title
            detailViewController.title = allnames[indexPath.section]![indexPath.row]
            
        } else {
            
            // 传递控件的title
            detailViewController.title = allnames[indexPath.section]![indexPath.row]
            
        }
        
        // navigationController跳转到detailViewController
        navigationController!.pushViewController(detailViewController, animated:true)
      
/*
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let itemString = self.allnames[indexPath.section]![indexPath.row]
       
        // 创建警告框
        let alert = UIAlertController(title: "提示", message: "你选中了【\(itemString)】", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
*/
    }

    //MARK: 该方法的返回值, 决定指定分区 - 头部标题
    func tableView(_ tableView:UITableView, titleForHeaderInSection section:Int) -> String? {
        
        var headers = self.adHeaders!
        return headers[section]
    }
    
    // MARK: - 返回分区头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // 加载 xib 文件
        let headerView = Bundle.main.loadNibNamed("TableViewSectionHeader", owner: self, options: nil)?[0] as! UIView
        
        let titleLabel = headerView.viewWithTag(1) as! UILabel
        
        titleLabel.text = self.adHeaders?[section]
        
        return headerView
        
        
    }
    
    
    //MARK: 该方法的返回值, 决定指定分区 - 尾部标题
    func tableView(_ tableView:UITableView, titleForFooterInSection  section:Int) -> String? {
        
        let data = self.allnames[section]
        return "有\(data!.count)个控件"
    }
    
    //MARK: - 设置删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    // MARK: - 滑动删除, 显示删除按钮，必须实现以下方法:
    // 注意：先除数据源里的数据，删除tableView中对应的行
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 如果编辑模式为删除
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            
            // dbhelper.deleteConversationBySay(conlist[indexPath.row].say)            
            // conlist.removeAtIndex(indexPath.row)
            
            // 获取待删除的单元格, 在段落中的行数.
//            let rowNum = indexPath.row
//           let rowNum = allnames[indexPath.section]?[indexPath.row]
//            
//            let rowNum = self.allnames[(indexPath as NSIndexPath).section]![(indexPath as NSIndexPath).row]
//            
//            // 从数组中将该单元格的内容清除, 以保证 单元格的一致性
//            allnames.removeAtIndex(rowNum)
//            
//            let key = Array(allnames.keys)
//            let airportNames = Array(allnames.values)
//            
////            allnames.removeValue(forKey: )
//            

            print("你点击了删除按钮!")
            
        }
        //再删除tableView中对应的行 , 具有动画效果
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
    
    //MARK: -  在编辑状态，可以拖动设置cell位置
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else {
            
            return true
        }
    }
    
    //MARK: 设置每行高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    //MARK: 设置分组标题内容高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //MARK: 设置尾部说明内容高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }

    /*********** Index ************/
    
    // MARK: - 返回每组标题索引
    // 返回部分的章节标题显示列表索引视图(例如“ABCD…Z #”)
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
         return ["1","2"]
        
    }
    
    // 告诉表部分对应部分标题/索引(例如“B”,1))
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//     
//        return 10
//    }
    

    
    
//    //MARK: - 移动cell事件
//    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
//        
//        if fromIndexPath != toIndexPath {
//            
//            //获取移动行对应的值
//            let itemValue = allnames[fromIndexPath.row]
//
//            //删除移动的值
//            allnames.removeAtIndex(fromIndexPath.row)
//            
//            //如果移动区域大于现有行数，直接在最后添加移动的值
//            
//            if toIndexPath.row > allnames.count{
//                
//                allnames.append(itemValue)
//                
//            }else{
//                
//                //没有超过最大行数，则在目标位置添加刚才删除的值
//                allnames.insert(itemValue, atIndex:toIndexPath.row)
//            }
//        }
//    }

 

}

