//
//  UICollectionView+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UICollectionView {

    @discardableResult
    func delegate(_ target: Any) -> Self {
        self.delegate = target as? UICollectionViewDelegate
        self.dataSource = target as? UICollectionViewDataSource
        self.showsVerticalScrollIndicator(false)
        self.showsHorizontalScrollIndicator(false)
        return self
    }

    @discardableResult
    func showsVerticalScrollIndicator(_ show: Bool) -> Self {
        self.showsVerticalScrollIndicator = show
        return self
    }

    @discardableResult
    func showsHorizontalScrollIndicator(_ show: Bool) -> Self {
        self.showsHorizontalScrollIndicator = show
        return self
    }
}
