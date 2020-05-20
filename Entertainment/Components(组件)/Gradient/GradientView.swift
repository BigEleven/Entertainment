//
//  NotificationName.swift
//  Entertainment
//
//  Created by 吕君 on 2020/5/18.
//  Copyright © 2020 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class GradientView: UIView {

    private var gradientColors: [UIColor]
    private var cgColors: [CGColor] { return gradientColors.map({ color in
        color.cgColor
    }) }

    private lazy var gradientLayer = CAGradientLayer.custom

    init(gradientColors: [UIColor], axis: Axis) {
        self.gradientColors = gradientColors

        super.init(frame: CGRect.zero)

        (gradientLayer.startPoint, gradientLayer.endPoint) = axis.points
        gradientLayer.colors = cgColors
        layer.insertSublayer(gradientLayer, at: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GradientView {
    enum Axis {
        case vertical, horizontal
    }
}

extension GradientView {
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

// MARK: - Factory
extension GradientView {
    static var theme: GradientView {
        return GradientView(gradientColors: UIColor.GradientGroup.theme, axis: .vertical)
    }
    static var striking: GradientView {
        return GradientView(gradientColors: UIColor.GradientGroup.striking, axis: .horizontal)
    }
}

// MARK: - Private
fileprivate extension CAGradientLayer {
    static var custom: CAGradientLayer {
        let layer = CAGradientLayer()
        layer.locations = [0, 1]
        return layer
    }
}

fileprivate extension GradientView.Axis {
    var points: (start: CGPoint, end: CGPoint) {
        switch self {
        case .vertical:     return (CGPoint(x: 0.5, y: 1), CGPoint(x: 0.5, y: 0))
        case .horizontal:   return (CGPoint(x: 0, y: 0.5), CGPoint(x: 1, y: 0.5))
        }
    }
}
