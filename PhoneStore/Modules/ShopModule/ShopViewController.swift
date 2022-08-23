// 
// PhoneStore
// ShopViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class ShopViewController: UIViewController {

//  private let coordinator: AppCoordinator

  private let categoryLabel: UILabel = {
		let label = UILabel()
    label.text = "Select Category"
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let viewAllButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("View all", for: .normal)
    button.tintColor = #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  let collectionView: CategoryCollectionView = {
    let collectionView = CategoryCollectionView()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()

  override func loadView() {
    super.loadView()
    setupStyle()
    addSubviews()
    setupConstraints()
    view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
  }

  private func setupStyle() {
    title = "Moscow, Ru"
    let filter = UIBarButtonItem(image: UIImage(named: "Filter")?.withRenderingMode(.alwaysOriginal),
                                 style: .done,
                                 target: self,
                                 action: #selector(filterTapped))

    navigationItem.rightBarButtonItems = [filter]
  }

  @objc
  private func filterTapped() {

  }

  private func addSubviews() {
    view.addSubview(viewAllButton)
    view.addSubview(categoryLabel)
    view.addSubview(collectionView)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      viewAllButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      viewAllButton.widthAnchor.constraint(equalToConstant: 80),
      viewAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
    ])

    NSLayoutConstraint.activate([
      categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
      categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
      categoryLabel.trailingAnchor.constraint(equalTo: viewAllButton.leadingAnchor),
      categoryLabel.heightAnchor.constraint(equalToConstant: 40)
    ])

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 17),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: 130)
    ])
  }

}
