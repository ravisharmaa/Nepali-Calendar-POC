//
//  HorizontalMonthCollectionViewController.swift
//  CalendarPOC
//
//  Created by Ravi Bastola on 4/2/20.
//  Copyright © 2020 Ravi Bastola. All rights reserved.
//

import UIKit

class HorizontalMonthCollectionViewController: UICollectionViewController {
    
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
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemGray6
        
        collectionView.register(MonthsCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.contentInset = .init(top: 70, left: 45, bottom: 20, right: 330)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return months.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MonthsCell
        
        cell?.month = months[indexPath.item]
        cell?.backgroundColor = .red
        
        return cell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.scrollToItem(at: IndexPath(item: indexPath.item, section: 0), at: .left, animated: true)
        
        collectionView.contentInset = .init(top: 70, left: 45, bottom: 20, right: 330)
    }
}

extension HorizontalMonthCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableHeigth = collectionView.frame.height
        let insets: CGFloat = 70 + 20
        let height = availableHeigth - insets
        
        let item = months[indexPath.row].name
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont(name: Font.YantramanavBold.rawValue, size: 31) ?? UIFont.boldSystemFont(ofSize: 31)
        ])
        
        return .init(width: itemSize.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    
}
