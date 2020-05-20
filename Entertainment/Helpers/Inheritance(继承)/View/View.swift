//
//  View.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/25.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
