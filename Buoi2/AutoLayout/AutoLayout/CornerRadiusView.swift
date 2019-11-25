//
//  CornerRadiusView.swift
//  AutoLayout
//
//  Created by Taof on 11/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

@IBDesignable
class CornerRadiusView: UIView {

    @IBInspectable var radius: CGFloat = 0.0
    @IBInspectable var fillColor: UIColor = .cyan
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
//        fillColor.setFill()
        
        path.fill()
        
    }
}
