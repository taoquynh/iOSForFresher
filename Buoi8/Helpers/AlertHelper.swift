//
//  AlertHelper.swift
//  ManageIssue
//
//  Created by Taof on 11/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {
    
    class func sorry(message: String, viewController: UIViewController?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Harder App", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            
            viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    class func confirmOrCancel(message: String, viewController: UIViewController?, success: @escaping () -> Void){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Harder App", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                success()
            }
            let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)

            alert.addAction(action)
            alert.addAction(cancel)
            
            viewController?.present(alert, animated: true, completion: nil)
        }
    }
    
}
