//
//  ViewController.swift
//  LayoutUseNSContraint
//
//  Created by Taof on 11/21/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout(){
        view.addSubview(containerView)
        containerView.addSubview(blueView)
        blueView.addSubview(topView)
        blueView.addSubview(bottomView)
        
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        blueView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 64).isActive = true
        blueView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        blueView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        blueView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        
        
        topView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 20).isActive = true
        topView.leftAnchor.constraint(equalTo: blueView.leftAnchor, constant: 20).isActive = true
        topView.rightAnchor.constraint(equalTo: blueView.rightAnchor, constant: -20).isActive = true
        
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
        bottomView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 0).isActive = true
        bottomView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1).isActive = true
        bottomView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 1).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: -20).isActive = true
    }
    
}

