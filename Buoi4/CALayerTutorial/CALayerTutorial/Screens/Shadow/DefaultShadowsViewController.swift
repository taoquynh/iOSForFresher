//
//  DefaultShadowsViewController.swift
//  CALayerTutorial
//
//  Created by Taof on 6/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DefaultShadowsViewController: UIViewController {

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
        vw.layer.shadowPath = UIBezierPath(rect: vw.bounds).cgPath
        vw.layer.shadowRadius = 5
        vw.layer.shadowOffset = .zero
        vw.layer.shadowOpacity = 1
        
        
        view.addSubview(vw)
    }
}
