//
//  CurvedShadowViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class CurvedShadowViewController: UIViewController {

    let width: CGFloat = 200
    let height: CGFloat = 200
    let vw = UIImageView()
    
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
        let shadowRadius: CGFloat = 5
        vw.layer.shadowRadius = shadowRadius
        vw.layer.shadowOffset = CGSize(width: 0, height: 10)
        vw.layer.shadowOpacity = 0.5
        
        // how strong to make the curling effect
        let curveAmount: CGFloat = 20
        let shadowPath = UIBezierPath()
        
        // the top left and right edges match our view, indented by the shadow radius
        shadowPath.move(to: CGPoint(x: shadowRadius, y: 0))
        shadowPath.addLine(to: CGPoint(x: width - shadowRadius, y: 0))
        
        // the bottom-right edge of our shadow should overshoot by the size of our curve
        shadowPath.addLine(to: CGPoint(x: width - shadowRadius, y: height + curveAmount))
        
        // the bottom-left edge also overshoots by the size of our curve, but is added with a curve back up towards the view
        shadowPath.addCurve(to: CGPoint(x: shadowRadius, y: height + curveAmount), controlPoint1: CGPoint(x: width, y: height - shadowRadius), controlPoint2: CGPoint(x: 0, y: height - shadowRadius))
        vw.layer.shadowPath = shadowPath.cgPath
        
        view.addSubview(vw)
    }

}
