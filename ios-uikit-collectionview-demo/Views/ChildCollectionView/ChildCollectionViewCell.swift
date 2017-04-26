//
//  ChildCollectionViewCell.swift
//  ios-uikit-collectionview-demo
//
//  Created by OkuderaYuki on 2017/04/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ChildCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var item: ChildCollectionViewCellItem? {
        didSet {
            imageView.image = item?.image ?? #imageLiteral(resourceName: "noImage")
        }
    }
}
