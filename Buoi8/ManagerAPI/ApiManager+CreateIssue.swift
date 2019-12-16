//
//  ApiManager+CreateIssue.swift
//  ManageIssue
//
//  Created by Taof on 11/8/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ApiManager {
    func createIssue(issue: Issue, success: @escaping () -> Void, failure: @escaping (String) -> Void){
        
        let params = [
            "title": issue.title,
            "content": issue.content,
            "address": issue.address,
            "media": issue.media
            ] as [String : Any]
        
        Alamofire.request(ApiNameManager.shared.returnUrl(ApiNameManager.shared.createIssue), method: .post, parameters: params, encoding: JSONEncoding.default, headers: getHeaders()).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["code"].intValue
                if code == 0 {
                    success()
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
