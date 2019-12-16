//
//  RegisterAPI.swift
//  ManageIssue
//
//  Created by Taof on 11/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ApiManager {
    
    func register(name: String, phone: String, password: String, success: @escaping () -> Void, failure: @escaping (String) -> Void) {
        let params = [
            "name": name,
            "phone": phone,
            "password": password
        ]
        
        print(params.description)
        Alamofire.request(ApiNameManager.shared.returnUrl(ApiNameManager.shared.register), method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(response.response?.statusCode)
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let code = json["code"].intValue
                
                if code == 0{
                    if let data = json["data"].dictionary, let token = data["token"]?.stringValue{
                        let userDefault = UserDefaults.standard
                        userDefault.set(token, forKey: "token")
                        success()
                    }
                }else{
                    let message = json["message"].stringValue
                    failure(message)
                }
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
