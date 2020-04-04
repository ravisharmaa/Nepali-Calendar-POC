//
//  MonthsCollectionViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 3/14/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class MonthsCollectionViewController: UICollectionViewController {
    
    let months:[Month] = [
        Month(name: "बैशाख"),
        Month(name: "जेठ"),
        Month(name: "असार"),
        Month(name: "श्रावण"),
        Month(name: "भदौ"),
        Month(name: "असार"),
        Month(name: "कार्तिक"),
        Month(name: "मंसिर"),
        Month(name: "पुष"),
        Month(name: "माघ"),
        Month(name: "फाल्गुन"),
        Month(name: "चैत्र"),
    ]
    
    //datasource for diffable collection view
    var dataSource: UICollectionViewDiffableDataSource<Section, Month>!
    
    
    
    // snapshot to append that datasource
    
    var snapshot = NSDiffableDataSourceSnapshot<Section, Month>()
    
    
    //add a subview to wrap the collection view
    
    init() {
        
        //usage of compositional layout
        
        //let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .absolute(75))
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(100))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 1.0, bottom: 0, trailing: 0)
        //item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .some(.fixed(1.0)), top: .flexible(40), trailing: .none, bottom: .none)
        
        
        //let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        
        
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 50, leading: 30, bottom: 40, trailing: 280)
        // section.interGroupSpacing = 8
        
        
        section.orthogonalScrollingBehavior = .continuous
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        
        super.init(collectionViewLayout: layout)
        
        collectionView.register(MonthsCell.self, forCellWithReuseIdentifier: "monthsCell")
        
        //collectionView.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        collectionView.backgroundColor = .systemGray6
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.decelerationRate = .fast
        
        collectionView.contentInsetAdjustmentBehavior = .never
        
        configureDataSource()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //collectionView.contentInset = .init(top: 0, left: 80, bottom: 40, right: 0)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, month: Month) -> UICollectionViewCell? in
            
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "monthsCell", for: indexPath) as? MonthsCell else { fatalError() }
            
            cell.month = month
            //cell.backgroundColor = .red
            return cell
        })
        
        snapshot.appendSections([.main])
        snapshot.appendItems(months)
        
        dataSource.apply(snapshot)
    }
}
