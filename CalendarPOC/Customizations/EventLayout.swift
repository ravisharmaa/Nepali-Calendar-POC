//
//  EventLayout.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class EventLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        register(SeparatorView.self, forDecorationViewOfKind: "SeparatorView")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect) ?? []
        
        let width = self.minimumLineSpacing
        
        var decorationAttributes: [UICollectionViewLayoutAttributes] = []
        
        for layoutAttribute in layoutAttributes {
            
            if !(layoutAttribute.representedElementKind == UICollectionView.elementKindSectionHeader || layoutAttribute.representedElementKind == UICollectionView.elementKindSectionFooter) {
                
                let separatorView = UICollectionViewLayoutAttributes(forDecorationViewOfKind: "SeparatorView", with: layoutAttribute.indexPath)
                
                let cellFrame = layoutAttribute.frame
                
                separatorView.frame = CGRect(x: cellFrame.origin.x,
                                             y: cellFrame.origin.y - width,
                                             width: cellFrame.size.width,
                                             height: width - 9.5)
                
                separatorView.zIndex = Int.max
                decorationAttributes.append(separatorView)
            }
            
        }
        
        return layoutAttributes + decorationAttributes
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private final class SeparatorView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        self.frame = layoutAttributes.frame
    }
}
