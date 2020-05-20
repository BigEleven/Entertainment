//
//  UIColor+Hex.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import Foundation

import UIKit.UIColor

public extension UIColor {
    
    /// color with hex string
    ///
    /// - Parameter hexadecimal: hexadecimal code of color
    convenience init(_ hexadecimal: String) {
        // 删除头尾的多余字符
        let formatted = hexadecimal
            .replacingOccurrences(of: "[^0-9a-fA-F]*$", with: "", options: .regularExpression)
            .replacingOccurrences(of: ".*?(?=[0-9a-fA-F]*$)", with: "", options: .regularExpression)
        
        switch formatted.count {
        case 3:     self.init(hex3: formatted)
        case 4:     self.init(hex4: formatted)
        case 6:     self.init(hex6: formatted)
        case 8:     self.init(hex8: formatted)
        default:    fatalError("'\(hexadecimal)' is not a hex string")
        }
    }
    // hex3: 3位16进制颜色码 (rgb)
    private convenience init(hex3: String) {
        self.init(hex4: "F" + hex3)
    }
    // hex4: 4位16进制颜色码 (rgba)
    private convenience init(hex4: String) {
        let hex = hex4.toHex
        var a = (hex & 0xF000) >> 12
        var r = (hex & 0x0F00) >> 8
        var g = (hex & 0x00F0) >> 4
        var b = (hex & 0x000F) >> 0
        r = (r << 4) + r
        g = (g << 4) + g
        b = (b << 4) + b
        a = (a << 4) + a
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    // hex6: 6位16进制颜色码 (rrggbb)
    private convenience init(hex6: String) {
        self.init(hex8: "FF" + hex6)
    }
    // hex8: 8位16进制颜色码 (rrggbbaa)
    private convenience init(hex8: String) {
        let hex = hex8.toHex
        let a = (hex & 0xFF000000) >> 24
        let r = (hex & 0x00FF0000) >> 16
        let g = (hex & 0x0000FF00) >> 8
        let b = (hex & 0x000000FF) >> 0
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
    }
}

fileprivate extension String {
    /// 16进制字符串转换成数字
    var toHex: UInt32 {
        var result: UInt32 = 0
        guard Scanner(string: self).scanHexInt32(&result) else {
            fatalError("'\(self)' is not a hex string")
        }
        return result
    }
}

extension String {
    var color: UIColor {
        return UIColor(self)
    }
}
