//
//  SwitchViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/4/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let checkSwitch = UISwitch()
        view.addSubview(checkSwitch)
        
        checkSwitch.translatesAutoresizingMaskIntoConstraints = false
        checkSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        checkSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        checkSwitch.addTarget(self, action: #selector(checkAction), for: .valueChanged)
        checkSwitch.isOn = true
        
        checkSwitch.onTintColor = UIColor.mainPink()
        
    }

    @IBAction func genderDidChange(_ sender: Any) {
        
        // eps kieu sender ve UISwitch
        if let genderSwitch = sender as? UISwitch {
            print("This is switch")
            print(genderSwitch.isOn)
            if genderSwitch.isOn {
                print("On")
            } else {
                print("Off")
            }
        } else {
            print("No")
        }
    }
    
    @objc func checkAction() {
        print("abc")
    }
}
