//
//  PanGestureViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/10/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class PanGestureViewController: UIViewController {

    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        navigationItem.title = "Pan gesture"
    }
    
    func setupLayout(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(paned(_:)))
        squareView.addGestureRecognizer(pan)
    }

    @objc func paned(_ pan: UIPanGestureRecognizer){
        if pan.state == .changed{
            squareView.center = pan.location(in: self.view)
        }else{
            squareView.center = view.center
        }
//        print(pan.location(in: self.view))
    }
}
