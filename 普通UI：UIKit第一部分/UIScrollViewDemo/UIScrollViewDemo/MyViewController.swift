//
//  MyViewController.swift
//  UIScrollViewDemo
//
//  Created by Liu Chuan on 15/8/2.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var number: Int!
    let colorMap = [1: UIColor.black, 2: UIColor.orange, 3: UIColor.blue]
    
    
    init(number initNumber: Int) {
        
        self.number = initNumber
        
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {

        let numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        numberLabel.center = self.view.center
        
        numberLabel.text = "第\(number)页"
        
        numberLabel.textColor = UIColor.white
        self.view.addSubview(numberLabel)
        
        self.view.backgroundColor = colorMap[number]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
