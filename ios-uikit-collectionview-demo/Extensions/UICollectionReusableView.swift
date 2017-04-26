//
//  UICollectionReusableView.swift
//  ios-uikit-collectionview-demo
//
//  Created by OkuderaYuki on 2017/04/27.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

public extension UICollectionReusableView {
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
    static var nibName: String {
        get {
            return self.identifier
        }
    }
}
