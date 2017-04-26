//
//  ChildCollectionViewProvider.swift
//  ios-uikit-collectionview-demo
//
//  Created by OkuderaYuki on 2017/04/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ChildCollectionViewProvider: NSObject {
    var items: [ChildCollectionViewCellItem] = []
    
    func set(items: [ChildCollectionViewCellItem]) {
        self.items = items
    }
}

extension ChildCollectionViewProvider: UICollectionViewDataSource {
    /// セクション数を返す
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /// セクションごとのセル数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    /// セルに値を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildCollectionViewCell.identifier, for: indexPath) as! ChildCollectionViewCell
        
        cell.item = items[indexPath.row]
        return cell
    }
}
