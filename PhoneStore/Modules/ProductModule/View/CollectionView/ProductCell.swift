// 
// PhoneStore
// ProductCell.swift
// Created by eeeyyeeezz on 29.08.2022
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

  override func prepareForReuse() {
    super.prepareForReuse()
    phoneImage.image = nil
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setupCells()
    addSubviews()
    setupConstraints()
  }

  private func setupCells() {
    guard let productStruct = productStruct, let _ = cellId else {
      return
    }
    setImage(productStruct.images[Int.random(in: 0...1)])
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
      phoneImage.heightAnchor.constraint(equalToConstant: bounds.height)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


}
