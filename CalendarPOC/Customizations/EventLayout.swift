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
        let width = self.minimumLineSpacing + 0.8
        
        var decorationAttributes: [UICollectionViewLayoutAttributes] = []
        
        for layoutAttribute in layoutAttributes  {
            let separatorView = UICollectionViewLayoutAttributes(forDecorationViewOfKind: "SeparatorView", with: layoutAttribute.indexPath)
            
            let cellFrame = layoutAttribute.frame
            
            separatorView.frame = CGRect(x: cellFrame.origin.x,
                                         y: cellFrame.origin.y - width,
                                         width: cellFrame.size.width,
                                         height: width - 9)
            
            separatorView.zIndex = Int.max
            decorationAttributes.append(separatorView)
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
        self.backgroundColor = #colorLiteral(red: 0.2325224876, green: 0.2325679958, blue: 0.2325165272, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        self.frame = layoutAttributes.frame
    }
}
