//
//  ClientPath.swift
//  Entertainment
//
//  Created by 吕君 on 2020/4/26.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation

enum API {
    static let Url = "http://49.235.8.136:8084"
    static let TestUrl = "http://192.168.3.141:8082"
}

enum ClientPath {
    /// 用户初始化模块
    case login(Login)
    
    enum Login: String {
        // 登录
        case userLogin
    }
}

extension ClientPath {
    var absoluteString: String {
        var prefix = ""
        var suffix = ""
        
        switch self {
        case .login(let sub):
            prefix = "login"
            suffix = sub.rawValue
        }
        return (kIsOnline ? API.Url : API.TestUrl) + "/SmartLingo" + "/\(prefix)/\(suffix)"
    }
}
