//
//  CircleLayerView.swift
//  Ball
//
//  Created by Taof on 6/1/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CircleLayerView: UIView {
    var circleLayer: CAShapeLayer!
    var radius: CGFloat = 0.0
    
    var fillColor: UIColor!
    
    convenience init(center: CGPoint, radius: CGFloat, fillColor: UIColor) {
        self.init(frame: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2.0, height: radius * 2.0))
        self.radius = radius
        self.fillColor = fillColor
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if circleLayer == nil {
            circleLayer = CAShapeLayer()
            circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 0.0, y: 0.0,
                                                           width: self.frame.size.width,
                                                           height: self.frame.size.height)).cgPath
            
            circleLayer.fillColor = fillColor.cgColor
            self.layer.addSublayer(circleLayer)
        }
    }
    
}
