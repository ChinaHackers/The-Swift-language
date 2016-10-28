//
//  ViewController.swift
//  UIScrollViewDemo3
//
//  Created by Liu Chuan on 16/6/10.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // 定义3个常量用来表示 4个页面, 页面宽度: 屏幕的宽度, 高度: 屏幕的高度
    let numOfPages = 4
    let screenW = UIScreen.main.bounds.width
    let screenH = UIScreen.main.bounds.height

    // 添加控制翻页的属性: 通过 UIPageControl 组件中的小白点, 观察页面的位置
    var pageControl = UIPageControl()
    
    // 添加一个状态属性,用来标志页面的滑动状态
    var usePageControl = false
    
    var scrollView = UIScrollView()
    var btn = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - UIScrollView (滚动视图)
        
        // 初始化 UIScrollView 对象,并设置其位置
        scrollView = UIScrollView(frame: self.view.frame)
        
        // 设置UIScrollView缩放最小比例\最大比例
        // scrollView.minimumZoomScale = 0.1
        // scrollView.maximumZoomScale = 3
        
        // 设置是否按照整页来滚动视图, 默认为 false
        scrollView.isPagingEnabled = true
        
        // 设置是否开启滚动效果
        scrollView.isScrollEnabled = true
        
        // 设置画布大小, 画布显示在滚动视图内部, 一般大于 Frame 的大小
        // 为了能让内容横向滚动, 设置横向宽度为 3个页面的宽度总和
        scrollView.contentSize = CGSize(width: screenW * CGFloat(numOfPages), height: screenH)
        
        // 设置是否边缘弹动效果
        // 滑动视图的边界回弹效果，默认为YES.表示开启动画，设置为NO时，当滑动到边缘就是无效果
        scrollView.bounces = true
        
        // 是否开启横向弹动效果
        scrollView.alwaysBounceHorizontal = false
        
        
        // 滑动方向的锁定，默认为NO,不锁定的
        scrollView.isDirectionalLockEnabled = true
        
        // iOS7以后, 导航控制器中 ScrollView顶部会添加 64的额外高度
        self.automaticallyAdjustsScrollViewInsets = false
        
        // 是否开启纵向弹动效果
        scrollView.alwaysBounceVertical = false
        
        // 是否显示横向滚动条
        scrollView.showsHorizontalScrollIndicator = false
        
        // 是否显示纵向滚动条
        scrollView.showsVerticalScrollIndicator = false
        
        // 设置滚动视图的背景色
        scrollView.backgroundColor = UIColor.black
        
        // 设置滚动视图的代理 为当前类 ,来实现捕捉滚动视图的动作
        scrollView.delegate = self
        
        self.view.addSubview(scrollView)
     
        // 使用 for in 循环创建 4张图片
        for i in 0..<numOfPages {
            
            let str = NSString(format: "%d.jpg", i+1)
            
            let image = UIImage(named: str as String)
            
            let imageView = UIImageView(image: image)
            
            imageView.frame = CGRect(x: screenW * CGFloat(i), y: 0, width: screenW, height: screenH)
            
            scrollView.addSubview(imageView)
        }
        
        // 创建一个高度常量,作为页面控制器(UIPageControl)的高度
        let pHight: CGFloat = 50.0
        
        // 创建一个区域, 显示页面控制器 对象
        let pRect = CGRect(x: 0, y: screenH - pHight, width: screenW, height: pHight)
        
        // 设置页面控制器的显示区域
        pageControl.frame = pRect
        
        // 设置页面控制器对象的 总页数: 4页
        pageControl.numberOfPages = 4
        
        // currentPageIndicatorTintColor: 设置当前页码小白点的颜色
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        // pageIndicatorTintColor: 设置未选择页面小白点颜色
        pageControl.pageIndicatorTintColor = UIColor.white
        
        // 设置页面控制器的当前页码
        pageControl.currentPage = 0
        
        // 设置页面控制器的背景颜色: 透明色
        //pageControl.backgroundColor = UIColor.clearColor()
        
        // 给页面控制器,添加 监听页面切换 的方法
        pageControl.addTarget(self, action: #selector(ViewController.sliding), for: UIControlEvents.valueChanged)

        view.addSubview(pageControl)
    }
    // 监听页面滑动的方法
    func sliding()  {
        
        // 获取当前页面控制器 当前的页码
        let page = CGFloat(pageControl.currentPage)
        
        // 获取滚动视图当前的显示区域
        var frame = scrollView.frame
        
        // 根据页面控制器的页码,计算滚动视图在下一页中的显示区域
        frame.origin.x = frame.size.width * page
        frame.origin.y = 0
        
        // 滚动视图到目前区域, 展现当前页面内容
        scrollView.scrollRectToVisible(frame, animated: true)
        
        // 设置通过页面控制器 切换页面
        usePageControl = true
        
        
    }
    // 监听滚动视图事件 代理方法
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // 如果切换页面 ,则不执行后面的代码
        if !usePageControl {
            
            // 获得滚动视图的宽度
            let pageWidth = scrollView.frame.size.width
            
            // 根据滚动视图的宽度值 和 横向 移动数值 计算当前页码
            let pages = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
            
            // 设置页面控制器页码 ,为计算后得到的页码
            pageControl.currentPage = Int(pages)
            
        }
    }
    // 创建监听滚动视图 的滚动减速事件代理方法, 重置标量的默认值
//    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
//        
//        usePageControl = false
//
//        
//    }
    
    
    // 滑动结束后调用
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / self.view.frame.size.width)    //获取当前页数
        pageControl.currentPage = index
        //在这里添加按钮的渐入效果,当页面滑到第4页时出现
        if(index == 3) {
            btn.frame = CGRect(x: 4 * self.view.frame.width, y: self.view.frame.height, width: self.view.frame.width, height: 50)
            btn.setTitle("欢迎来到美女世界!", for: UIControlState())
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            btn.setTitleColor(UIColor.gray, for: UIControlState.highlighted)
            btn.backgroundColor = UIColor.orange
            btn.alpha = 0
            
            btn.addTarget(self, action: #selector(ViewController.buttonClick(_:)), for: .touchUpInside)
            
            UIView.animate(withDuration: 1.5, delay: 0.5, options: UIViewAnimationOptions(), animations: { () -> Void in
                self.btn.frame = CGRect(x: 3*self.view.frame.width, y: self.view.frame.height-100, width: self.view.frame.width, height: 50)
                self.btn.alpha = 1
                
                //注意把按钮添加到scrollView上,不要添加到imageView上,会无法点击
                self.scrollView.addSubview(self.btn)
                
                }, completion: nil)
        }
        
    }
    
    //按钮点击事件
    func buttonClick(_ button: UIButton) {
        //界面的跳转
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let rootVC = sb.instantiateViewController(withIdentifier: "root")
        self.present(rootVC, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
