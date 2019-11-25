//
//  FlatAndLongShadowViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FlatAndLongShadowViewController: UIViewController {

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
        vw.layer.shadowRadius = 0
        vw.layer.shadowOffset = .zero
        vw.layer.shadowOpacity = 0.2
        
        // how far the bottom of the shadow should be offset
        let shadowOffsetX: CGFloat = 2000
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: 0, y: height))
        // top-right
        shadowPath.addLine(to: CGPoint(x: width, y: 0))
        // bottom-left
//        shadowPath.addLine(to: CGPoint(x: width, y: height))
        
        // make the bottom of the shadow finish a long way away, and pushed by our X offset
        shadowPath.addLine(to: CGPoint(x: width + shadowOffsetX, y: 2000))
        shadowPath.addLine(to: CGPoint(x: shadowOffsetX, y: 2000))
        vw.layer.shadowPath = shadowPath.cgPath
        
        view.backgroundColor = UIColor(red: 230 / 255, green: 126 / 255, blue: 34 / 255, alpha: 1.0)
        
        view.addSubview(vw)
    }

}
