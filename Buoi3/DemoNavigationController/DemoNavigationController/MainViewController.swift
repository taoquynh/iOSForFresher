//
//  MainViewController.swift
//  DemoNavigationController
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        // c1
        title = "Main View Controller"
        
        // c2
        navigationItem.title = "Main ViewController"
        
        // barButton
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nextToScreen))
        navigationItem.rightBarButtonItem = addButton
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dimiss", style: .done, target: self, action: #selector(dimiss))
    }
    
    @objc func dimiss(){
        dismiss(animated: true, completion: nil)
    }

    @objc func nextToScreen(){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
