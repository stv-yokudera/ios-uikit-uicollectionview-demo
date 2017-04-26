//
//  CustomCollectionViewCell.swift
//  ios-uikit-collectionview-demo
//
//  Created by OkuderaYuki on 2017/04/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var childCollectionView: UICollectionView!
    
    var childCollectionViewProvider = ChildCollectionViewProvider()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // ChildCollectionViewCellのNibを登録する
        let childCollectionViewNib = UINib(nibName: ChildCollectionViewCell.nibName, bundle: Bundle.main)
        childCollectionView.register(childCollectionViewNib, forCellWithReuseIdentifier: ChildCollectionViewCell.identifier)
        
        childCollectionViewProvider.set(items: self.mockItems())
        
        childCollectionView.delegate = self
        childCollectionView.dataSource = childCollectionViewProvider
    }
}

private extension CustomCollectionViewCell {
    func mockItems() -> [ChildCollectionViewCellItem] {
        
        var items: [ChildCollectionViewCellItem] = []
        
        var item = ChildCollectionViewCellItem()
        item.image = #imageLiteral(resourceName: "tiger")
        items.append(item)
        
        item.image = #imageLiteral(resourceName: "hedgehog")
        items.append(item)
        
        item.image = #imageLiteral(resourceName: "monkey")
        items.append(item)
        
        item.image = #imageLiteral(resourceName: "rabbit")
        items.append(item)
        
        return items
    }
}

// MARK: - UICollectionViewDelegate
extension CustomCollectionViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("[ChildCollectionViewCell] indexPath: \(indexPath.section) - \(indexPath.row)")
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CustomCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    /// セルのサイズを設定する
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: 200)
    }
}
