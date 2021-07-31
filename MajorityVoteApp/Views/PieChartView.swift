//
//  PieChartView.swift
//  MajorityVoteApp
//
//  Created by tk84 on 2021/07/31.
//

import UIKit

class PieChartView: UIView {
    let caShapeLayerForBase:CAShapeLayer = CAShapeLayer.init()
    
    var rateList: [Double]!
    var currentIndex = 0
    var startAngle: CGFloat!
    var endAngle: CGFloat!
    let colorsList = [UIColor.red.cgColor,UIColor.blue.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor,UIColor.black.cgColor,UIColor.red.cgColor,UIColor.blue.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor,UIColor.black.cgColor]
    var duration: Double!
    
    func drawChart(items: [Int]){
        drawBaseChart()
        
        duration = 5.0 / Double(items.count)
        rateList = transCountToPercent(items: items)
        startAngle = CGFloat(-1 * Double.pi / 2.0)
        endAngle = calucEndAngle(startAngle: startAngle, rate: rateList[currentIndex])
        drawValueChart(startAngle: startAngle, endAngle: endAngle)
        
    }
    
    private func drawBaseChart(){
        let shapeFrame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        caShapeLayerForBase.frame = shapeFrame
        caShapeLayerForBase.strokeColor = UIColor(displayP3Red: 1, green: 0.8, blue: 0.4, alpha: 1.0).cgColor
        caShapeLayerForBase.fillColor = UIColor.clear.cgColor
        caShapeLayerForBase.lineWidth = 50
        caShapeLayerForBase.lineCap = .round
        
        let startAngle:CGFloat = CGFloat(0.0)
        let endAngle:CGFloat = CGFloat(Double.pi * 2.0)
        
        caShapeLayerForBase.path = UIBezierPath.init(
            arcCenter: CGPoint.init(x: shapeFrame.size.width / 2.0, y: shapeFrame.size.height / 2.0),
            radius: shapeFrame.size.width / 2.0,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true).cgPath
        self.layer.addSublayer(caShapeLayerForBase)
    }
    

    private func drawValueChart(startAngle: CGFloat, endAngle: CGFloat){
        let caShapeLayerForValue:CAShapeLayer = CAShapeLayer.init()
        
        let shapeFrame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        caShapeLayerForValue.frame = shapeFrame
        caShapeLayerForValue.strokeColor = colorsList[currentIndex]
        caShapeLayerForValue.fillColor = UIColor.clear.cgColor
        caShapeLayerForValue.lineWidth = 50
        caShapeLayerForValue.path = UIBezierPath.init(
            arcCenter: CGPoint.init(x: shapeFrame.size.width / 2.0, y: shapeFrame.size.height / 2.0),
            radius: shapeFrame.size.width / 2.0,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true).cgPath
        
        let caBasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        caBasicAnimation.duration = duration
        caBasicAnimation.fromValue = 0.0
        caBasicAnimation.toValue = 1.0
        caBasicAnimation.delegate = self
        caBasicAnimation.isRemovedOnCompletion = false
        caBasicAnimation.fillMode = .backwards
        caShapeLayerForValue.add(caBasicAnimation, forKey: nil)
        
        self.layer.addSublayer(caShapeLayerForValue)
        
        currentIndex += 1
    }
    
    func transCountToPercent(items: [Int]) -> [Double] {
        var percents: [Double] = []
        let sumItem = Double(items.reduce(0) {$0 + $1})
        for item in items {
            let percent = Double(Double(item) / sumItem * 100.0)
            percents.append(percent)
        }
        print(percents)
        return percents
    }
    
    func calucEndAngle(startAngle: CGFloat, rate: Double) -> CGFloat {
        let diffAngle = CGFloat(abs(startAngle))
        
        if startAngle < 0 {
            return CGFloat(CGFloat(rate / 100 * Double.pi * 2.0) - diffAngle)
        } else {
            return CGFloat(CGFloat(rate / 100 * Double.pi * 2.0) + diffAngle)
        }
    }
    
}

extension PieChartView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if currentIndex > rateList.count - 1 {
            return
        }
        
        
        print("nextChartStart")
        startAngle = endAngle
        endAngle = calucEndAngle(startAngle: startAngle, rate: rateList[currentIndex])
        drawValueChart(startAngle: startAngle, endAngle: endAngle)
    }
}
