//
//  UIImage+Size.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/7/4.
//  Copyright © 2019 eleven. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    
    public func resetSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size,false,UIScreen.main.scale)
        draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let reSizeImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext();
        return reSizeImage;
    }
}
