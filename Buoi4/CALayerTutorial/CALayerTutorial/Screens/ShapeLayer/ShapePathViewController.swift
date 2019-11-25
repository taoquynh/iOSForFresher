//
//  ShapePathViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

//https://www.calayer.com/core-animation/2016/05/22/cashapelayer-in-depth.html#what-shape-layers-are

import UIKit

class ShapePathViewController: UIViewController {

    let shape1 = CAShapeLayer()
    let shape2 = CAShapeLayer()
    let shape3 = CAShapeLayer()
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        containerView.center = view.center
        containerView.backgroundColor = .lightGray
        view.addSubview(containerView)
        view.backgroundColor = UIColor.white

        shapeSquare()
//        shapeCircle()
    }
    
    func shapeSquare(){
        shape1.frame = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shape1.lineWidth = 2.0
        shape1.fillColor = nil
        shape1.contentsAreFlipped()
        shape1.strokeColor = UIColor.orange.cgColor
        shape1.path = UIBezierPath(rect: shape1.bounds).cgPath
        containerView.layer.addSublayer(shape1)
    }
    
    func shapeCircle(){
        shape2.frame = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shape2.lineWidth = 2.0
        shape2.fillColor = nil
        
        let starPath = UIBezierPath()
        
        let shapeBounds = shape2.bounds
        let center = shape2.position
        
        let numberOfPoints = CGFloat(5.0)
        let numberOfLineSegments = Int(numberOfPoints * 2.0)
        let theta = .pi / numberOfPoints
        
        let circumscribedRadius = center.x
        let outerRadius = circumscribedRadius * 1.039
        let excessRadius = outerRadius - circumscribedRadius
        let innerRadius = CGFloat(outerRadius * 0.382)
        
        let leftEdgePointX = (center.x + cos(4.0 * theta) * outerRadius) + excessRadius
        let horizontalOffset = leftEdgePointX / 2.0
        
        // Apply a slight horizontal offset so the star appears to be more
        // centered visually
        let offsetCenter = CGPoint(x: center.x - horizontalOffset, y: center.y)
        
        // Alternate between the outer and inner radii while moving evenly along the
        // circumference of the circle, connecting each point with a line segment
        for i in 0..<numberOfLineSegments {
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            
            let pointX = offsetCenter.x + cos(CGFloat(i) * theta) * radius
            let pointY = offsetCenter.y + sin(CGFloat(i) * theta) * radius
            let point = CGPoint(x: pointX, y: pointY)
            
            if i == 0 {
                starPath.move(to: point)
            } else {
                starPath.addLine(to: point)
            }
        }
        
        starPath.close()
        
        // Rotate the path so the star points up as expected
        var pathTransform  = CGAffineTransform.identity
        pathTransform = pathTransform.translatedBy(x: center.x, y: center.y)
        pathTransform = pathTransform.rotated(by: CGFloat(-.pi / 2.0))
        pathTransform = pathTransform.translatedBy(x: -center.x, y: -center.y)
        
        starPath.apply(pathTransform)
        
        shape2.path = starPath.cgPath
        
        containerView.layer.addSublayer(shape2)
    }

}
