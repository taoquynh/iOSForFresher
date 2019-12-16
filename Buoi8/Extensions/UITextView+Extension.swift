//
//  UITextView+Extension.swift
//  ManageIssue
//
//  Created by Taof on 10/23/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit
import Stevia

extension UITextView {
    
    func underlined(minWidth: CGFloat, y: CGFloat){
        let bottomLine = CALayer()
        for i in self.layer.sublayers! {
            print(i)
        }
        bottomLine.frame = CGRect(x: 0.0, y: y, width: minWidth, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        self.layer.addSublayer(bottomLine)
    }
    
    func dynamicHeight(){
        self.sizeToFit()
        self.isScrollEnabled = false
        self.heightConstraint!.constant = self.contentSize.height
    }
    
    func borderLine(){
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
