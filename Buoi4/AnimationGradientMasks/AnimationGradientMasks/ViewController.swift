//
//  ViewController.swift
//  AnimationGradientMasks
//
//  Created by Taof on 3/25/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let textLabel = UILabel()
        textLabel.text = "Quynh"
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 80)
        textLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        textLabel.textAlignment = .center
        
        view.addSubview(textLabel)

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 0.2, 0.4, 0.6, 0.8, 1]
        gradientLayer.frame = textLabel.bounds
        gradientLayer.opacity = 0.5
        let angle = 45 * CGFloat.pi/180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)

        textLabel.layer.mask = gradientLayer
        
        // animation
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 3
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity

        gradientLayer.add(animation, forKey: "transform.translation.x")
    }


}

