//
//  DroppingBall.swift
//  Ball
//
//  Created by Taof on 6/1/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class DroppingBall: UIViewController {

    var ball: CircleLayerView!
    var timer: Timer!
    
    let ball_y_origin: CGFloat = 100.0
    // gia tốc
    let a: CGFloat = 1.0 //
    // v vận tốc ban đầu
    var v: CGFloat = 0.0
    var y: CGFloat!
    let radius:CGFloat = 20.0
    var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        y = ball_y_origin
        height = view.bounds.height
        print("height: ", height)
        ball = CircleLayerView(center: CGPoint(x: view.bounds.midX, y: y),
                               radius: radius,
                               fillColor:  UIColor.red)
        view.addSubview(ball)
        
        timer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(timerLoop), userInfo: nil, repeats: true)
        
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    @objc func timerLoop() {
//        timer.invalidate()
        v = v + a
        print("v: \(v)")
        y = y + v
        print("y: \(y!)")
        if y > height - 12 - radius{
            y = height - 12 - radius
            print("height - radius: \(y)")
            v = -v * 0.8
            print("-v * 0.8: \(v)")
        }
        ball.center = CGPoint(x: ball.center.x, y: y)
        
    }
}
