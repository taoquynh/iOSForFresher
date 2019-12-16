//
//  UIViewController+Extension.swift
//  ManageIssue
//
//  Created by Taof on 10/14/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupSlideMenuItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "ic-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
    }
    
    func removeSlideMenuItem(){
        self.navigationItem.leftBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
    }
}

