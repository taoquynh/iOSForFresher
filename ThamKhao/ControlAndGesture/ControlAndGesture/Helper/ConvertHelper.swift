//
//  ConvertHelper.swift
//  iOSControl
//
//  Created by Tào Quỳnh on 3/29/19.
//  Copyright © 2019 Tào Quỳnh . All rights reserved.
//

import Foundation

class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let string = formatter.string(from: date)
        
        return string
    }
}
