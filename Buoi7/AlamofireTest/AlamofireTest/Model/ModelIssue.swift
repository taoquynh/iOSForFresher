//
//  ModelIssue.swift
//  AlamofireTest
//
//  Created by Taof on 1/4/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import Foundation
import ObjectMapper

class ObjectResult: Mappable {
    var responseTime = ""
    var code = 0
    var message = ""
    var data: DataResult?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        responseTime <- map["responseTime"]
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}

class DataResult: Mappable {
    var userType = 0
    var userProfile: UserProfile?
    var token = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        userType <- map["userType"]
        userProfile <- map["userProfile"]
        token <- map["token"]
    }
}

class UserProfile: Mappable {
    var id = ""
    var name = ""
    var phone = ""
    var password = ""
    var avatar = ""
    var role = 0
    var address = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        phone <- map["phone"]
        password <- map["password"]
        avatar <- map["avatar"]
        role <- map["role"]
        address <- map["address"]
    }
}

