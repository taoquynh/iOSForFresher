//
//  Result.swift
//  ItunesConnect
//
//  Created by Taof on 4/24/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

//Encodable - dùng cho mã hóa
//Decodable - dùng cho giải mã
//Codable - dùng cho cả mã hóa và giải mã
//Chúng hỗ trợ cho cả class, struct và enum.

class Result: Codable {
    var trackName: String?
    var artistName: String?
    var trackPrice: Double?
    var country: String?
    var artworkUrl100: String?
    var type: String?
    var previewUrl: String?
    var primaryGenreName: String?
    
    init(trackName: String, artistName: String, trackPrice: Double, country: String?, artworkUrl100: String?, type: String, previewUrl: String, primaryGenerName: String) {
        self.trackName = trackName
        self.artistName = artistName
        self.trackPrice = trackPrice
        self.country = country
        self.artworkUrl100 = artworkUrl100
        self.type = type
        self.previewUrl = previewUrl
        self.primaryGenreName = primaryGenerName
    }
}

class ResultObject: Codable {
    var resultCount: Int = 0
    var results = [Result]()
    
    // phải đặt static 
    static func parseData(_ data: Data) -> [Result] {
        // sử dụng try catch để log error
        // xử lý code đặt sau try nằm trong do, nếu code điều kiện thỏa thì thực hiện, nếu gặp lỗi thì thực hiện catch
        
        // Cach 1
        //        do{
        //            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]{
        //                print(json)
        //
        //                if let resultCount = json["resultCount"] as? Int, let results = json["results"] as? [[String: Any]]{
        //                    for result in results{
        //                        let trackName = result["trackName"] as? String
        //                        print(trackName)
        //
        //                        let primaryGenreName = result["primaryGenreName"] as? String
        //                        print(primaryGenreName)
        //                    }
        //                }
        //
        //            }
        //        }catch{
        //            print(error.localizedDescription)
        //        }
        
        
        // Cach 2
        do {
            let decoder = JSONDecoder()
            let resultObject = try decoder.decode(ResultObject.self, from: data)
            print(resultObject.results)
            return resultObject.results
        } catch {
            print("JSON Error: \(error)")
            return []
        }
    }
}
