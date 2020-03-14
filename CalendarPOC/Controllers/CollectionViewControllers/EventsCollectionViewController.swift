//
//  EventsCollectionViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class EventsCollectionViewController: UICollectionViewController {
    
    init() {
        let layout = EventLayout()
        super.init(collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.register(EventsCell.self, forCellWithReuseIdentifier: "eventsCell")
        collectionView.backgroundColor = #colorLiteral(red: 0.09018407017, green: 0.0902037397, blue: 0.09017974883, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventsCell", for: indexPath) as! EventsCell
        return cell
        
        
    }
}

extension EventsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
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
