//
//  UIView+Frame.swift
//  Entertainment
//
//  Created by Elevne on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit.UIView

private extension UIView {
    var origin: CGPoint { get { return frame.origin } set { frame.origin = newValue } }
    var size: CGSize { get { return frame.size } set { frame.size = newValue } }
}

extension UIView {
    var x: CGFloat { get { return origin.x } set { origin.x = newValue } }
    var y: CGFloat { get { return origin.y } set { origin.y = newValue } }
    var width: CGFloat { get { return size.width } set { size.width = newValue } }
    var height: CGFloat { get { return size.height } set { size.height = newValue } }
}

extension UIView {
    var top: CGFloat { get { return origin.y } set { origin.y = newValue } }
    var left: CGFloat { get { return origin.x } set { origin.x = newValue } }
    var right: CGFloat { get { return origin.x + size.width } set { origin.x = newValue - size.width } }
    var bottom: CGFloat { get { return origin.y + size.height } set { origin.y = newValue - size.height } }
}

extension UIView {
    // MARK: 内中心和外中心
    var centerInside: CGPoint { return CGPoint(x: size.width / 2, y: size.height / 2) }
}
