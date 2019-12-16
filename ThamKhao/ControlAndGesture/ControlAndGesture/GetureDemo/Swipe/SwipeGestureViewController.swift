//
//  SwipeGestureViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 4/10/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class SwipeGestureViewController: UIViewController {

    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        navigationItem.title = "Swipe gesture"
    }
    
    func setupLayout(){
       
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeUp.direction = .up
        squareView.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = .left
        squareView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = .right
        squareView.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeDown.direction = .down
        squareView.addGestureRecognizer(swipeDown)
    }
    
    @objc func swiped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case .up:
                print("up")
                navigationItem.title = "Up"
            case .left:
                print("left")
                navigationItem.title = "Left"
            case .right:
                print("right")
                navigationItem.title = "Right"
            case .down:
                print("down")
                navigationItem.title = "Down"
            default:
                break
            }
        }
    }


}
