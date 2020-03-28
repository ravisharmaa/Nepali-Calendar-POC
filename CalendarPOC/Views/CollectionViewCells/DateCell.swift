//
//  DateCell.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/13/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {
    
    //MARK:- SubViews
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 17)
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK:- Properties
    
    var date: Int? {
        didSet {
            self.dateLabel.text = "\(String(describing: self.date!))"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containerView)
        containerView.addSubview(dateLabel)
        
        containerView.layer.cornerRadius = (self.frame.height - 10 ) / 2
        containerView.alpha = 1
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: contentView.frame.height - 10),
            containerView.widthAnchor.constraint(equalToConstant: contentView.frame.width - 10),
            dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func populate(date: Int) {
        
        containerView.backgroundColor = (date == 1) ? .systemGray : .systemBackground
        
        dateLabel.textColor = (date == 1 ) ? .tertiarySystemBackground : .label
        
        self.date = date
    }
}
