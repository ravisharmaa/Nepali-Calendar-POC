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
    
    lazy var settingsView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "menuw"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layoutMonthsCollectionView()
        
        layoutSettingsButton()
    }
    
    func layoutMonthsCollectionView() {
        
        addChild(monthCollectionView)
        
        monthCollectionView.didMove(toParent: self)
        monthCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        monthCollectionView.view.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
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
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    func layoutSettingsButton()  {
        
        monthCollectionView.view.addSubview(settingsView)
        
        NSLayoutConstraint.activate([
            settingsView.heightAnchor.constraint(equalToConstant: 35),
            settingsView.widthAnchor.constraint(equalToConstant: 35),
            settingsView.topAnchor.constraint(equalTo: monthCollectionView.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsView.trailingAnchor.constraint(equalTo: monthCollectionView.view.trailingAnchor, constant: -20)
        ])
    }
}
