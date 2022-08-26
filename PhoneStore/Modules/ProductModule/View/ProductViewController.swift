// 
// PhoneStore
// ProductViewController.swift
// Created by eeeyyeeezz on 25.08.2022
// Swift: 5.0
//


import UIKit

class ProductViewController: UIViewController {

  weak var coordinator: MainCoordinator?

  private lazy var collectionView: ProductCollectionView = {
    let collection = ProductCollectionView(frame: view.frame)
    collection.translatesAutoresizingMaskIntoConstraints = false
    return collection
  }()

  init(_ coordinator: MainCoordinator) {
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    super.loadView()
    setupStyle()
    addSubviews()
    setupConstraints()
  }

  private func setupStyle() {
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    navigationItem.title = "Product Details"
  }

  private func addSubviews() {
    addSubviews([
			collectionView
    ])
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
