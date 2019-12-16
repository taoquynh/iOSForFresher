//
//  ApiManager+SearchIssue.swift
//  ManageIssue
//
//  Created by Taof on 11/12/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

extension ApiManager {
    func searchIssue(status: Int, keyword: String, success: @escaping (ResultIssue?) -> Void, failure: @escaping (String) -> Void){
        let urlString = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? keyword
        
        let url = ApiNameManager.shared.returnUrl(ApiNameManager.shared.searchIssue) + "status=\(status)&keyword=\(urlString)"
        print("url: \(url)")
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: getHeaders()).responseJSON { (response) in
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
