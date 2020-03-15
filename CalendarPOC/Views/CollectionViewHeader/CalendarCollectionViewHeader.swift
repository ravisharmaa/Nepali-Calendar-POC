//
//  CalendarCollectionViewHeader.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/15/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class CalendarCollectionViewHeader: UICollectionReusableView {
    
    
    let calendarController = CalendarCollectionViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(calendarController.view)
        
        calendarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendarController.view.topAnchor.constraint(equalTo: topAnchor),
            calendarController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendarController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
