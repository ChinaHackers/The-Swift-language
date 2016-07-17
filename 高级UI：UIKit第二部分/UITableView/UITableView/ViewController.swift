//
//  ViewController.swift
//  UITableView
//
//  Created by Liu Chuan on 15/8/9.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

// 添加表格视图的数据协议\ 代理协议\ 手势代理

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    // 定义一个数组, 作为表格的数据来源
    var dataArray = [ListItem]()
    
    //var dataArray2 = [ListItem]()
    
    var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ============================
        // MARK: -  UITableView (表格)
        // ============================
        
        // 初始化UItableView, 并设置其位置尺寸\样式
        table = UITableView(frame: self.view.frame, style: UITableViewStyle.grouped)
        
        
        //UItableView 数据数组集合
        // dataArray = ["孙悟空", "猪八戒", "牛魔王", "蜘蛛精", "白骨精", "唐僧", "如来"]
        
        
        dataArray = [ListItem(text: "标签 UILabel"), ListItem(text: "文本框  UITextField"),
                     ListItem(text: "按钮 UIButton"), ListItem(text: "开关按钮 UISwitch"),
                     ListItem(text: "分段控件 UISegmentControl"), ListItem(text: "图像 UIImageView"),
                     ListItem(text: "进度条 UIProgressView"), ListItem(text: "滑动条 UISlider"),
                     ListItem(text: "警告框 UIAlertView")]

       /*
        dataArray2 = [ListItem(text: "日期选择器 UIDatePicker"), ListItem(text: "微调器 UIStepper"), 
                      ListItem(text: "网页控件 UIWebView"), ListItem(text: "工具条 UIToolbar"),
                      ListItem(text: "表格 UITableView"), ListItem(text: "搜索条 UISearchBar"),
                      ListItem(text: "导航条 UINavigationBar"), ListItem(text: "网格 UICollectionView"),
                      ListItem(text: "标签条 UITabBar"), ListItem(text: "分段控件 UIPageControl")]
        
     */
        
        // 加载 tableView 数据
        //table.reloadData()
        
        // 设置表格视图的代理\数据源 为当前表格视图控制器类
        self.table!.delegate = self
        self.table!.dataSource = self
        

         // 创建一个字符串,作为单元格的重用标识符
        self.table!.register(MyTableViewCell.self, forCellReuseIdentifier: "tableCell")
       
        //创建表头标签
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))
        headerLabel.backgroundColor = UIColor.purple()
        headerLabel.textColor = UIColor.white()
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        headerLabel.text = "常见 UIKit 控件"
        headerLabel.font = UIFont.italicSystemFont(ofSize: 17)
    
        // 添加 空间到当前视图控制器上
        self.table.tableHeaderView = headerLabel
        self.view.addSubview(self.table!)
        
        //监听键盘弹出通知
        NotificationCenter.default .addObserver(self,selector: #selector(ViewController.keyboardWillShow(_:)),
                         name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        //监听键盘隐藏通知
        NotificationCenter.default .addObserver(self,selector: #selector(ViewController.keyboardWillHide(_:)),
                         name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        //绑定对长按的响应
        let longPress =  UILongPressGestureRecognizer(target:self, action:#selector(ViewController.tableviewCellLongPressed(_:)))
       
        //代理
        longPress.delegate = self
        
        // 最低长按时长
        longPress.minimumPressDuration = 1.0
        
        //将长按手势添加到需要实现长按操作的视图里
        table.addGestureRecognizer(longPress)
        

    }
 
    
    //导航栏编辑按钮点击事件
    @IBAction func editBtnClick(_ sender: UIBarButtonItem) {
        
        //在正常状态和编辑状态之间切换
        if(self.table.isEditing == false){
            
            self.table.setEditing(true, animated:true)
            sender.title = "保存"
        }
        else{
            self.table.setEditing(false, animated:true)
            sender.title = "编辑"
        }
        //重新加载表数据（改变单元格输入框编辑/只读状态）
        self.table?.reloadData()
        
    }

    
    // MARK - table view Data scource
    
    // MARK -  有多少组数据
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // MARK -  每-组有多少行
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 数组的长度作为表格视图的行数
        return dataArray.count
     
    }


    // MARK - 每一行显示的具体内容
    
    // 初始化或复用表格视图中的单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)  as! MyTableViewCell
        
        
        //设置单元格内容
        let item = dataArray[(indexPath as NSIndexPath).row]
        
         // 单元格数据 
        cell.listItem = item
        
        //内容标签是否可编辑
        cell.labelEditable = tableView.isEditing

        
        // 设置标识符
        // let identify = "cell"
        // 创建 cell
        // let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identify)
        
        // 自定义cell右边辅助按钮
        // cell.accessoryView = nil
        
        // 设置cell右边辅助按钮的样式
        /*
         Detail Button  : 详细按钮
         Check Mark     : 复选标记
         Detail Disclosure Button : 详细信息 加上 > 按钮
         Disclosure Indicator     : 信息 > 按钮
         
         */
       
        // cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
      
        // 设置 cell 被选中时的背景
        let aw = UIView(frame: cell.frame)
        aw.backgroundColor = UIColor.orange()
        cell.selectedBackgroundView = aw
        
        // MARK: - 开启编辑模式进行多选操作, 即cell  √ 打钩选择
       // table.allowsMultipleSelectionDuringEditing = true
        
        // 设置 textlabel 显示的文本
        // cell.textLabel?.text = dataArray[indexPath.row] as? String
        
        // 设置 cell 的详细的文本标签
        cell.detailTextLabel?.text = "more..."
        
         return cell
    }
 

    // MARK -  UITableView Delegate
    
    // 处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.table.deselectRow(at: indexPath, animated: true)
   
    }
  
    /*
     //禁止cell被点击选中
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        return nil
    }
     */
    
    
    //MARK: -  设置单元格的编辑模式为 删除模式
    //即Cell中显示 (删除按钮) 或 (添加按钮)
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        //在点击右上角的按钮后，每个Cell中显示的按钮如下
        /*
         UITableViewCellEditingStyleNone    : 无
         UITableViewCellEditingStyleDelete  : - 删除
         UITableViewCellEditingStyleInsert  : + 添加
      
         注意：这个方法里一般返回两种类型，还有一中默认类型
         删除：UITableViewCellEditingStyleDelete
         增加：UITableViewCellEditingStyleInsert
         */
 
            if((indexPath as NSIndexPath).section == 1) {
                
                return UITableViewCellEditingStyle.none
            }
            return UITableViewCellEditingStyle.delete
       
    }
    
    // 设置删除按钮文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath)
        -> String? {
            return "删除"
    }
    
    // MARK: -  开启在Cell中滑动删除, 显示删除按钮，必须实现以下方法:
    
    // 响应单元格的删除事件：点击当点击delete后执行的删除过程
    // 注意：先除数据源里的数据，删除tableView中对应的行
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // 如果编辑模式为删除,执行后面的方法
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            
            // 获取待删除的单元格, 在段落中的行数.
            let rowNum = (indexPath as NSIndexPath).row
            
            // 从数组中将该单元格的内容清除, 以保证 单元格的一致性
            dataArray.remove(at: rowNum)
            
            // 简写:
           // dataArray.removeAtIndex(indexPath.row)
            
            print("您点击了删除按钮!")
            
        }
        
        // 然后删除单元格在表格中对应的行
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        
    }
 
 
    //MARK: -  设置单元格是否允许拖动\换行.
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
   
    //MARK: - 响应单元格的移动事件
    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        
        
        
        if fromIndexPath != toIndexPath {
        
            //获取移动行对应的值
            let itemValue:ListItem = dataArray[(fromIndexPath as NSIndexPath).row]
            
            //删除移动的值
            dataArray.remove(at: (fromIndexPath as NSIndexPath).row)
            
            //如果移动区域大于现有行数，直接在最后添加移动的值
            
            if (toIndexPath as NSIndexPath).row > dataArray.count{
            
                dataArray.append(itemValue)
            
            }else{
            
                //没有超过最大行数，则在目标位置插入一份删除的对象, 已同步数据源, 保证数据与界面的一致性.
                dataArray.insert(itemValue, at:(toIndexPath as NSIndexPath).row)
            }
        }
    }
    
    
    //MARK: - 长按表格
    
    func tableviewCellLongPressed(_ gestureRecognizer:UILongPressGestureRecognizer) {
        
        if (gestureRecognizer.state == UIGestureRecognizerState.ended) {
            
            print("UIGestureRecognizerState, 手势识别器状态结束了")
            
            //在正常状态和编辑状态之间切换
            if(table.isEditing == false) {
                
                self.table.setEditing(true, animated:true)
                
            } else {
                
                self.table.setEditing(false, animated:true)
            }
        }
    }
    
    
    
    // MARK: - Keyboard
    
    // 键盘显示
    func keyboardWillShow(_ notification: Notification) {
        
        let userInfo = (notification as NSNotification).userInfo!
        
        //键盘尺寸
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue()
        var contentInsets:UIEdgeInsets
        
        //判断是横屏还是竖屏
        let statusBarOrientation = UIApplication.shared().statusBarOrientation
        
        if UIInterfaceOrientationIsPortrait(statusBarOrientation) {
        
            contentInsets = UIEdgeInsetsMake(64.0, 0.0, (keyboardSize.height), 0.0);
        
        } else {
            
            contentInsets = UIEdgeInsetsMake(64.0, 0.0, (keyboardSize.width), 0.0);
        }
        
        //tableview的contentview的底部大小
        self.table.contentInset = contentInsets;
        self.table.scrollIndicatorInsets = contentInsets;
    }
    
    // 键盘隐藏
    func keyboardWillHide(_ notification: Notification) {
        
        //还原tableview的contentview大小
        let contentInsets:UIEdgeInsets = UIEdgeInsetsMake(64.0, 0.0, 0, 0.0);
        
        self.table.contentInset = contentInsets
        self.table.scrollIndicatorInsets = contentInsets
    }
    
    
    //MARK: - 页面移除时
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        //取消键盘监听通知
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

