//
//  Button.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/25.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit
import AudioToolbox

class Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}

extension Button {
    
    /// 按钮震动 SystemSoundID ==
    /// kSystemSoundID_Vibrate (标准)
    /// 1519 (短震动)
    /// 1520 (home建震动)
    /// 1521 (三连震)
    func vibration() {
        let soundID: SystemSoundID = 1519
        AudioServicesPlaySystemSound(soundID)
    }
}
