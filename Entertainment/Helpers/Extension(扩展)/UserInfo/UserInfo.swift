//
//  UserInfo.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    /// token
    var token: String? {
        get {
            return string(forKey: #function)
        }
        set {
            setValue(newValue, forKey: #function)
        }
    }
    
    /// 用户ID
    var accountId: Int {
        get {
            return integer(forKey: #function)
        }
        set {
            setValue(newValue, forKey: #function)
        }
    }
    
    /// 用户手机号
    var mobile: String? {
        get {
            return string(forKey: #function)
        }
        set {
            setValue(newValue, forKey: #function)
        }
    }
    
    /// 用户登录密码
    var password: String? {
        get {
            return string(forKey: #function)
        }
        set {
            setValue(newValue, forKey: #function)
        }
    }
    
    /// 用户昵称
    var name: String? {
        get {
            return string(forKey: #function)
        }
        set {
            setValue(newValue, forKey: #function)
        }
    }
    
    /// 用户头像
    var picture: String? {
        get {
            return string(forKey: #function)
        }
        set {
            setValue(newValue, forKey: #function)
        }
    }
}
