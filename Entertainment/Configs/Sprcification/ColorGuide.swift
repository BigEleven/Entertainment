//
//  ColorGuide.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import Foundation

import UIKit.UIColor

public extension UIColor {
    /// 背景颜色
    static var blank: UIColor { return UIColor("#FEF4E4") }
    /// 主色调
    static var theme: UIColor { return UIColor("#F6C752") }
    /// 重要效果颜色（主标题、正文、重要效果）
    static var major: UIColor { return UIColor("#2472B3") }
    /// 次要效果颜色（副标题、次要效果）
    static var minor: UIColor { return UIColor("#FF666666") }
    /// 提示文案
    static var prompt: UIColor { return UIColor("#FF9E9E9F") }
    /// 醒目的颜色
    static var striking: UIColor { return UIColor("#FFFF5A3D") }
    /// 分割线颜色
    static var separating: UIColor { return UIColor("#FFE9E9E9") }
    
    /// 随机色
    static var random: UIColor {
        return UIColor(
            red: CGFloat(arc4random_uniform(255)) / CGFloat(255),
            green: CGFloat(arc4random_uniform(255)) / CGFloat(255),
            blue: CGFloat(arc4random_uniform(255)) / CGFloat(255),
            alpha: 1
        )
    }
    
    /// 渐变色
    enum GradientGroup {
        static var theme: [UIColor] { return ["#FF5860D2".color, "#FF775BFF".color] }
        static var faintTheme: [UIColor] { return ["#FF9AA1FF".color, "#FFB2A4F3".color] }
        static var striking: [UIColor] { return ["#FFFF5A3D".color, "#FFFE7B1D".color] }
        static var purpleTheme: [UIColor] { return ["#FF95BBFF".color, "#FFC2AAFF".color] }
        static var faintPurpleTheme: [UIColor] { return ["#FF95BBFF".color, "#FFC2AAFF".color] }
    }
}
