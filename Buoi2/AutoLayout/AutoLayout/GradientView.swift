//
//  GradientView.swift
//  AutoLayout
//
//  Created by Taof on 11/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

@IBDesignable // build giao diện ngay ở storyboard
class GradientView: UIView {
    @IBInspectable var startColor: UIColor = UIColor.white
    @IBInspectable var endColor: UIColor = UIColor.white
    
    override class var layerClass: AnyClass{
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
}
