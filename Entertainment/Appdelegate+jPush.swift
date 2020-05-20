//
//  Appdelegate+jPush.swift
//  Entertainment
//
//  Created by 吕君 on 2020/5/8.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
//
// MARK: - Helpers
private extension AppDelegate {
    /// 判断应用是否在前台运行
    var isForeground: Bool {
        return UIApplication.shared.applicationState == .active
    }
}

@available(iOS 10.0, *)
private extension UNNotification {
    /// 判断是否是远程通知
    var isRemote: Bool {
        return request.trigger is UNPushNotificationTrigger
    }
}
//
extension AppDelegate {
    func configureJPush(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {

            let entity = JPUSHRegisterEntity()
            entity.types = Int(
                JPAuthorizationOptions.alert.rawValue
                    | JPAuthorizationOptions.badge.rawValue
                    | JPAuthorizationOptions.sound.rawValue
            )

            let systemVersion = Float(UIDevice.current.systemVersion) ?? 0
            if systemVersion >= 10.0 {
                let center = UNUserNotificationCenter.current()
                center.delegate = self
                let type = UNAuthorizationOptions.alert.rawValue | UNAuthorizationOptions.badge.rawValue | UNAuthorizationOptions.sound.rawValue
                center.requestAuthorization(options: UNAuthorizationOptions(rawValue: type)) { (_, _) in

                }
            }

            JPUSHService.register(
                forRemoteNotificationConfig: entity,
                delegate: self
            )

            JPUSHService.setup(
                withOption: launchOptions,
                appKey: SDK.jPush.appId,
                channel: SDK.jPush.channel,
                apsForProduction: true,
                advertisingIdentifier: nil
            )
        }
}

extension AppDelegate: JPUSHRegisterDelegate {
    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, willPresent notification: UNNotification!, withCompletionHandler completionHandler: ((Int) -> Void)!) {
        defer {
            // 前台不调用**completionHandler**方法弹出系统推送
        }

        let userInfo = notification.request.content.userInfo
        LJDebug(userInfo)
        // 判断接收到远程推送
        if notification.isRemote {
            // 极光处理推送
            JPUSHService.handleRemoteNotification(userInfo)
            // 应用处理推送
            handleRemoteNotification(userInfo: userInfo)
        }
    }

    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, didReceive response: UNNotificationResponse!, withCompletionHandler completionHandler: (() -> Void)!) {
        defer {
            // 后台系统推送
            completionHandler()
        }

        let userInfo = response.notification.request.content.userInfo
        LJDebug(userInfo)
        playVoice()
        // 判断接收到远程推送
        if response.notification.isRemote {
            // 极光处理推送
            JPUSHService.handleRemoteNotification(userInfo)
            // 应用处理推送
            handleRemoteNotification(userInfo: userInfo)
        }
    }

    func jpushNotificationCenter(_ center: UNUserNotificationCenter!, openSettingsFor notification: UNNotification!) {

    }

    func jpushNotificationAuthorization(_ status: JPAuthorizationStatus, withInfo info: [AnyHashable : Any]!) {

    }

    func handleRemoteNotification(userInfo: [AnyHashable: Any]) {

    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    /// 注册 APNs
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        JPUSHService.registerDeviceToken(deviceToken)
    }

    /// 注册APNs失败接口
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        LJDebug(error)
    }
}

extension AppDelegate {
    func playVoice() {
        guard let path = Bundle.main.path(forResource: "normal", ofType: "mp3") else {
            return
        }
        
        var audioPlayer: FSAudioStream?
        
        audioPlayer = FSAudioStream(url: URL(fileURLWithPath: path))
        audioPlayer?.volume = 1
        
        audioPlayer?.onFailure = { (error, description) in
        }
        
        audioPlayer?.onCompletion = { () in
        }
        audioPlayer?.play()
    }
}
