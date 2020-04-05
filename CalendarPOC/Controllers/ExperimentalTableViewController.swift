//
//  ExperimentalTableViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/28/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class ExperimentalTableViewController: UIViewController {
    
    fileprivate lazy var containterView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        //containerView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    fileprivate lazy var devNagariDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantraManavLight.rawValue, size: 66)
        label.text = "१७"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariDayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 35)
        label.text = "आइतबार"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariMonthAndYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 35)
        label.text = "फागुन २०७६"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    fileprivate lazy var devNagariPanchangaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 16)
        label.text = "तृतिया पञ्चाङ्ग: ध्रुव भाद्र चित्रा"
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    
    fileprivate lazy var monthDayYearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavMedium.rawValue, size: 16)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        label.text = dateFormatter.string(from:Date())
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    var containerHeightConstraint: NSLayoutConstraint!
    var maxHeightConstraint: CGFloat = 350
    
    var oldContentOffset: CGPoint = CGPoint.zero
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containterView)
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        containerHeightConstraint = containterView.heightAnchor.constraint(equalToConstant: maxHeightConstraint)
        containerHeightConstraint?.isActive = true
        
        [devNagariDateLabel,
         devNagariDayLabel,
         devNagariMonthAndYearLabel,
         devNagariPanchangaLabel,
         monthDayYearLabel].forEach {
            containterView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.leadingAnchor.constraint(equalTo: containterView.leadingAnchor, constant: 40).isActive = true
        }
        
        NSLayoutConstraint.activate([
            devNagariDateLabel.topAnchor.constraint(equalTo: containterView.topAnchor, constant: 78),
            devNagariDayLabel.topAnchor.constraint(equalTo: devNagariDateLabel.bottomAnchor),
            devNagariMonthAndYearLabel.topAnchor.constraint(equalTo: devNagariDayLabel.bottomAnchor),
            devNagariPanchangaLabel.topAnchor.constraint(equalTo: devNagariMonthAndYearLabel.bottomAnchor, constant: 18),
            monthDayYearLabel.topAnchor.constraint(equalTo: devNagariPanchangaLabel.bottomAnchor, constant: 3),
            monthDayYearLabel.bottomAnchor.constraint(equalTo: containterView.bottomAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            containterView.topAnchor.constraint(equalTo: view.topAnchor),
            containterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: containterView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.separatorStyle = .none
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "reuseMe")
        
        
    }
}

extension ExperimentalTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseMe", for: indexPath) as! CustomCell
        cell.calendar.view.isUserInteractionEnabled = false
        addChild(cell.calendar)
        cell.calendar.didMove(toParent: self)
        
        return cell
    }
}


class CustomCell: UITableViewCell {
    
    let calendar = CalendarEventsCollectionViewController()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        addSubview(calendar.view)
        
        calendar.collectionView.isUserInteractionEnabled = false
        
        calendar.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendar.view.topAnchor.constraint(equalTo: topAnchor),
            calendar.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendar.view.bottomAnchor.constraint(equalTo: bottomAnchor),
            calendar.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExperimentalTableViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffset = scrollView.contentOffset.y - oldContentOffset.y
        
        if containerHeightConstraint.constant > -350 {
            containerHeightConstraint?.constant -= contentOffset
            containerHeightConstraint?.isActive = true
            scrollView.contentOffset.y -= contentOffset
        }
        
        if contentOffset < 0 && scrollView.contentOffset.y < 0 {
            if (containerHeightConstraint.constant < 0) {
                if containerHeightConstraint.constant - contentOffset > 0 {
                    containerHeightConstraint.constant = 0
                } else {
                    containerHeightConstraint.constant -= contentOffset
                }
                
                containerHeightConstraint.isActive = true
                scrollView.contentOffset.y -= contentOffset
            }
        }
    }
    
}
