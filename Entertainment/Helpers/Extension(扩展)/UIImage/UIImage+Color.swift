//
//  UIImage+Color.swift
//  Entertainment
//
//  Created by tt on 2019/6/26.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init(color: UIColor) {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else {
            self.init()
            return
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        guard let theImage = UIGraphicsGetImageFromCurrentImageContext() else {
            self.init()
            return
        }
        guard let cgImage = theImage.cgImage else {
            self.init()
            return
        }
        self.init(cgImage: cgImage)
    }
}

extension UIImage{
    
    public func resetColor(color : UIColor) -> UIImage{
        UIGraphicsBeginImageContext(self.size)
        color.setFill()
        let bounds = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: CGBlendMode.destinationIn, alpha: 1.0)
        
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage!
    }
}
