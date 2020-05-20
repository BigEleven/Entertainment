//
//  CollectionView.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/11/21.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class CollectionView: UICollectionView {

    init<T: CollectionViewCell>(register cell: T.Type, target: Any, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate(target)
        showsVerticalScrollIndicator(false)
        showsHorizontalScrollIndicator(false)
        register(cellType: cell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
