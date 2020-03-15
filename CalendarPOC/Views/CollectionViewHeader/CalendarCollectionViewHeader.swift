//
//  CalendarCollectionViewHeader.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/15/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class CalendarCollectionViewHeader: UICollectionReusableView {
    
    
    fileprivate lazy var calendarController: CalendarCollectionViewController = {
        let controller = CalendarCollectionViewController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(calendarController.view)
        
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
