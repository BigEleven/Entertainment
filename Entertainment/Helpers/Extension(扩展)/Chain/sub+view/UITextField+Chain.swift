//
//  UITextField+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UITextField {
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


    @discardableResult
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }

    @discardableResult
    func textColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }

    @discardableResult
    func placeholder(_ placeholder: String) -> Self {
        self.placeholder = placeholder
        return self
    }

    @discardableResult
    func returnKeyType(_ type: UIReturnKeyType = .done) -> Self {
        self.returnKeyType = type
        return self
    }

    @discardableResult
    func leftSpacing(_ spacing: CGFloat) -> Self {
        self.leftView = UIView().frame(0, 0, spacing, 0)
        self.leftViewMode = .always
        return self
    }

    @discardableResult
    func setOther() -> Self {
        self.borderStyle = .none
        self.clearButtonMode = .whileEditing
        self.returnKeyType(.done)
        return self
    }
}
