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
        cell.imageCell.tintColor = #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.768627451, alpha: 1)
        cell.imageCell.image = viewModel.getCellImage(indexPath)
        cell.labelCell.text = viewModel.setupTextCellLabel(indexPath)
        return cell
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        CGSize(width: 110, height: 130)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if viewModel.checkSelectedCells(collectionView, indexPath) { return }

        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
        if cell.isSelected {
            if cell.view.backgroundColor == .white {
                cell.view.backgroundColor = .orange
            } else {
                cell.view.backgroundColor = .white
            }
        }
    }
}
