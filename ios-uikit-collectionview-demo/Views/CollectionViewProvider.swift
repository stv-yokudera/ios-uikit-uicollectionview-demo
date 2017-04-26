//
//  CollectionViewProvider.swift
//  ios-uikit-collectionview-demo
//
//  Created by Eiji Kushida on 2017/02/08.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class CollectionViewProvider:NSObject, UICollectionViewDataSource {
    
    /// セクション数を返す
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    /// セクションごとのセル数を返す
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    /// ヘッダーまたは、フッターに値を設定する
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            
            if let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ItemCollectionHeaderView.identifier,
                for: indexPath)
                as? ItemCollectionHeaderView {
                
                headerView.titleLabel.text = "section : \(indexPath.section)"
                headerView.backgroundColor = UIColor.red
                return headerView
            }
        }
        else {

            if let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: ItemCollectionFooterView.identifier,
                for: indexPath)
                as? ItemCollectionFooterView {
                
                footerView.titleLabel.text = "footer : \(indexPath.section)"
                return footerView
            }
        }
        fatalError()
    }
    
    /// セルに値を設定する
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.childCollectionView.reloadData()
        return cell
    }
}
