//
//  ThousandNumber.swift
//  Entertainment
//
//  Created by tt on 2019/6/25.
//  Copyright © 2019 eleven. All rights reserved.
//

import Foundation

protocol ThousandStringConvertible {
    var toNumber: NSNumber { get }
}

// MARK: - 给价格类型数据增加千分位
extension ThousandStringConvertible {
    var thousand: String {
        return self.toNumber.thousandString ?? ""
    }
}

extension Double: ThousandStringConvertible {
    var toNumber: NSNumber { return NSNumber(value: self) }
}

extension Float: ThousandStringConvertible {
    var toNumber: NSNumber { return NSNumber(value: self) }
}

extension Int: ThousandStringConvertible {
    var toNumber: NSNumber { return NSNumber(value: self) }
}

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

extension NSNumber {
    var thousandString: String? {
        return NumberFormatter.decimal.string(from: self)
    }
}
