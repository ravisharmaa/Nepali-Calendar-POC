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
        let collection = HorizontalMonthCollectionViewController()
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
        
        view.backgroundColor = .systemBackground
        
        layoutMonthsCollectionView()
        
        layoutSettingsButton()
        
        layoutGregorainLabel()
        
    }
    
    
    //MARK:- UI
    func layoutMonthsCollectionView() {
        
        let container = UIView()
        container.addSubview(monthCollectionView.view)
        
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        container.heightAnchor.constraint(equalToConstant: 186).isActive = true
        
        addChild(monthCollectionView)
        
        monthCollectionView.didMove(toParent: self)
        //monthCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        //monthCollectionView.view.heightAnchor.constraint(equalToConstant: 186).isActive = true
        
        monthCollectionView.view.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        monthCollectionView.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        monthCollectionView.view.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        monthCollectionView.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        addChild(calendarEventsCollectionView)
        calendarEventsCollectionView.didMove(toParent: self)
        
        
        calendarEventsCollectionView.didMove(toParent: self)
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [
            container, calendarEventsCollectionView.view
        ])
        
        stackView.axis = .vertical
        
        //stackView.alignment = .center
        
        stackView.distribution = .fill
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
            gregorianMonthName.leadingAnchor.constraint(equalTo: monthCollectionView.view.safeAreaLayoutGuide.leadingAnchor, constant: 46),
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
