//
//  ApiNameManager.swift
//  ManageIssue
//
//  Created by Taof on 11/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

class ApiNameManager {
    // singleton
    
    static let shared = ApiNameManager()
    init() {
    }
    
    let domain = "http://45.118.145.149:8100/"
    
    let login = "login"
    let register = "register"
    let getProfile = "profile"
    let upload = "upload-file"
    let updateProfile = "update-profile"
    let getIssues = "issues?status=-1&keyword="
    let getIssueById = "issues/"
    let createIssue = "create-issue"
    let searchIssue = "issues?"
    
    func returnUrl(_ nameRequest: String) -> String{
        return domain + nameRequest
    }
}
