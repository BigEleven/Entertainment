//
//  Device.swift
//  Entertainment
//
//  Created by 吕君 on 2020/5/18.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import UIKit
import AdSupport

enum Device {
    /// app 版本号
    static let AppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    /// 系统 版本号
    static let PhoneVersion = UIDevice.current.systemVersion
    /// 别名
    static let PhoneName = UIDevice.current.name
    /// 手机型号
    static let PhoneModel = UIDevice.current.model
    /// 广告标识
    static let IDFA = ASIdentifierManager.shared().advertisingIdentifier.uuidString
}

/// 以6的比例设置
enum RatioToIphone6 {
    static let width = UIScreen.width / 375
    static let height = UIScreen.height / 667
}

/// 以6的比例设置
enum RatioToIphoneX {
    static let width = UIScreen.width / 375
    static let height = UIScreen.height / 812
}
