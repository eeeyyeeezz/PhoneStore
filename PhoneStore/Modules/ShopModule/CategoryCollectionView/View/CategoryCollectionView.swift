//
// PhoneStore
// CategoryCollectionView.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class CategoryCollectionView: UICollectionView {
    let viewModel: CategoryCollectionViewModel

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        viewModel = CategoryCollectionViewModel()
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = nil
        backgroundColor = nil
        register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int { 4 }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        cell.imageCell.image = viewModel.getCellImage(indexPath)
        cell.labelCell.text = viewModel.setupTextCellLabel(indexPath)
        return cell
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        CGSize(width: 110, height: bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setupCell(collectionView, indexPath)
    }
}
