//
//  ViewController.swift
//  Animation
//
//  Created by Taof on 11/25/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let myView = UIView()
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        myView.center = view.center
        myView.backgroundColor = UIColor.red
        view.addSubview(myView)
        
        //        animateRadius()
//        dropView()
//        dropView2()
//        dropByTimer()
//        transformView()
        maskGradient()
    }
    
    func animateRadius(){
        let newRadius = myView.frame.size.width/2
        
        UIView.animate(withDuration: 1) {
            self.myView.layer.cornerRadius = newRadius
            self.myView.center = self.view.center
        }
    }
    func dropView(){
        myView.frame = CGRect(x: myView.center.x, y: 80, width: 50, height: 50)
        myView.center.x = view.center.x
        myView.layer.cornerRadius = myView.frame.size.width/2
        
        UIView.animate(withDuration: 2) {
            self.myView.frame.origin.y = self.view.frame.maxY - self.myView.frame.size.height
        }
    }
    func dropView2(){
        myView.frame = CGRect(x: myView.center.x, y: 80, width: 50, height: 50)
        myView.center.x = view.center.x
        myView.layer.cornerRadius = myView.frame.size.width/2
        
        UIView.animate(withDuration: 2, animations: {
            self.myView.frame.origin.y = self.view.frame.maxY - self.myView.frame.size.height
        }) { _ in
            UIView.animate(withDuration: 2, delay: 0.5, options: [.autoreverse, .repeat], animations: {
                self.myView.frame.origin.y = 80
            })
        }
    }
    func dropByTimer(){
        myView.frame = CGRect(x: myView.center.x, y: 80, width: 50, height: 50)
        myView.center.x = view.center.x
        myView.layer.cornerRadius = myView.frame.size.width/2
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    @objc func runTimer(){
        myView.frame.origin.y += 5
        if myView.frame.origin.y >= view.frame.maxY - myView.frame.size.height{
            timer.invalidate()
        }
    }
    
    func transformView(){
        myView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
    }
    
    func maskGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 0.2, 0.4, 0.6, 0.8, 1]
        gradientLayer.frame = myView.bounds
        gradientLayer.opacity = 0.5
        let angle = 45 * CGFloat.pi/180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)

        myView.layer.mask = gradientLayer
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 3
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity

        gradientLayer.add(animation, forKey: "transform.translation.x")
    }
}

