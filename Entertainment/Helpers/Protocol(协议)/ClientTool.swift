//
//  LJClient.swift
//  Entertainment
//
//  Created by 吕君 on 2020/4/26.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol ClientTool {
    
    static func request(path: ClientPath, method: HTTPMethod, params: [String: Any]?, completion: @escaping (JSON, Error?) -> Void)
    
    static func upload(path: ClientPath, files: [Data], completion: @escaping (JSON, Error?) -> Void)
    
}

extension ClientTool where Self: BaseViewController {
    
    static func request(path: ClientPath, method: HTTPMethod = .post, params: [String: Any]? = nil, completion: @escaping (JSON, Error?) -> Void) {

        LJDebug("\(path.absoluteString)")
        LJDebug(params)
        
        var headers: [String: String] = [:]
        if UserDefaults.standard.token?.count ?? 0 > 0 {
            headers["Token"] = UserDefaults.standard.token
        }
        
        var parameterEncoding: ParameterEncoding = JSONEncoding.default
        switch method {
        case .get:
            parameterEncoding = URLEncoding.default
        default:
            break
        }
        
        Alamofire.request(path.absoluteString,
                          method: method,
                          parameters: params,
                          encoding: parameterEncoding,
                          headers: headers)
                 .responseJSON { (response) in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            return completion(JSON(), nil)
                        }
                        let result = JSON(data)
                        let code = result["code"].intValue
                        if code == 200 {
                            completion(result, response.error)
                        } else {
                            LJDebug(result["message"].stringValue)
                        }
                    case .failure:
                        LJDebug("")
                    }
        }
    }
    
    static func upload(path: ClientPath, files: [Data], completion: @escaping (JSON, Error?) -> Void) {
        
        var headers: [String: String] = [:]
        if UserDefaults.standard.token?.count ?? 0 > 0 {
            headers["Token"] = UserDefaults.standard.token
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for i in 0..<files.count {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMddHHmmss"
                let string = formatter.string(from: Date())
                let filename = "\(string).jpg"
                multipartFormData.append(files[i], withName: "img", fileName: filename, mimeType: "image/jpeg")
            }
        }, to: path.absoluteString,
           headers: headers) { (response) in
            
            switch response {
            case .success(let upload, _, _):
                upload.responseJSON { (result) in
                    guard let data = result.data else {
                        return completion(JSON(), nil)
                    }
                    
                    let result = JSON(data)
                    completion(result, nil)
                }
            case .failure(_):
                completion(JSON(), nil)
            }
        }
    }
}

