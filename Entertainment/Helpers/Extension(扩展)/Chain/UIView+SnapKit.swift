//
//  UIView+Snp.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/10/15.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    func makeConstraints(snapKitMaker: (ConstraintMaker) -> Void) {
        self.snp.makeConstraints { (make) in
            snapKitMaker(make)
        }
    }
    
    func remakeConstraints(snapKitMaker: (ConstraintMaker) -> Void) {
        self.snp.remakeConstraints { (make) in
            snapKitMaker(make)
        }
    }
    
    func updateConstraints(snapKitMaker: (ConstraintMaker) -> Void) {
        self.snp.updateConstraints { (make) in
            snapKitMaker(make)
        }
    }
    
    func removeConstraints() {
        self.snp.removeConstraints()
    }
}
