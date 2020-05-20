//
//  UITableView+Chain.swift
//  Entertainment
//
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UITableView {
    @discardableResult
    func delegate(_ target: Any) -> Self {
        self.delegate = target as? UITableViewDelegate
        self.dataSource = target as? UITableViewDataSource

        self.showsVerticalScrollIndicator(false)
        self.separatorStyle(.none)
        return self
    }

    @discardableResult
    func showsVerticalScrollIndicator(_ show: Bool) -> Self {
        self.showsVerticalScrollIndicator = show
        return self
    }

    @discardableResult
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = style
        return self
    }

    @discardableResult
    func register(_ cellClass: Swift.AnyClass?, identifier: String) -> Self {
        self.register(cellClass, forCellReuseIdentifier: identifier)
        return self
    }
}
