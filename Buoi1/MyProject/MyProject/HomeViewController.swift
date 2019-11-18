//
//  HomeViewController.swift
//  MyProject
//
//  Created by Taof on 11/18/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView = UIView()
        contentView.frame = CGRect(x: 100, y: 200, width: 100, height: 200)
        contentView.backgroundColor = UIColor.blue
        view.addSubview(contentView)
        
        contentView.center = view.center
        contentView.frame.size = CGSize(width: 100, height: 100)
        
        contentView.layer.cornerRadius = contentView.frame.size.width/2
        contentView.layer.masksToBounds = true
        
    }
    
}
