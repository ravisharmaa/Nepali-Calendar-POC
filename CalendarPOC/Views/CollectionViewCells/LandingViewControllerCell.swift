//
//  LandingViewControllerCell.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 4/6/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class LandingViewControllerCell: UICollectionViewCell {
    
    lazy var calendarController: CalendarEventsCollectionViewController = {
        let controller = CalendarEventsCollectionViewController()
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.collectionView.isUserInteractionEnabled = true
        controller.collectionView.reloadData()
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
