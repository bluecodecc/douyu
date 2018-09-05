//
//  RecommendViewController.swift
//  douyu
//
//  Created by 周会勤 on 2018/9/5.
//  Copyright © 2018年 周会勤. All rights reserved.
//

import UIKit

private let kItemMargin : CGFloat = 10
private let KItemW = (KScreenW - 3 * kItemMargin) / 2
private let kItemH = KItemW * 3 / 4
private let kHeaderViewH: CGFloat = 50

private let kNormalCellId = "kNormalCellId"
private let kHeaderViewId = "kHeaderViewId"

class RecommendViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {[unowned self] in
        //1.创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: KItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        layout.headerReferenceSize = CGSize(width: KScreenW, height: kHeaderViewH)
        //2.创建collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.purple
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewId)
        print(collectionView.bounds.size)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI();
    }
}

extension RecommendViewController {
    private func setupUI() {
        view.addSubview(collectionView)
    }
}

extension RecommendViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellId, for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "kHeaderViewId", for: indexPath)
        headerView.backgroundColor = UIColor.green
        return headerView;
    }
}

