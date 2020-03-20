//
//  MonthLayout.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/20/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class MonthLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect) ?? []
        
        for layoutAttribute in layoutAttributes where layoutAttribute.indexPath.item == 0{
            print(layoutAttribute)
        }
        
        return layoutAttributes
    }
    
    
    
    
}
