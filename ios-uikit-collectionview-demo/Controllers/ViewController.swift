//
//  ViewController.swift
//  ios-uikit-collectionview-demo
//
//  Created by Eiji Kushida on 2017/02/08.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let dataSource = CollectionViewProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
        setDataSource()
        setDelegate()
    }

    /// データソースを設定する
    private func setDataSource() {
        collectionView.dataSource = dataSource
    }

    /// デリゲードを設定する
    private func setDelegate() {
        collectionView.delegate = self
    }
    
    /// Nibを登録する
    private func registerNib() {
        
        // CustomCollectionViewCell
        let customCollectionViewNib = UINib(nibName: CustomCollectionViewCell.nibName, bundle: Bundle.main)
        collectionView.register(customCollectionViewNib, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
}

//MARK:-UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    /// セルが選択されたときに呼び出される
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) - \(indexPath.row)")
    }
}

//MARK:-UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
     
    /// セルのサイズを設定する
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 300)
    }
}
