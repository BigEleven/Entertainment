//
//  PKHUDPrompt.swift
//  Entertainment
//
//  Created by 吕君 on 2020/4/27.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import Foundation
import PKHUD

protocol PKHUDPrompt {
    static func prompt(_ text: String, delay: TimeInterval)
}

extension PKHUDPrompt where Self: BaseViewController {
    static func prompt(_ text: String, delay: TimeInterval = 2) {
        HUD.flash(.label(text), delay: delay)
    }
}
