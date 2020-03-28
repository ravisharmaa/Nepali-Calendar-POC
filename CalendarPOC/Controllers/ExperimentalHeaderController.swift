//
//  ExperimentalHeaderController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/27/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class ExperimentalHeaderController: UIViewController {
    
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
    
    fileprivate lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.backgroundColor = .systemBackground
        
        return collectionView
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
        
        addChild(monthCollectionView)
        
        monthCollectionView.didMove(toParent: self)
        monthCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        
        monthCollectionView.view.heightAnchor.constraint(equalToConstant: 186).isActive = true
        
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [
            monthCollectionView.view, collectionView
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TestCell.self, forCellWithReuseIdentifier: "reuseMe")
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

extension ExperimentalHeaderController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"reuseMe", for: indexPath) as? TestCell
        
        addChild(cell!.calendarController)
        cell?.calendarController.didMove(toParent: self)
        
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
}

extension ExperimentalHeaderController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class TestCell: UICollectionViewCell {
    
    lazy var calendarController: UICollectionViewController = {
        let c = CalendarEventsCollectionViewController()
        return c
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(calendarController.view)
        
        calendarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            calendarController.view.topAnchor.constraint(equalTo: topAnchor),
            calendarController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendarController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
