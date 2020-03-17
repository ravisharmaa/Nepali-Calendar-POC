//
//  MonthsCell.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/16/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class MonthsCell: UICollectionViewCell {
    
    lazy var monthNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 25)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(monthNameLabel)
        
        monthNameLabel.translatesAutoresizingMaskIntoConstraints = false
        monthNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        monthNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
