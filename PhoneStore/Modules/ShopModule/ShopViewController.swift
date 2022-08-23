// 
// PhoneStore
// ShopViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class ShopViewController: UIViewController {

  private let categoryLabel: UILabel = {
		let label = UILabel()
    label.text = "Select Category"
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let collectionView: CategoryCollectionView = {
    let collectionView = CategoryCollectionView()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  override func loadView() {
    super.loadView()
    addSubviews()
    setupConstraints()
    view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
  }

  private func addSubviews() {
    view.addSubview(categoryLabel)
    view.addSubview(collectionView)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
      categoryLabel.widthAnchor.constraint(equalToConstant: 200),
      categoryLabel.heightAnchor.constraint(equalToConstant: 40)
    ])

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 17),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: 90)
    ])
  }

}
