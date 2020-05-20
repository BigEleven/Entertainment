//
//  Color+RGBA.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit.UIColor

extension UIColor {
    /// color with RGB components
    convenience init(rgbCode rgb: RGBCode) {
        self.init(red: rgb.red / 255.0,
                  green: rgb.green / 255.0,
                  blue: rgb.blue / 255.0,
                  alpha: rgb.alpha / 100.0)
    }
}

struct RGBCode {
    let red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat
    init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 100) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}
