//
//  ViewController.swift
//  UIWebView
//
//  Created by Liu Chuan on 15/8/4.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var loadType: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //默认选中分段的第一项
        loadType.selectedSegmentIndex = 0
        typeChanged(loadType)
    }

    @IBAction func typeChanged(sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
       
        print(index)
        
        switch index {
        case 0:
            let html = "<h1><a href='http://www.ucai.cn'>优才网(http://www.ucai.cn)</a>，助力优秀人才成长！</h1>"
            webView.loadHTMLString(html, baseURL: nil)
        case 1:
            let path = NSBundle.mainBundle().pathForResource("2048", ofType: "pdf")
            
            let urlStr = NSURL.fileURLWithPath(path!)
            print(urlStr)
            
            webView.loadRequest(NSURLRequest(URL:urlStr))
            
        case 2: //在UIWebView 中显示 PDF, 但是需通过 loadData 方式加载
            
            
            let path = NSBundle.mainBundle().pathForResource("2048", ofType:"pdf")
            
            let urlStr = NSURL.fileURLWithPath(path!)
            let data = NSData(contentsOfURL:urlStr)
            
//            webView.loadData(data!,  MIMEType:"application/pdf", textEncodingName:"utf-8",baseURL: nil)
            
            
            webView.loadData(data!, MIMEType: "appliction/pdf", textEncodingName: "utf-8", baseURL: urlStr)
            @IBOutlet weak var searchBar: UISearchBar!
            
            
            
        default:
            print("是不是出错了？")
            
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

