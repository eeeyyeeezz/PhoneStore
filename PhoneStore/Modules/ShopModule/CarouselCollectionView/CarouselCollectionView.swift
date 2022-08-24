//
// PhoneStore
// CollectionViewLayout.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class PhoneCell: UICollectionViewCell {
    static let identifier: String = "PhoneCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
        layer.cornerRadius = 25
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CarouselCollectionView: UICollectionView {
    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: CarouselCollectionView.configureLayout())
        delegate = self
        dataSource = self
      	backgroundColor = nil
        register(HotSellCell.self, forCellWithReuseIdentifier: HotSellCell.identifier)
        register(PhoneCell.self, forCellWithReuseIdentifier: PhoneCell.identifier)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarouselCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { // HotSales
            return 5
        }
        return 7
    }

    func numberOfSections(in _: UICollectionView) -> Int { 2 }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 { // HotSales
            let cell = dequeueReusableCell(withReuseIdentifier: HotSellCell.identifier, for: indexPath) as! HotSellCell
            return cell
        }
        let cell = dequeueReusableCell(withReuseIdentifier: PhoneCell.identifier, for: indexPath) as! PhoneCell
        return cell
    }
}
