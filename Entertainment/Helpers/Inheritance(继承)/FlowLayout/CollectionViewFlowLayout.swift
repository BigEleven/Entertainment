//
//  CollectionViewFlowLayout.swift
//  Entertainment
//
//  Created by That's Mandarin Video Editor  on 2019/9/25.
//  Copyright © 2019 That's Mandarin Video Editor . All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    enum CellAlignment {
        case left
        case center
        case right
    }
    
    /// cell 之间的距离
    var spacing: CGFloat = 5 {
        didSet {
            minimumInteritemSpacing = spacing
            minimumLineSpacing = spacing
        }
    }
    
    var cellAlignment: CellAlignment = .left
    
    private var sumWidth: CGFloat = 0
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumLineSpacing = spacing
        minimumInteritemSpacing = spacing
        sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    init(scrollDirection: UICollectionView.ScrollDirection, estimatedItemSize: CGSize, _ minimumLineSpacing: CGFloat = 0, _ minimumInteritemSpacing: CGFloat = 0) {
        super.init()
        
        self.scrollDirection = scrollDirection
        self.estimatedItemSize = estimatedItemSize
        self.minimumLineSpacing = minimumLineSpacing
        self.minimumInteritemSpacing =  minimumInteritemSpacing
    }
    
    convenience init(_ cellAlignment: CellAlignment, _ spacing: CGFloat){
        self.init()
        self.cellAlignment = cellAlignment
        self.spacing = spacing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes_super = super.layoutAttributesForElements(in: rect) ?? [UICollectionViewLayoutAttributes]()
        let layoutAttributes = NSArray(array: layoutAttributes_super, copyItems: true) as! [UICollectionViewLayoutAttributes]
        
        var layoutAttributes_t: [UICollectionViewLayoutAttributes] = []
        
        for index in 0..<layoutAttributes.count {
            
            let previous = index == 0 ? nil : layoutAttributes[index - 1]
            let current = layoutAttributes[index]
            let next = index + 1 == layoutAttributes.count ? nil : layoutAttributes[index + 1]
            
            //加入临时数组
            layoutAttributes_t.append(current)
            sumWidth += current.frame.size.width

            let previousY = previous == nil ? 0 : previous!.frame.maxY
            let currentY = current.frame.maxY
            let nextY = next == nil ? 0 : next!.frame.maxY

            if (currentY != previousY && currentY != nextY) {
                if current.representedElementKind == UICollectionView.elementKindSectionHeader {
                    layoutAttributes_t.removeAll()
                    sumWidth = 0.0
                }else if current.representedElementKind == UICollectionView.elementKindSectionFooter {
                    layoutAttributes_t.removeAll()
                    sumWidth = 0.0
                }else{
                    setCellFrame(with: layoutAttributes_t)
                    layoutAttributes_t.removeAll()
                    sumWidth = 0.0
                }
            } else if currentY != nextY {
                self.setCellFrame(with: layoutAttributes_t)
                layoutAttributes_t.removeAll()
                sumWidth = 0.0
            }
        }
        
        return layoutAttributes
    }

    /// 调整Cell的Frame
    ///
    /// - Parameter layoutAttributes: layoutAttribute 数组
    func setCellFrame(with layoutAttributes : [UICollectionViewLayoutAttributes]) {
        var nowWidth : CGFloat = 0.0
        switch cellAlignment {
        case .left:
            nowWidth = sectionInset.left
            for attributes in layoutAttributes{
                var nowFrame = attributes.frame
                nowFrame.origin.x = nowWidth
                attributes.frame = nowFrame
                nowWidth += nowFrame.size.width + spacing
            }
            break
        case .center:
            nowWidth = (collectionView!.width - sumWidth - (CGFloat(layoutAttributes.count) * spacing)) / 2
            for attributes in layoutAttributes{
                var nowFrame = attributes.frame
                nowFrame.origin.x = nowWidth + spacing / 2
                attributes.frame = nowFrame
                nowWidth += nowFrame.size.width + spacing
            }
            break
        case .right:
            nowWidth = collectionView!.frame.size.width - sectionInset.right
            for var index in 0 ..< layoutAttributes.count{
                index = layoutAttributes.count - 1 - index
                let attributes = layoutAttributes[index]
                var nowFrame = attributes.frame
                nowFrame.origin.x = nowWidth - nowFrame.size.width
                attributes.frame = nowFrame
                nowWidth = nowWidth - nowFrame.size.width - spacing
            }
            break
        }
    }
}
