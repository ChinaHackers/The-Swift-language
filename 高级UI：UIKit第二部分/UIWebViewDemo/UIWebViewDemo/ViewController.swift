//
//  ViewController.swift
//  UIWebViewDemo
//
//  Created by Liu Chuan on 15/8/5.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var btnGo: UIButton!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var txtUrl: UITextField!
    
    var loadIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var table: UITableView!
    
    //进度条计时器
    var ptimer: Timer!
    
    // 进度条控件
    var progBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.webView.delegate = self
        
        loadIndicator = UIActivityIndicatorView(frame: CGRect(x: 100.0, y: 100.0, width: 32.0, height: 32.0))
        loadIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        self.view.addSubview(loadIndicator)
        txtUrl.delegate = self
        
        
        // 构建浏览器工具条
        setupBrowserToolbar()
        
        
    }
    
    func setupBrowserToolbar()
    {
        // 创建一个浏览器工具条，并设置它的大小和位置
        let browserToolbar =  UIToolbar(frame:CGRect(x: 0, y: 150, width: 320, height: 44))
        
        // 将工具条添加到当前应用的界面中
        self.view.addSubview(browserToolbar)
        
        //创建图片工具条，但是不是直接使用文件名，而是用 NSData 方式初始化 UIImage
        let path = Bundle.main.path(forResource: "back", ofType:"png")
        
        let urlStr = URL(fileURLWithPath: path!)

        let data = try? Data(contentsOf: urlStr)
 
        let btnback = UIBarButtonItem(image: UIImage(data: data!), style: UIBarButtonItemStyle.bordered, target: self, action: #selector(ViewController.backClicked(_:)))
        
        
        
        
        //第一个分隔按钮
        let btngap1 =  UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target: nil, action:nil)
        
        // 创建前进按钮 UIBarButtonItem

        
        let btnforward = UIBarButtonItem(image: UIImage(named: "forward.png"), style: UIBarButtonItemStyle.plain, target: self, action:#selector(ViewController.forwardClicked(_:)))
        
        
        // 第二个分隔按钮，创建一个可伸缩的UIBarButtonItem
        let btngap2 =  UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target:nil, action:nil)
        
        // 创建重新加载按钮 UIBarButtonItem
        
        let btnreload = UIBarButtonItem(image: UIImage(named: "reload.png"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.reloadClicked(_:)))
        
        
        //第三个分隔按钮
        let btngap3 =  UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target: nil, action:nil)
        
        //创建加载停止按钮

        
        let btnstop = UIBarButtonItem(image: UIImage(named: "stop"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.stopClicked(_:)))
        
        
        //第四个分隔按钮
        let btngap4 =  UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.flexibleSpace, target: nil, action:nil)
        
        //创建进度工具条
        progBar = UIProgressView(progressViewStyle:UIProgressViewStyle.bar)
        
        // 设置UIProgressView的大小
        progBar.frame = CGRect(x: 0 , y: 0 , width: 80, height: 20)
        
        // 设置该进度条的初始进度为0
        progBar.progress = 0
        
        // 创建使用 UIView 的自定义的 UIBarButtonItem
        let btnprog =  UIBarButtonItem(customView:progBar)
        
        // 为工具条设置工具按钮
        browserToolbar.setItems( [btnback,btngap1, btnforward,btngap2, btnreload,btngap3, btnstop,btngap4, btnprog ], animated:true)
        
        //创建计时器对象
        let ptimer = Timer.scheduledTimer(timeInterval: 0.2, target:self ,selector: #selector(ViewController.loadProgress), userInfo:nil,repeats:true)
       
        ptimer.invalidate()
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        txtUrl.resignFirstResponder()
        print(" url Changed! ")
        
        let url = txtUrl.text
        
        loadUrl(url!)

        return true
    }
    
    /*
    在 UIWebView 加载指定 URL
    */
    
    func loadUrl(_ url:String) {
        
        let urlobj = URL(string:url)
        
        let request = URLRequest(url:urlobj!)
        
        webView.loadRequest(request)
    }
    
    
    func stopClicked(_ sender:UIBarButtonItem) {
        
        webView.stopLoading()
    }
    
    func reloadClicked(_ sender:UIBarButtonItem) {
        
        webView.reload()
    }
    
    func backClicked(_ sender:UIBarButtonItem) {
        
        webView.goBack()
    }
    
    func forwardClicked(_ sender:UIBarButtonItem) {
        
        webView.goForward()
    }
    
    @IBAction func goClicked(_ sender:UIButton) {
       
        //收起输入面板
        txtUrl.resignFirstResponder()
        let url = txtUrl.text
        loadUrl(url!)
        
    }
    
    func webViewDidStartLoad(_ webView:UIWebView) {
       
        progBar.setProgress(0, animated: false)
        
        ptimer.fire()
        
        loadIndicator.startAnimating()
        
    }
    
    func webViewDidFinishLoad(_ webView:UIWebView) {
        
        loadIndicator.stopAnimating()
        
        progBar.setProgress(1, animated: true)
        
        ptimer.invalidate()
        
    }
    
    
    func loadProgress()
    {
        // 如果进度满了，停止计时器
        if(progBar.progress >= 1.0)
        {
            // 停用计时器
            ptimer.invalidate();
        }
        else
        {
            // 改变进度条的进度值
            progBar.setProgress(progBar.progress + 0.02, animated:true)
        }
    }
    
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        let alertview = UIAlertView()
        
        alertview.title = "出错!"
        
        alertview.message = error.localizedDescription
        
        alertview.addButton(withTitle: "确定")
        
        alertview.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

