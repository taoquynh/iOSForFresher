//
//  SecondViewController.swift
//  CircularTransition
//
//  Created by Taof on 3/29/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dimissButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dimissButton.layer.cornerRadius = dimissButton.frame.size.width/2
    }
    
    @IBAction func dismissSecondVC(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
