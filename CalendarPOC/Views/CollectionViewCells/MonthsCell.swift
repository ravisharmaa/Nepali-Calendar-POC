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
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 31)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(monthNameLabel)
        
        monthNameLabel.translatesAutoresizingMaskIntoConstraints = false
       // monthNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        monthNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        //monthNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        monthNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
