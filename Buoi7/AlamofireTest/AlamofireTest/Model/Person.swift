//
//  Person.swift
//  AlamofireTest
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import ObjectMapper

class Person: Mappable {
    var id: String?
    var name: String?
    var about: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        about <- map["about"]
    }
}

class PersonObject: Mappable {
    var resultCount: Int = 0
    var results = [Person]()
    
    required init(map: Map) {
    }
    
    func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results <- map["results"]
    }
}
