//
//  MonthViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//
import UIKit

class MonthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layoutMonthsCollectionView()
    }
    
    
    func layoutMonthsCollectionView() {
        let collectionView = MonthsCollectionViewController()
        
        
        addChild(collectionView)
        
        collectionView.didMove(toParent: self)
        
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView.view)
        
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        collectionView.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.view.heightAnchor.constraint(equalToConstant: view.frame.height - 800).isActive = true
        collectionView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let calendarCollectionView = CalendarCollectionViewController()
        
        addChild(calendarCollectionView)
        calendarCollectionView.didMove(toParent: self)
        
        calendarCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        calendarCollectionView.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
       
        
        let eventsCollectionView = EventsCollectionViewController()
        
        addChild(eventsCollectionView)
        
        eventsCollectionView.didMove(toParent: self)
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [
          calendarCollectionView.view, eventsCollectionView.view
        ])
        
        //stackView.distribution = .fillEqually
        
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: collectionView.view.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
}
