//
//  StepperViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/4/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 10
        
        stepper.addTarget(self, action: #selector(changeAction), for: .valueChanged)
    }
    
    @objc func changeAction() {
        title = String(stepper.value)
        
        
    }

}
