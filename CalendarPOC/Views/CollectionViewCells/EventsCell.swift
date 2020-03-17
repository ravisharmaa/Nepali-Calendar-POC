//
//  EventsCell.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class EventsCell: UICollectionViewCell {
    
    //MARK:-  UI Properties
    
    fileprivate lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 17)
        label.text = "चैत्र संक्रान्ति"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var eventDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavRegular.rawValue, size: 12)
        label.text = "०१ चैत"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var eventEffectiveDay: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavRegular.rawValue, size: 12)
        label.text = "आज"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
            eventLabel, eventEffectiveDay
        ])
        
        horizontalStackView.distribution = .equalSpacing
        horizontalStackView.axis = .horizontal
        
        horizontalStackView.alignment = .fill
        
        
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [
            horizontalStackView, eventDayLabel
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 3
        
        addSubview(stackView)
        
        stackView.addSubview(horizontalStackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

