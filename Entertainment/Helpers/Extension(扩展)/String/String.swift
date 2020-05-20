//
//  String.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/7/19.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /// 是否包含中文
    func isIncludeChineseIn() -> Bool {
        for (_, value) in self.enumerated() {
            if "\u{4E00}" <= value && value <= "\u{9FA5}" {
                return true
            }
        }
        
        return false
    }
    
    /// 过滤字符串中的特殊符号
    func filter() -> String {
        var str = self
        str = str.replacingOccurrences(of: " ", with: "")
        [",", ".", "?", "!", "<", ">", "，", "。", "？", "、", "：", "；", "《", "》", "（", "）"].forEach { (char) in
            str = str.replacingOccurrences(of: char, with: "")
        }
        return str
    }
    
    func size(font: UIFont) -> CGSize {
        return NSString(string: self).size(withAttributes: [NSAttributedString.Key.font : font])
    }
    
    func size(font: UIFont, maxSize: CGSize, _ spacing: CGFloat = 0) -> CGSize {
     
        let str = NSString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = font
        attributes[.paragraphStyle] = paragraphStyle
        
        return str.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
    }
    
    /// 字符串中包含另一个字符串的判断
    /// - Parameter find: <#find description#>
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
//    /// 字符串转Json对象
//    func exchange() -> JSON {
//        let jsonData:Data = self.data(using: .utf8)!
//        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
//        if array != nil {
//            return JSON(array!)
//        }
//
//        return JSON()
//    }
}
