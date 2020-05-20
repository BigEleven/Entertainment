//
//  UIScreen+Frame.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit.UIScreen

public extension UIScreen {
    static var size: CGSize { return main.bounds.size }
    static var width: CGFloat { return size.width }
    static var height: CGFloat { return size.height }
}
