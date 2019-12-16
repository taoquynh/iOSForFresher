//
//  UploadFileAPI.swift
//  ManageIssue
//
//  Created by Taof on 11/6/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

enum MimeType: String{
    case image = "image/jpeg"
}

extension ApiManager {
    func upload(image: UIImage, success: @escaping (String)->(), failure: @escaping (String)->()){
        
        // tạo một hàm body request
        func createBody(boundary: String,
                        data: Data,
                        mimeType: MimeType,
                        filename: String) -> Data {
            let body = NSMutableData()
            
            let boundaryPrefix = "--\(boundary)\r\n"
            
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"fileData\"; filename=\"\(filename)\"\r\n")
            body.appendString("Content-Type: \(mimeType.rawValue)\r\n\r\n")
            body.append(data)
            body.appendString("\r\n")
            body.appendString("--".appending(boundary.appending("--")))
            
            return body as Data
        }
        
        // url
        var request  = URLRequest(url: URL(string: ApiNameManager.shared.returnUrl(ApiNameManager.shared.upload))!)
        
        // method
        request.httpMethod = "POST"
        
        //
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        // header
        request.allHTTPHeaderFields = getHeaders()
        
        // truyền dữ liệu vào body
        request.httpBody = createBody(boundary: boundary,
                                      data: image.jpegData(compressionQuality: 0.1)!,
                                      mimeType: .image,
                                      filename: "quynhtao")
        
        // tạo một dataTask, với nhiệm vụ là gửi request, dữ liệu trả về là data, response và error
        let dataTask = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            // SafeDispatch để gọi hàm trở lại foreground sau khi xử lý request
            SafeDispatch.async(forWork: {
                if error == nil{
                    print("response \(response)")
                    do{
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]{
                            print("json \(json)")
                            
                            // đọc dữ liệu từ json
                            if let code = json["code"] as? Int, let url = json["data"] as? String, code == 0, !url.isEmpty{
                                success(url)
                            }else{
                                failure(json["message"] as? String ?? "")
                            }
                           
                        }else{
                            failure("error")
                        }
                    }catch{
                        failure(error.localizedDescription)
                    }
                }else{
                    failure(error!.localizedDescription)
                }
            })
        })
        
        // gọi resume để chạy hàm dataTask
        dataTask.resume()
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
