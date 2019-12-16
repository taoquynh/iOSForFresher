//
//  GetIssue.swift
//  ManageIssue
//
//  Created by Taof on 11/7/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ApiManager {
    func getListIssue(success: @escaping (ResultIssue?) -> Void, failure: @escaping (String) -> Void){
        Alamofire.request(ApiNameManager.shared.returnUrl(ApiNameManager.shared.getIssues), method: .get, parameters: nil, encoding: URLEncoding.default, headers: getHeaders()).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let code = json["code"].intValue
                
                if code == 0 {
                    if let data = json["data"].dictionary{
                        let result = JSON(data)
                        if let res = JSON(result).dictionary {
                            let resultIssue = ResultIssue(json: JSON(res))
                            success(resultIssue)
                        }
                    }
                }else{
                    let message = json["message"].stringValue
                    failure(message)
                }
            case .failure(let error):
                print("\n\n===========Error===========")
                print("Error Code: \(error._code)")
                print("Error Messsage: \(error.localizedDescription)")
                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                    print("Server Error: " + str)
                }
                debugPrint(error as Any)
                print("===========================\n\n")
                
                failure(error.localizedDescription)
            }
        }
    }
}
