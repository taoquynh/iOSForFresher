//
//  ContactShadowViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ContactShadowViewController: UIViewController {

    let width: CGFloat = 200
    let height: CGFloat = 200
    let vw = UIImageView()
    let shadowSize: CGFloat = 20
    
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
        let contactRect = CGRect(x: -shadowSize, y: height - (shadowSize * 0.4) + 20, width: width + shadowSize * 2, height: shadowSize)
        vw.layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        vw.layer.shadowRadius = 5
        vw.layer.shadowOpacity = 0.4

        
        view.addSubview(vw)
    }

}
