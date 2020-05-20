//
//  NotificationName.swift
//  Entertainment
//
//  Created by 吕君 on 2020/5/18.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class GradientButton: UIButton {
    
    var normalGradientColors: [UIColor]? { didSet { updateIfNormalGradientColorsIsSet() } }
    var selectedGradientColors: [UIColor]?
    var disabledGradientColors: [UIColor]?

    var axis: Axis = .horizontal
    var isRoundedCorner = true

    private lazy var gradientLayer = CAGradientLayer.custom

    init() {
        super.init(frame: CGRect.zero)
        self.layer.addSublayer(gradientLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GradientButton {
    enum Axis {
        case vertical, horizontal
    }
}

extension GradientButton {
    override var isEnabled: Bool { didSet { updateIsEnabled() } }
    override var isSelected: Bool { didSet { updateIsSelected() } }

    override func layoutSubviews() {
        super.layoutSubviews()
        // 当button的frame改变后 同步更改渐变效果层的frame
        gradientLayer.frame = bounds
        // 改变颜色渐变方向
        (gradientLayer.startPoint, gradientLayer.endPoint) = axis.points
        // 如果需要圆角 根据button的height/2来设定圆角
        if isRoundedCorner {
            layer.cornerRadius = bounds.height / 2
            gradientLayer.cornerRadius = bounds.height / 2
        }
    }
}

// MARK: - Factory
extension GradientButton {
    static var theme: GradientButton {
        let button = GradientButton()
        button.normalGradientColors = UIColor.GradientGroup.theme
        button.disabledGradientColors = UIColor.GradientGroup.faintTheme
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .highlighted)
        return button
    }
    
    static var yellow: GradientButton {
        let button = GradientButton()
        button.normalGradientColors = [UIColor("#FFFFB41E"), UIColor("#FFFFCE00")]
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .highlighted)
        return button
    }
}

// MARK: - Private
fileprivate extension CAGradientLayer {
    static var custom: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.locations = [0, 1]
        layer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor]
        layer.masksToBounds = true
        return layer
    }
}

fileprivate extension GradientButton.Axis {
    var points: (start: CGPoint, end: CGPoint) {
        switch self {
        case .vertical:     return (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
        case .horizontal:   return (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
        }
    }
}

fileprivate extension GradientButton {

    func updateIfNormalGradientColorsIsSet() {
        let enable = isEnabled
        isEnabled = enable
    }

    func updateIsEnabled() {
        guard let normal = normalGradientColors else { return }
        let enabled = normal.map { color in
            color.cgColor
        }
        let disabled = disabledGradientColors?.map { color in
            color.cgColor
        }
        gradientLayer.colors = isEnabled ? enabled : (disabled ?? enabled)
    }
    
    func updateIsSelected() {
        guard let normal = normalGradientColors else { return }
        let deselected = normal.map { color in
            color.cgColor
        }
        let selected = selectedGradientColors?.map { color in
            color.cgColor
        }
        gradientLayer.colors = isSelected ? (selected ?? deselected) : deselected
    }
}
