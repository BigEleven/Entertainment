//
//  UserAuthorization.swift
//  NihaoCafe
//
//  Created by That's Mandarin Video Editor  on 2019/8/9.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UserNotifications
import UIKit
/// 用户授权
struct UserAuthorization {
    static let settingUrl = URL(string: UIApplication.openSettingsURLString)!
    private init() {}
}

extension UserAuthorization {
    /// 打开应用系统设置页面
    static func userAuthorization() {
        guard UIApplication.shared.canOpenURL(settingUrl) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(settingUrl, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(settingUrl)
        }
    }
}

// MARK: - 系统通知权限
extension UserAuthorization {
    /// 系统通知权限
    enum RemoteNotification {
        /// 切换通知权限注册状态
        static var isRegistered: Bool {
            get {
                return UIApplication.shared.isRegisteredForRemoteNotifications
            }
            set {
                newValue ? UIApplication.shared.registerForRemoteNotifications()
                    : UIApplication.shared.unregisterForRemoteNotifications()
            }
        }
        /// 判断用户是否开放系统通知权限
        static func isEnabled(_ callback: @escaping (Bool) -> Void) {
            if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().getNotificationSettings { (settings) in
                    // 当前不在主线程，切换至主线程
                    DispatchQueue.main.async {
                        // 判断用户是否开启通知权限
                        callback(settings.authorizationStatus == .authorized)
                    }
                }
            } else {
                // 判断用户是否开启通知权限
                callback(UIApplication.shared.currentUserNotificationSettings?.types != .none)
            }
            
        }
    }
}
