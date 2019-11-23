//
//  SecondViewController.swift
//  DemoNavigationController
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
        title = "Green View"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
    }
    
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }
    

}
