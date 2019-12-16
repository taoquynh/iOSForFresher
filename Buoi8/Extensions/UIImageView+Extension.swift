//
//  UIImageView+Extension.swift
//  ManageIssue
//
//  Created by Taof on 11/7/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(urlString: String){
        var string = ""
        if urlString.starts(with: "http") {
            string = urlString
        }else{
            string = ApiNameManager.shared.domain + urlString
        }
        
        let url = URL(string: string)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
