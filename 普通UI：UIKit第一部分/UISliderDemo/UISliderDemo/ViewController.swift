//
//  ViewController.swift
//  UISliderDemo
//
//  Created by Liu Chuan on 16/6/29.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var ChangeBlur_SLider: UISlider!
    
    // MARK: - 懒加载原图
   fileprivate lazy var originalImage: UIImage = {
        return UIImage(named: "1.jpg")
        }()!
    
    // MARK: - CIContext
    fileprivate lazy var context: CIContext = {
        return CIContext(options: nil)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    // MARK: - 通过 UISilder 修改图片的模糊程度
    @IBAction func changeBlur(_ sender: AnyObject) {
        
        //获取原始图片
        let inputImage =  CIImage(image: originalImage)

        //使用高斯模糊滤镜
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey:kCIInputImageKey)
        
        //设置模糊半径值（越大越模糊）
        filter.setValue(ChangeBlur_SLider.value, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage!
        let rect = CGRect(origin: CGPoint.zero, size: originalImage.size)
        let cgImage = context.createCGImage(outputCIImage, from: rect)
        
        //显示生成的模糊图片
        image.image = UIImage(cgImage: cgImage!)
        
        /*
         模糊效果样式、种类:
         UIBlurEffectStyle.Light         亮
         UIBlurEffectStyle.Dark          暗
         UIBlurEffectStyle.ExtraLight    加亮
         */
        
        // 创建模糊效果类实例
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
//        
//        // 创建效果视图类实例
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        
//        // 设置效果视图类实例的尺寸
//        blurView.frame.size = CGSize(width: view.frame.width, height: 291)
//        
//        //设置模糊透明度
//        blurView.alpha = 1
//        
//        // 将模糊效果视图类实例放入背景中
//        image.addSubview(blurView)
//        
//        // 创建并添加 vibrancy 视图
//        let vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
//        
//        vibrancyView.frame.size = CGSize(width: view.frame.width, height: 291)
//        
//        blurView.contentView.addSubview(vibrancyView)
//
    }
    // MARK: - 通过 UISilder 修改图片的透明度
    @IBAction func changeLight(_ sender: UISlider) {
        
        image.alpha = CGFloat(sender.value)
        print(sender.value)
        
    }
}
