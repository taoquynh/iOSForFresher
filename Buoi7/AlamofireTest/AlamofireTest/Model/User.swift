//
//  User.swift
//  AlamofireTest
//
//  Created by Taof on 12/3/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

//Encodable - dùng cho mã hóa
//Decodable - dùng cho giải mã
//Codable - dùng cho cả mã hóa và giải mã
//Chúng hỗ trợ cho cả class, struct và enum.
class User: Codable {
    var id: String
    var name: String
    var about: String
    
    init(id: String, name: String, about: String) {
        self.id = id
        self.name = name
        self.about = about
    }
}

class ResultObject: Codable {
    var resultCount: Int = 0
    var results = [User]()
    
    static func parseData(_ data: Data) -> [User] {
        do {
            let decoder = JSONDecoder()
            let resultObject = try decoder.decode(ResultObject.self, from: data)
            return resultObject.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
        
//        do{
//            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]{
//                print(json)
//
//                if let resultCount = json["resultCount"] as? Int, let results = json["results"] as? [[String: Any]]{
//                    print(resultCount)
//                    for result in results{
//                        let id = result["id"] as? String
//                        let name = result["name"] as? String
//                        let about = result["about"] as? String
//
//                        print("\(id!), \(name!), \(about!)")
//                    }
//                }
//
//            }
//        }catch{
//            print(error.localizedDescription)
//        }
//
//        return []
    }
}
