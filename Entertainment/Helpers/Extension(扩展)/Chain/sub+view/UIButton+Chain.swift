//
//  UIButton+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UIButton {

    @discardableResult
    func text(_ text: String, _ controlState: UIControl.State = .normal) -> Self {
        self.setTitle(text, for: controlState)
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor, _ controlState: UIControl.State = .normal) -> Self {
        self.setTitleColor(color, for: controlState)
        return self
    }

    @discardableResult
    func textFont(_ font: CGFloat, _ bold: Bool = false ) -> Self {
        if bold == true {
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: font)
        } else {
            self.titleLabel?.font = UIFont.systemFont(ofSize: font)
        }
        return self
    }
    
    @discardableResult
    func textFont(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }

    @discardableResult
    func image(_ image: String, _ controlState: UIControl.State = .normal, _ isBackground: Bool = false) -> Self {
        if isBackground == true {
            self.setBackgroundImage(UIImage(named: image), for: controlState)
        } else {
            self.setImage(UIImage(named: image), for: controlState)
        }
        return self
    }
    @discardableResult
    func setBackgroundImage(_ image: String, _ controlState: UIControl.State = .normal) -> Self {
        self.setBackgroundImage(UIImage(named: image), for: controlState)
        return self
    }
    
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString, _ controlState: UIControl.State = .normal) -> Self {
        self.setAttributedTitle(attributedText, for: controlState)
        return self
    }
    
    @discardableResult
    func titleEdgeInsets(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment, offset: CGFloat = 10) -> Self {
        self.contentHorizontalAlignment = .left
        switch contentHorizontalAlignment {
        case .left:
            self.titleEdgeInsets = UIEdgeInsets(top: -5, left: offset, bottom: 0, right: 0)
        case .right:
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: offset)
        default:
            return self
        }
        return self
    }
}
