//
//  TapGesturesViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/10/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class TapGesturesViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    var isCheck = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tap gesture"
        colorView.backgroundColor = .cyan
    }

    @IBAction func viewDidTap(_ sender: Any) {
        if isCheck {
            colorView.backgroundColor = .green
            isCheck = false
        }else{
            colorView.backgroundColor = .cyan
            isCheck = true
        }
    }
}
