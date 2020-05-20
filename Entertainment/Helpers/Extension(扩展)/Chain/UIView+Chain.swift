//
//  UIView+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/4.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - 所有视图控件属性的链式封装
extension Chainable where Self: UIView {
    @discardableResult
    public func config(_ config: (Self) -> Void) -> Self {
        config(self)
        return self
    }

    @discardableResult
    public func add(to toSuperView: UIView) -> Self {
        toSuperView.addSubview(self)
        return self
    }

    @discardableResult
    public func bgColor(_ color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }

    @discardableResult
    public func frame(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> Self {
        self.frame = CGRect(x: x, y: y, width: width, height: height)
        return self
    }

    @discardableResult
    public func x(_ x: CGFloat) -> Self {
        var frame = self.frame
        frame.origin.x = x
        self.frame = frame
        return self
    }

    @discardableResult
    public func y(_ y: CGFloat) -> Self {
        var frame = self.frame
        frame.origin.y = y
        self.frame = frame
        return self
    }

    @discardableResult
    public func width(_ width: CGFloat) -> Self {
        var frame = self.frame
        frame.size.width = width
        self.frame = frame
        return self
    }

    @discardableResult
    public func height(_ height: CGFloat) -> Self {
        var frame = self.frame
        frame.size.height = height
        self.frame = frame
        return self
    }

    /// 设置圆角
    @discardableResult
    public func radius(_ radius: CGFloat, _ masksToBounds: Bool = false) -> Self {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = masksToBounds
        return self
    }
    /// 设置边框颜色
    @discardableResult
    public func border(_ width: CGFloat, _ color: UIColor) -> Self {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        return self
    }
    
    
    /// 设置透明度
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }

    /// 设置投影
    @discardableResult
    public func shadow(_ color: UIColor, _ shadowRadius: CGFloat = 0, _ shadowOffset: CGSize = CGSize.zero) -> Self {
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = color.cgColor
        return self
    }
}

extension UIView {
    
    enum MaskedCorners {
        case left
        case top
        case right
        case bottom
    }
    
    func maskedCorners(_ size: CGFloat, _ direction: MaskedCorners) {
        self.layer.cornerRadius = size
        
        switch direction {
        case .right:
            layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMaxXMinYCorner.rawValue | CACornerMask.layerMaxXMaxYCorner.rawValue)
        case .top:
            layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMinYCorner.rawValue | CACornerMask.layerMaxXMinYCorner.rawValue)
        case .left:
            layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMinYCorner.rawValue | CACornerMask.layerMinXMaxYCorner.rawValue)
        case .bottom:
            layer.maskedCorners = CACornerMask(rawValue: CACornerMask.layerMinXMaxYCorner.rawValue | CACornerMask.layerMaxXMaxYCorner.rawValue)
        }
        layer.masksToBounds = true
    }
}
