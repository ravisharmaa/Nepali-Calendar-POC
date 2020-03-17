//
//  MonthViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//
import UIKit

class MonthViewController: UIViewController {
    
    fileprivate lazy var monthCollectionView: UICollectionViewController = {
        let collection = MonthsCollectionViewController()
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    fileprivate lazy var calendarEventsCollectionView: UICollectionViewController = {
        let collection = CalendarEventsCollectionViewController()
        collection.view.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layoutMonthsCollectionView()
    }
    
    func layoutMonthsCollectionView() {
        
        addChild(monthCollectionView)
        
        monthCollectionView.didMove(toParent: self)
        monthCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        monthCollectionView.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addChild(calendarEventsCollectionView)
        calendarEventsCollectionView.didMove(toParent: self)
        
        
        calendarEventsCollectionView.didMove(toParent: self)
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [
            monthCollectionView.view, calendarEventsCollectionView.view
        ])
        
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}
