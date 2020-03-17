//
//  TestController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/15/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class CalendarEventsCollectionViewController: UICollectionViewController {
        
    init() {
        let layout = EventLayout()
        
        layout.scrollDirection = .vertical
        
        super.init(collectionViewLayout: layout)
                
        collectionView.register(EventsCell.self, forCellWithReuseIdentifier: ReuseIdentifiers.EventsCell.rawValue)
        
        collectionView.register(CalendarCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReuseIdentifiers.CalendarHeader.rawValue)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ReuseIdentifiers.CalendarHeader.rawValue, for: indexPath) as! CalendarCollectionViewHeader
       
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           return CGSize(width: view.frame.width, height: 350)
       }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:ReuseIdentifiers.EventsCell.rawValue, for: indexPath) as! EventsCell
        return cell
    }
    
}

extension CalendarEventsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let availableWidth: CGFloat = collectionView.frame.width
        
        let sectionInsetsLeftAndRight: CGFloat = 30 + 10
        
        let width = (availableWidth - sectionInsetsLeftAndRight)
        
        return .init(width: width, height: 70)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 10, left: 30, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
}
