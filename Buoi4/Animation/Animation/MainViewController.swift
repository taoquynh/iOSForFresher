//
//  MainViewController.swift
//  Animation
//
//  Created by Taof on 11/25/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var topHeight: NSLayoutConstraint!
    
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer(){
        topHeight.constant += 1
    }
    
}
