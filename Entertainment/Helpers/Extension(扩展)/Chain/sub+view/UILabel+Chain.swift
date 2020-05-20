//
//  UILabel+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UILabel {

    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        /// 默认设置文字居中
        self.textAlignment = .center
        return self
    }

    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func font(_ font: CGFloat, _ bold: Bool = false) -> Self {
        if bold == true {
            self.font = UIFont.boldSystemFont(ofSize: font)
        } else {
            self.font = UIFont.systemFont(ofSize: font)
        }

        return self
    }
    @discardableResult
    func textFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    /// 超出宽度自动缩放字体
    @discardableResult
    func adjust(_ adjust: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjust
        return self
    }
    
    @discardableResult
    func numberOfLines(_ numberOfLines: Int = 0) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString) -> Self {
        self.attributedText = attributedText
        return self
    }
    
}

extension UILabel {
    func size(buttonSizeForString str: String) -> CGSize {
        return NSString(string: str).size(withAttributes: [NSAttributedString.Key.font : UIFont(name: self.font.fontName, size: self.font.pointSize) as Any])
    }
}
