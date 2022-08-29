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

  private lazy var customLeftBarButton: UIButton = {
    let button = CustomButton(frame: CGRect(x: 25,
                                                 y: 50,
                                                 width: 37,
                                                 height: 37),
                              image: UIImage(named: "BackArrow"))
    button.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
    return button
  }()

  private lazy var customRightBarButton: UIButton = {
    let button = CustomButton(frame: CGRect(x: view.bounds.maxX - 50,
                                            y: 50,
                                            width: 37, height: 37),
                                   image: UIImage(named: "Shop"))
    button.backgroundColor = #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    button.layer.cornerRadius = 10
    return button
  }()

	@objc
  private func leftButtonTapped() {
    self.dismiss(animated: true)
  }

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
    view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
//    tabBarController?.tabBar.isHidden = true
    navigationItem.title = "Product Details"
  }

  private func addSubviews() {
    addSubviews([
      collectionView,
      customLeftBarButton,
      customRightBarButton
    ])
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
