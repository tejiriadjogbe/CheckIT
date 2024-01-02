//
//  LoadingModal.swift
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//

import UIKit

class Spinner: UIView {
    let circleLayer = CAShapeLayer()
    let pathLayer = CAShapeLayer()
    override func layoutSubviews() {
        setup()
    }
    
    deinit {
        layer.removeAllAnimations()
        circleLayer.removeAllAnimations()
        pathLayer.removeAllAnimations()
    }
    
    func setup() {
        backgroundColor = .clear
        //Path Layer
        let lineWidth = 8.96
        let radius = min(bounds.width, bounds.height) / 2 - lineWidth
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * CGFloat.pi
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
        pathLayer.path = circularPath
        pathLayer.strokeColor = UIColor.AppPrimary.withAlphaComponent(0.3).cgColor
        pathLayer.lineWidth = lineWidth
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.lineCap = .round
        layer.addSublayer(pathLayer)
        
        //Stroke Layer
        circleLayer.path = circularPath
        circleLayer.strokeColor = UIColor.AppPrimary.cgColor
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        layer.addSublayer(circleLayer)

        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.fromValue = 0
        animation.toValue = 0.25
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        circleLayer.add(animation, forKey: "strokeStart")

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = 0
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        basicAnimation.autoreverses = true
        basicAnimation.repeatCount = Float.infinity
        circleLayer.add(basicAnimation, forKey: "loaderAnimation")
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.duration = 0.6
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = 2 * CGFloat.pi
        rotationAnimation.repeatCount = Float.infinity
        layer.add(rotationAnimation, forKey: "rotation")
        
        let animation2 = CABasicAnimation(keyPath: "lineWidth")
        animation2.fromValue = 8.96
        animation2.toValue = 11.96
        animation2.duration = 0.8
        animation2.timingFunction = CAMediaTimingFunction(name: .linear)
        animation2.repeatCount = Float.infinity
        animation2.autoreverses = true
        pathLayer.add(animation2, forKey: "lineWidth")
    }
}
