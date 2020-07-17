//
//  AttributedString.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/7/18.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func attributed(color: UIColor? = nil, font: UIFont? = nil, link: String = "") -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        if let color = color {
            attributes[.foregroundColor] = color
        }
        if let font = font {
            attributes[.font] = font
        }
        
        if !link.isEmpty {
            attributes[.link] = link
        }
        
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
}

extension NSMutableAttributedString {
    /// 富文本增加间距
    func spacing(_ spacing: CGFloat = 5, _ alignment: NSTextAlignment = .left) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = alignment
        addAttributes([.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: length))
    }

    
    func appends(_ atts: [NSAttributedString], spacing: CGFloat = 0) {
        atts.forEach { (sub) in
            append(sub)
        }
        
        if spacing > 0 {
            self.spacing(spacing)
        }
    }
}


extension NSAttributedString {
    
    var newline: NSAttributedString {
        return self + NSAttributedString(string: "\n")
    }
    
    var blank: NSAttributedString {
        return self + NSAttributedString(string: " ")
    }
    
    var deleteLine: NSMutableAttributedString {
        let att = NSMutableAttributedString(attributedString: self)
        att.addAttribute(.strikethroughStyle, value: 1, range: NSRange(location: 0, length: length))
        return att
    }
    
    static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
        let mutableLhs = NSMutableAttributedString(attributedString: lhs)
        mutableLhs.append(rhs)
        return mutableLhs
    }
}
