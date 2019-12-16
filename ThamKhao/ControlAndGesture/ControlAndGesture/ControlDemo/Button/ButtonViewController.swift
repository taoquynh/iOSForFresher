//
//  ButtonViewController.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 3/25/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var microButton: UIButton!
    
    var isCheck = false
    let goButton: UIButton = {
    
        let button = UIButton(type: .custom)
        // set translatesAutoresizingMaskIntoConstraints = false de layout bang code
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go", for: .normal)
        button.setTitle("Going", for: .highlighted)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 20
        return button
    }()
    
    let nextButton: UIButton = {
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
		button.setImage(UIImage(named: "next"), for: .normal )
		button.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        button.layer.cornerRadius = 20
        
        return button
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white
        button.setImage(UIImage(named: "previous"), for: .normal)
		button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        button.layer.cornerRadius = 20
        
        return button
    }()
	
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Button"
        setupButton()
        thirdView.backgroundColor = UIColor.clear
    }
    
    func setupButton() {
        
        // goButton
        thirdView.addSubview(goButton)
        goButton.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 16).isActive = true
        goButton.leftAnchor.constraint(equalTo: thirdView.leftAnchor, constant: 16).isActive = true
        goButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        goButton.addTarget(self, action: #selector(goPress), for: .touchUpInside)
        
        // nextButton
        thirdView.addSubview(nextButton)
        thirdView.addSubview(previousButton)
        
        // previousButton
        previousButton.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 16).isActive = true
        previousButton.leftAnchor.constraint(equalTo: thirdView.leftAnchor, constant: 16).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        previousButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: goButton.bottomAnchor, constant: 16).isActive = true
        nextButton.leftAnchor.constraint(equalTo: previousButton.rightAnchor, constant: 8).isActive = true
        nextButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        previousButton.addTarget(self, action: #selector(previousPress), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextPress), for: .touchUpInside)
        
        microButton.layer.cornerRadius = 20
    }
    
    @objc func goPress() {
        print("Go")
    }
    
    @objc func previousPress() {
        if isCheck {
            previousButton.backgroundColor = .white
            isCheck = false
        }else{
            previousButton.backgroundColor = .green
            isCheck = true
        }
    }
    
    @objc func nextPress() {
        if isCheck {
            nextButton.backgroundColor = .white
            isCheck = false
        }else{
            nextButton.backgroundColor = .green
            isCheck = true
        }
    }

    @IBAction func microPress(_ sender: Any) {
        if isCheck {
            microButton.setImage(UIImage(named: "micro"), for: .normal)
            isCheck = false
        }else{
            microButton.setImage(UIImage(named: "micro-red"), for: .normal)
            isCheck = true
        }
    }
    
}
