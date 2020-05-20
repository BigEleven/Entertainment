//
//  CollectionViewCell.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/24.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit
import Reusable

class CollectionViewCell: UICollectionViewCell, Reusable {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
