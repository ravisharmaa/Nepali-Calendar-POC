//
//  MonthsCollectionViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class CalendarCollectionViewController: UICollectionViewController {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(DateCell.self, forCellWithReuseIdentifier: ReuseIdentifiers.DatesCell.rawValue)
        collectionView.register(DaysListCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "daysList")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "daysList", for: indexPath) as! DaysListCollectionViewHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 38)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.DatesCell.rawValue, for: indexPath) as! DateCell
        
        cell.populate(date: indexPath.item + 1)
        
        return cell
    }
}

extension CalendarCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let availableWidth: CGFloat = collectionView.frame.width
        
        let sectionInsetsOfLeftAndRight: CGFloat = 30 + 10
        
        let width = (availableWidth - sectionInsetsOfLeftAndRight - (0.0 * (7-1))) / 7
        
        return .init(width: width, height: width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 30, bottom: 30, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
}
