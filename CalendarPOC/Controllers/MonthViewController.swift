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
        button.addTarget(self, action: #selector(showSettingsView), for: .touchUpInside)
        return button
    }()
    
    lazy var gregorianMonthName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.YantramanavBold.rawValue, size: 16)
        label.textColor = .label
        label.text = "November/December"
        label.textAlignment = .center
        return label
    }()
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layoutMonthsCollectionView()
        
        layoutSettingsButton()
        
        layoutGregorainLabel()
        
        //select item from the first index path
        
        //monthCollectionView.collectionView.layoutIfNeeded()
    }
    
    
    //MARK:- UI
    func layoutMonthsCollectionView() {
        
        addChild(monthCollectionView)
        
        monthCollectionView.didMove(toParent: self)
        monthCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        monthCollectionView.view.heightAnchor.constraint(equalToConstant: 186).isActive = true
        
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
    
    
    
    func layoutGregorainLabel() {
        monthCollectionView.view.addSubview(gregorianMonthName)
        gregorianMonthName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gregorianMonthName.leadingAnchor.constraint(equalTo: monthCollectionView.view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            gregorianMonthName.bottomAnchor.constraint(equalTo: monthCollectionView.view.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func showSettingsView() {
        let viewController = SettingsViewController()
        
        //        viewController.didTapCloseButton = {
        //            blurEffectView.removeFromSuperview()
        //        }
        viewController.modalTransitionStyle = .crossDissolve
        
        viewController.modalPresentationStyle = .overCurrentContext
        present(viewController, animated: true, completion: nil)
    }
    
    
    
}
