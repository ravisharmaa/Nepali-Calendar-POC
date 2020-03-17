//
//  DaysListCollectionViewHeader.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/15/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class DaysListCollectionViewHeader: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView: UIStackView = UIStackView()
        
        backgroundColor =  .systemBackground
        
        for i in 1...7 {
            let label = UILabel()
            label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 13)
            switch i {
            case 1:
                label.text = Days.S.rawValue
            case 2:
                label.text = Days.M.rawValue
            case 3:
                label.text = Days.T.rawValue
            case 4:
                label.text = Days.W.rawValue
            case 5:
                label.text = Days.TH.rawValue
            case 6:
                label.text = Days.FR.rawValue
            default:
                label.text = Days.SAT.rawValue
            }
            label.textColor = .label
            label.textAlignment = .center
            stackView.addArrangedSubview(label)
        }
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
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
