//
//  Slider.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/12/10.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class Slider: UISlider {
    
    var lineHeight: CGFloat = 0.0
    
    override func maximumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }
    
    override func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        return bounds
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.trackRect(forBounds: bounds)
        return CGRect(x: rect.origin.x, y: (height - lineHeight) / 2, width: width, height: lineHeight)
    }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        return super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
    }
}
