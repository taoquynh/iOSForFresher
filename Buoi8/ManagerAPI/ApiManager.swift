//
//  ApiManager.swift
//  ManageIssue
//
//  Created by Taof on 11/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiManager {
    
    static let shared = ApiManager()
    
    init() {
    }
    
    func getHeaders() -> [String: String] {
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        return ["Authorization": token]
    }
    
}
