//
//  ExperimentalTableViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/28/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class ExperimentaTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testView = UIView()
        testView.backgroundColor = .systemRed
        
        testView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        testView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
       
        
        let stackView = UIStackView(arrangedSubviews: [testView, tableView])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        view.addSubview(stackView)
        
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }
}

extension ExperimentaTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let calendar = CalendarEventsCollectionViewController()
        calendar.collectionView.isUserInteractionEnabled = false
        addChild(calendar)
        
        //calendar.view.frame = cell.frame
        
        cell.addSubview(calendar.view)
        
        calendar.didMove(toParent: self)
        
       
        return cell
    }
    
    
}
