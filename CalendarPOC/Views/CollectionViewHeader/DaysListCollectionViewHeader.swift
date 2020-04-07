//
//  DaysListCollectionViewHeader.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/15/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class DaysListCollectionViewHeader: UICollectionReusableView {
    
    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor =  .systemBackground
                
        Days.allCases.forEach { (day) in
            let label = UILabel()
            label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 13)
            label.text = day.rawValue
            label.textColor = .systemGray
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
