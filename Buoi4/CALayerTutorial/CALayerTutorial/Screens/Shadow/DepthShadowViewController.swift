//
//  DepthShadowViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DepthShadowViewController: UIViewController {
    
    let width: CGFloat = 200
    let height: CGFloat = 200
    let vw = UIImageView()
    
    let shadowRadius: CGFloat = 5 // -5
    let shadowOffsetX: CGFloat = -50
    
    // how wide and high the shadow should be, where 1.0 is identical to the view
    let shadowWidth: CGFloat = 1.25
    let shadowHeight: CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout(){
        view.backgroundColor = UIColor.white
        let vw = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        vw.image = UIImage(named: "anh")
        vw.center = view.center
        
        // config layer
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: shadowRadius / 2, y: height - shadowRadius / 2))
        shadowPath.addLine(to: CGPoint(x: width - shadowRadius / 2, y: height - shadowRadius / 2))
        shadowPath.addLine(to: CGPoint(x: width * shadowWidth, y: height + (height * shadowHeight)))
        shadowPath.addLine(to: CGPoint(x: width * -(shadowWidth - 1) + shadowOffsetX, y: height + (height * shadowHeight)))
        vw.layer.shadowPath = shadowPath.cgPath
        vw.layer.shadowRadius = shadowRadius
        vw.layer.shadowOffset = .zero
        vw.layer.shadowOpacity = 0.2
        
        view.addSubview(vw)
    }
    
}
