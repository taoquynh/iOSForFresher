//
//  FirstViewController.swift
//  DemoNavigationController
//
//  Created by Taof on 11/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        button.frame.size = CGSize(width: 100, height: 30)
        button.center = view.center
        button.setTitle("Go to main", for: .normal)
        button.backgroundColor = .black
        // add action
        button.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func onPress(){
        let mainVC = MainViewController()
        let navigation = UINavigationController(rootViewController: mainVC)
        
        present(navigation, animated: true, completion: nil)
    }
    

}
