//
//  MonthsCollectionViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class MonthsCollectionViewController: UICollectionViewController {
    
    let monthName:[String] = [
        "बैशाख", "जेठ", "असार", "श्रावण", "भदौ", "आश्विन", "कार्तिक", "मंसिर", "पुष", "माघ", "फाल्गुन", "चैत्र",
    ]
    
    //add a subview to wrap the collection view
    
    init() {
        
        //usage of compositional layout
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(45), heightDimension: .absolute(75))
        
        //let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .flexible(30), trailing: nil, bottom: .none)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .some(.fixed(5))
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 20, bottom: 40, trailing: 10)
        section.interGroupSpacing = 5
        
        
        section.orthogonalScrollingBehavior = .continuous
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        super.init(collectionViewLayout: layout)
        
        collectionView.register(MonthsCell.self, forCellWithReuseIdentifier: "monthsCell")
        
//        collectionView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        collectionView.backgroundColor = .systemGray6
        
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return monthName.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthsCell", for: indexPath) as! MonthsCell
        
        //cell.backgroundColor = .red
        
        cell.monthNameLabel.text = monthName[indexPath.item]
        
        return cell
    }
}
