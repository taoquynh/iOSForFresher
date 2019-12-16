//
//  NetworkController.swift
//  DemoJSONService
//
//  Created by Tào Quỳnh  on 9/21/18.
//  Copyright © 2018 Tào Quỳnh . All rights reserved.
//

import Foundation

// Chua thong tin doi tuong User
struct User {
    let name: String?
    let profileImageURL: String?
    let repulation: Int?
}

// Chua thong tin doi tuong Question
struct Question {
    let title: String
    let score: Int
    let tag: [String]
    let date: Date
    let owner: User?
}

class NetworkController {
    
    //Bien chua den JSON Service URL
    static let questionURL = "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow"
    
    // Ham de load du lieu
    func load(urlString: String, withCompletion completion: @escaping ([Any]?) -> Void) {
        
        // Khoi tao cau hinh cho URLSession
        let sessionConfiguration = URLSessionConfiguration.ephemeral
        
        // Khoi tao va cau hinh Url
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        
        // Khoi tao doi tuong URL
        let url = URL(string: urlString)
        
        // Khoi tao task de thuc hien viec lay du lieu
        let task = session.dataTask(with: url!) { (data, RLResponse, error) in
            
            // Kiem tra du lieu tra ve co bi nil hay khong
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Lay ra ket qua
            var result: [Any] = []
            
//            // Parser data to JSON
//            let rawString = String.init(data: data, encoding: String.Encoding.utf8)
//            print(rawString!)
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            let itemArray = json!["items"] as! [Any]
            
            // Duyet tung item de build thanh doi tuong Question
            for item in itemArray {
                let dictItem = item as! [String: Any]
                let dictOwnder = dictItem["owner"] as! [String: Any]
                let name = dictOwnder["display_name"] as! String
                let profileImage = dictOwnder["profile_image"] as? String
                let reputation = dictOwnder["reputation"] as! NSNumber
                
                let user = User(name: name, profileImageURL: profileImage, repulation: reputation.intValue)
                
                let title = dictItem["title"] as! String
                let score = dictItem["score"] as! NSNumber
                let tags = dictItem["tags"] as! [String]
                let date = dictItem["last_edit_date"] as! NSNumber
                
                let realDate = Date.init(timeIntervalSince1970: date.doubleValue)
                
                let question = Question(title: title, score: score.intValue, tag: tags, date: realDate, owner: user)
                
                result.append(question)
                print(user)
            }
            completion(result)
        }
        task.resume()
    }
}











