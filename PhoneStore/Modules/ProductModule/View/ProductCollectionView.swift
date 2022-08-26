// 
// PhoneStore
// ProductCollectionView.swift
// Created by eeeyyeeezz on 26.08.2022
// Swift: 5.0
//

import UIKit

class ProductCell: UICollectionViewCell {

	static let identifier = "ProductCell"

  var productStruct: ProductStruct?

  var cellId: Int?

  private let phoneImage: UIImageView = {
		let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setupCells()
    addSubviews()
    setupConstraints()
  }

  private func setupCells() {
    guard let productStruct = productStruct, let cellId = cellId else {
      return
    }
    setImage(productStruct.images[0])
  }

  private func setImage(_ urlString: String) {
    guard let url = URL(string: urlString) else {
      return
    }
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.phoneImage.image = image
          }
        }
      }
    }
  }

  private func addSubviews() {
		addSubviews([
			phoneImage
    ])
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      phoneImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
      phoneImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
      phoneImage.heightAnchor.constraint(equalToConstant: bounds.height / 2)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}

class ProductCollectionView: UICollectionView {

  private var productStruct: ProductStruct?

  private let viewModel: ProductViewModel

  init(frame: CGRect) {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    self.viewModel = ProductViewModel()
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

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension ProductCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 5 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
    cell.cellId = indexPath.row
    cell.productStruct = productStruct
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: frame.width, height: frame.height)
  }

}
