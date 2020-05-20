//
//  SnapKitQuick.swift
//  Entertainment
//
//  Created by 吕君 on 2020/4/27.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import SnapKit

public extension Chainable where Self: UIView {

    var snpleft: ConstraintItem {
        return self.snp.left
    }

    var snpright: ConstraintItem {
        return self.snp.right
    }

    var snptop: ConstraintItem {
        return self.snp.top
    }

    var snpbottom: ConstraintItem {
        return self.snp.bottom
    }

    var snpcenter: ConstraintItem {
        return self.snp.center
    }

    var snpcenter_y: ConstraintItem {
        return self.snp.centerY
    }

    var snpcenter_x: ConstraintItem {
        return self.snp.centerX
    }
}
