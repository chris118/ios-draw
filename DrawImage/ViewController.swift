//
//  ViewController.swift
//  DrawImage
//
//  Created by Chris on 2017/10/16.
//  Copyright © 2017年 putao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        drawRound()
        
        self.imageView.image = drawImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

       
    
    func drawRound(){
        let mainPath2 = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 10, height: 10)))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = mainPath2.cgPath //存入UIBezierPath的路径
        shapeLayer.fillColor = UIColor.red.cgColor //设置填充色
        shapeLayer.lineWidth = 2  //设置路径线的宽度
        shapeLayer.strokeColor = UIColor.gray.cgColor //路径颜色

        
        shapeLayer.path = mainPath2.cgPath
        self.view.layer.addSublayer(shapeLayer)
    }
    
    func drawImage()->UIImage {
        let size = CGSize(width:3200, height:1500)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        
        let img = UIImage(named: "road")!
        img.draw(in: CGRect(x:0, y:0, width:3200, height: 1500))//注意绘图的位置是相对于画布顶点而言，不是屏幕
        

        let mainPath1 = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 100, y: 100), size: CGSize(width: 100, height: 100)))
        context?.addPath(mainPath1.cgPath)
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        
        let mainPath2 = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 100, y: 200), size: CGSize(width: 100, height: 100)))
        context?.addPath(mainPath2.cgPath)
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        
        let mainPath3 = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 100, y: 300), size: CGSize(width: 100, height: 100)))
        context?.addPath(mainPath3.cgPath)
        context?.setFillColor(UIColor.red.cgColor)
        context?.fillPath()
        
        
        
        //返回绘制的新图形
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //不要忘记关闭对应上下文
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func drawImageAtImageContext()->UIImage{
        // 获得一个位图图形上下文
        let size = CGSize(width:300, height:200)
        UIGraphicsBeginImageContext(size)
        
        let img = UIImage(named: "girl")!
        img.draw(in: CGRect(x:0, y:0, width:300, height: 200))//注意绘图的位置是相对于画布顶点而言，不是屏幕
        
        let img2 = UIImage(named: "boy")!
        img2.draw(in: CGRect(x:30, y:30, width: 100, height:  100))
        
        
        //添加水印
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: CGPoint(x: 0, y: 0))
        context?.addLine(to: CGPoint(x: 20, y: 20))
        context?.addEllipse(in: CGRect(x: 20, y: 20, width: 50, height: 50))
        
        UIColor.red.setStroke()
        context?.setLineWidth(2)
        context?.drawPath(using: .stroke)
        
        let str = "ZUBER"
        (str as NSString).draw(in: CGRect(x:200, y:158, width:100, height:30), withAttributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18),NSAttributedStringKey.foregroundColor:UIColor.red])
        
        
        let mainPath2 = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: 80, y: 80), size: CGSize(width: 10, height: 10)))
        context?.addPath(mainPath2.cgPath)
        context?.setFillColor(UIColor.blue.cgColor)
        context?.fillPath()
        
        
        
        
        
        //返回绘制的新图形
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        //不要忘记关闭对应上下文
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}

