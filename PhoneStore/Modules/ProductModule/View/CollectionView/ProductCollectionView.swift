//
// PhoneStore
// ProductCollectionView.swift
// Created by eeeyyeeezz on 26.08.2022
// Swift: 5.0
//

import UIKit

final class ProductCollectionView: UICollectionView {
    private var productStruct: ProductStruct?

    private let viewModel: ProductViewModel

    init(frame: CGRect) {
        viewModel = ProductViewModel()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = nil
        setupCells()
        register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.identifier)
    }

    private func setupCells() {
        viewModel.parsData { [weak self] value in
            self?.productStruct = value
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int { 5 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        cell.cellId = indexPath.row
        cell.productStruct = productStruct
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
