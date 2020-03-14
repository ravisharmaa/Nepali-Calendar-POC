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
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        containerView.layer.cornerRadius = self.frame.height / 2
        containerView.alpha = 1
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func populate(date: Int) {
        
        containerView.backgroundColor = (date == 1) ? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) : #colorLiteral(red: 0.09018407017, green: 0.0902037397, blue: 0.09017974883, alpha: 1)
        dateLabel.textColor = (date == 1 ) ? .black : .white
        
        self.date = date
    }
}