//
//  Font.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/11/1.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit.UIFont

enum LJFont {
    case montserrat(Montserrat)
    case sourceHanSansCN(SourceHanSansCN)
    case stHeitiSC(STHeitiSC)
    
    enum Montserrat: String {
        case Bold
        case Regular
        case Light
    }
    
    enum SourceHanSansCN: String {
        case Bold
        case Regular
        case Light
    }
    
    enum STHeitiSC: String {
        case Light
    }
    
    var font: String {
        var prefix = ""
        var suffix = ""
        
        switch self {
        case .montserrat(let sub):
            prefix = "Montserrat"
            suffix = sub.rawValue
        case .sourceHanSansCN(let sub):
            prefix = "SourceHanSansCN"
            suffix = sub.rawValue
        case .stHeitiSC(let sub):
            prefix = "STHeitiSC"
            suffix = sub.rawValue
        }
        return prefix + "-" + suffix
    }
}

extension UIFont {
    convenience init(_ font: LJFont, _ size: CGFloat) {
        self.init(name: font.font, size: size)!
    }
}
