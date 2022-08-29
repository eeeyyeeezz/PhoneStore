// 
// PhoneStore
// ProductViewController.swift
// Created by eeeyyeeezz on 25.08.2022
// Swift: 5.0
//


import UIKit

final class ProductViewController: UIViewController {

  weak var coordinator: MainCoordinator?

  private lazy var collectionView: ProductCollectionView = {
    let collection = ProductCollectionView(frame: view.frame)
    collection.translatesAutoresizingMaskIntoConstraints = false
    return collection
  }()

  private let customRightBarButtonItem: UIBarButtonItem = {
		let view = CustomBarButtonItem(frame: CGRect(x: 0, y: 0, width: 37, height: 37),
                                   image: UIImageView(image: UIImage(named: "Shop")))
    view.backgroundColor = #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    view.layer.cornerRadius = 10
    return UIBarButtonItem(customView: view)
  }()

  private let leftRightBarButtonItem: UIBarButtonItem = {
    let view = CustomBarButtonItem(frame: CGRect(x: 0, y: 0, width: 37, height: 37),
                                   image: UIImageView(image: UIImage(named: "BackArrow")))
    view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
    view.layer.cornerRadius = 10
    return UIBarButtonItem(customView: view)
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
    navigationItem.leftBarButtonItem = leftRightBarButtonItem
    navigationItem.rightBarButtonItem = customRightBarButtonItem
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
      collectionView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2.5)
//      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
