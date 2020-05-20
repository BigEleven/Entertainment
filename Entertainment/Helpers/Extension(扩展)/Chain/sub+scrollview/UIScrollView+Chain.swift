//
//  UIScrollView+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UIScrollView {
    @discardableResult
    func delegate(_ target: Any) -> Self {
        self.delegate = target as? UIScrollViewDelegate
        self.showsVerticalScrollIndicator(false)
        self.showsHorizontalScrollIndicator(false)
        self.autoresizesSubviews(true)
        return self
    }

    @discardableResult
    func showsVerticalScrollIndicator(_ show: Bool) -> Self {
        self.showsVerticalScrollIndicator = show
        return self
    }

    @discardableResult
    func contentSize(_ size: CGSize) -> Self {
        self.contentSize = size
        return self
    }

    @discardableResult
    func showsHorizontalScrollIndicator(_ show: Bool) -> Self {
        self.showsHorizontalScrollIndicator = show
        return self
    }

    @discardableResult
    func autoresizesSubviews(_ autoresizesSubviews: Bool) -> Self {
        self.autoresizesSubviews = autoresizesSubviews
        return self
    }
}
