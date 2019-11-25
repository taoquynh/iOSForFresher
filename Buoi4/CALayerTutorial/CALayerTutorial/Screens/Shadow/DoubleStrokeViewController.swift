//
//  DoubleStrokeViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DoubleStrokeViewController: UIViewController {

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
        let shadowSize: CGFloat = 20
        let shadowPath = UIBezierPath(rect: CGRect(x: -2, y: -2, width: width + 4, height: height + 4))
        vw.layer.shadowPath = shadowPath.cgPath
        
        vw.layer.shadowOffset = .zero
        vw.layer.shadowRadius = 0
        vw.layer.shadowOpacity = 1
        
        vw.layer.borderColor = UIColor.white.cgColor
        vw.layer.borderWidth = shadowSize
        
        
        view.addSubview(vw)
    }

}
