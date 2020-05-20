//
//  NotificationManager.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/25.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

/// 该类是为了自动管理观察者的生命周期
class NotificationManager: NSObject {
    /// 通知中心
    let notificationCenter = NotificationCenter.default
    /// 观察者
    weak var observer: AnyObject?
    // MARK: - init
    @discardableResult
    init(_ observer: AnyObject, selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any? = nil) {
        self.observer = observer
        super.init()
        // 在通知中心添加观察者
        notificationCenter.addObserver(observer, selector: aSelector, name: aName, object: anObject)
    }

    deinit {
        guard let observer = observer else {
            return
        }
        // 当token对象释放时，从通知中心移除观察者
        notificationCenter.removeObserver(observer)
    }
}
