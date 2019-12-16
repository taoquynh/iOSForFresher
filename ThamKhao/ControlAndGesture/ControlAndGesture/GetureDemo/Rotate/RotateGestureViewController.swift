//
//  RotateGestureViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/10/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class RotateGestureViewController: UIViewController {

    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        navigationItem.title = "Rotate gesture"
    }
    
    func setView(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate(_:)))
        squareView.addGestureRecognizer(rotateGesture)
    }
    
    @objc func rotate(_ gesture: UIRotationGestureRecognizer){
        if gesture.state == .ended{
            squareView.transform = CGAffineTransform.identity
        }else{
            squareView.transform = CGAffineTransform.init(rotationAngle: gesture.rotation)
        }
    }
}
