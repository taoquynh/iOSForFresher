//
//  UITextView+Extension.swift
//  ManageIssue
//
//  Created by Taof on 10/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func underlined(_ color: UIColor){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    func underView() {
        let bottomView = UIView()
        bottomView.frame = CGRect(x: 0, y: self.frame.size.height, width: self.frame.size.width, height: 1.5)
        bottomView.backgroundColor = UIColor.mainBrown()
        self.addSubview(bottomView)
    }
    func borderLine(){
        self.layer.cornerRadius = 5
        self.borderStyle = .none
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func viewMode(){
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        self.leftViewMode = UITextField.ViewMode.always
        self.rightViewMode = UITextField.ViewMode.always
    }
}
