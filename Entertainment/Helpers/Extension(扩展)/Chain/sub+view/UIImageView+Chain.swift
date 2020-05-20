//
//  UIImageView+Chain.swift
//  Entertainment
//
//  大浦安娜 卯月麻衣 波多野结衣 雾岛奈津美 杉原杏璃 雨宫琴音 上原亚衣 北野望 水菜丽 初美沙希 樱木凛
//  Created by Eleven on 2017/12/5.
//  Copyright © 2017年 Lansi. All rights reserved.
//

import UIKit

public extension Chainable where Self: UIImageView {

    @discardableResult
    func image(_ imageStr: String) -> Self {
        self.image = UIImage(named: imageStr)
        self.contentMode = .scaleAspectFit
        return self
    }
    
    func imageUrl(_ imageUrl: String, _ placeholder: String = "") -> Self {
        // URL中包含中文
        guard let url_utf8 = imageUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            image = UIImage(named: placeholder)
            self.contentMode = .scaleAspectFit
            return self
        }
        self.image = UIImage(named: url_utf8)
        return self
    }

    @discardableResult
    func sizeToSelf() -> Self {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.main.scale)
        self.image?.draw(in: CGRect(x: 0, y: 0, width: self.frame.self.width, height: self.frame.self.height))
        let reSizeImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        self.image = reSizeImage

        return self
    }
}
