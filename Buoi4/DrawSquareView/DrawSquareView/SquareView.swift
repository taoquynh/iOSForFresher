//
//  SquareView.swift
//  DrawSquareView
//
//  Created by Taof on 8/16/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

class SquareView: UIView {
    
    var squareLayer: CAShapeLayer!
    var radius: CGFloat = 0.0
    var fillColor: UIColor!
    
    convenience init(center: CGPoint, radius: CGFloat, fillColor: UIColor) {
        self.init(frame: CGRect(x: center.x, y: center.y, width: radius * 2.0, height: radius * 2.0))
        self.radius = radius
        self.fillColor = fillColor
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if squareLayer == nil {
            squareLayer = CAShapeLayer()
            squareLayer.path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height), cornerRadius: 0).cgPath
            
            squareLayer.fillColor = fillColor.cgColor
            self.layer.addSublayer(squareLayer)
            
            // kích thước squareView
            let L = self.frame.size.width
            // x = 1/10L là đoạn kích thước thụt vào
            let x = L / 10
            
            let topLayer = CAShapeLayer()
            let path1 = UIBezierPath()
            path1.move(to: CGPoint(x: 0, y: 0))
            path1.addLine(to: CGPoint(x: L, y: 0))
            path1.addLine(to: CGPoint(x: L - x, y: x))
            path1.addLine(to: CGPoint(x: x, y: x))
            path1.addLine(to: CGPoint(x: 0, y: 0))
            topLayer.path = path1.cgPath
            topLayer.fillColor = UIColor.white.cgColor
            topLayer.opacity = 0.4
            squareLayer.insertSublayer(topLayer, at: 0)
            
            
            let rightLayer = CAShapeLayer()
            let path2 = UIBezierPath()
            path2.move(to: CGPoint(x: L, y: 0))
            path2.addLine(to: CGPoint(x: L, y: L))
            path2.addLine(to: CGPoint(x: L - x, y: L - x))
            path2.addLine(to: CGPoint(x: L - x, y: x))
            path2.addLine(to: CGPoint(x: L, y: 0))
            rightLayer.path = path2.cgPath
            rightLayer.fillColor = UIColor.black.cgColor
            rightLayer.opacity = 0.3
            squareLayer.insertSublayer(rightLayer, at: 0)
            
            let bottomLayer = CAShapeLayer()
            let path3 = UIBezierPath()
            path3.move(to: CGPoint(x: L, y: L))
            path3.addLine(to: CGPoint(x: 0, y: L))
            path3.addLine(to: CGPoint(x: x, y: L - x))
            path3.addLine(to: CGPoint(x: L - x, y: L - x))
            path3.addLine(to: CGPoint(x: L, y: L))
            bottomLayer.path = path3.cgPath
            bottomLayer.fillColor = UIColor.black.cgColor
            bottomLayer.opacity = 0.2
            squareLayer.insertSublayer(bottomLayer, at: 0)
            
            let leftLayer = CAShapeLayer()
            let path4 = UIBezierPath()
            path4.move(to: CGPoint(x: 0, y: L))
            path4.addLine(to: CGPoint(x: 0, y: 0))
            path4.addLine(to: CGPoint(x: x, y: x))
            path4.addLine(to: CGPoint(x: x, y: L - x))
            path4.addLine(to: CGPoint(x: 0, y: L))
            leftLayer.path = path4.cgPath
            leftLayer.fillColor = UIColor.white.cgColor
            leftLayer.opacity = 0.6
            squareLayer.insertSublayer(leftLayer, at: 0)
        }
    }
}
