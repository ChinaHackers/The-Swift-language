//
//  ViewController.swift
//  UISlider
//
//  Created by Liu Chuan on 15/7/20.
//  Copyright © 2015年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 滑块(UISlider)
        UISliderDemo()

        
    }
    
    // MARK: - 滑块(UISlider)
    fileprivate func UISliderDemo() {
        
        // 滑块的创建
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        
        slider.center = self.view.center
        
        
        // 设置滑块区间的最小值 / 最大值
        slider.minimumValue = 0
        slider.maximumValue = 1
        
        // value属性 用于设置、获得滑块的当前值
        slider.value = 0.5
        
        // 滑块的设置值还可以用setValue方法
        // animated 参数设置了 改变值是否显示动画效果
        slider.setValue(0.8, animated: true)
        
        // 如果属性continuous 为false，这时将滑块移动停止后，才会触发ValueChanged事件
        slider.isContinuous = false
        
        slider.addTarget(self,action:#selector(sliderDidchange(_:)), for:UIControlEvents.valueChanged)
        
        // MARK: - 制定滑块的样式
        
        //设置滑块左右俩边的颜色
        slider.minimumTrackTintColor = UIColor.white
        slider.maximumTrackTintColor = UIColor.black
        
        // 设置圆形把手的颜色
        slider.thumbTintColor = UIColor.white
        
        // 通过 minimumValueImage 和 maximumValueImage 2个属性向滑块左右俩边增加图标
        slider.minimumValueImage = UIImage(named:"volume-down")
        slider.maximumValueImage = UIImage(named:"volume-up")
        
        // 设置滑块右边部分的图片
        // slider.setMaximumTrackImage(UIImage(named:"slider_max"),for: .normal)
        
        // 设置滑块左边部分的图片
        // slider.setMinimumTrackImage(UIImage(named:"slider_min"),for: .normal)
        
        // 设置圆形把手默认状态下的图片
        // slider.setThumbImage(UIImage(named:"slider_thumb"),for: .normal)
        
        view.backgroundColor = UIColor.gray
        
        view.addSubview(slider)
        
    }
    
    // 移动滑块停止后，会打印出当前滑块的值
    func sliderDidchange(_ slider:UISlider){
        
        print(slider.value)
    }
    
}

