//
//  BallFallsTimer.swift
//  Ball
//
//  Created by Taof on 6/1/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class BallFallsTimer: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    
    deinit {
        print("Deinit BallFallsTimer")
    }
    
    var y: CGFloat = 0
    
    var timer = Timer()
        override func viewDidLoad() {
            super.viewDidLoad()
            y = ballImageView.frame.origin.y
            timer = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        }
    
        @objc func runTimer(){
            if self.ballImageView.frame.origin.y >= view.frame.height - self.ballImageView.bounds.height - 20 {
                timer.invalidate()
                timer = Timer.scheduledTimer(timeInterval: 0.009, target: self, selector: #selector(runBack), userInfo: nil, repeats: true)
            }
            self.ballImageView.frame.origin.y += 5
            print(self.ballImageView.frame.origin.y)
        }
    
    @objc func runBack(){
        if self.ballImageView.frame.origin.y <= y {
            timer.invalidate()
            
        }
        self.ballImageView.frame.origin.y -= 5
        print(self.ballImageView.frame.origin.y)
    }
 
}
