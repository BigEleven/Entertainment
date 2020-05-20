//
//  System.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit

enum Systems {
    /// 状态栏高度
    static let StateHeight = UIApplication.shared.statusBarFrame.height
    /// 导航栏高度
    static let NavigationHeight = (StateHeight + 44)
}

/// 自定义日志输出
///
/// - Parameters:
///   - object:     打印对象
///   - file:       本次打印的文件名称
///   - function:   本次打印的方法
///   - line:       本次打印在文件中的代码行数
func LJDebug<T>(_ object: T?) {
    #if DEBUG
    guard let object = object else { return }
    print("🐱 \(#file.components(separatedBy: "/").last ?? "")(\(#line)) :: \(#function)")
    print("🐮 *** BEGIN ***")
    print(object)
    print("🐶 ***  END  ***")
    #endif
}
