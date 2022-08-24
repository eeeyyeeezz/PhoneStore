// 
// PhoneStore
// HotSellCell.swift
// Created by eeeyyeeezz on 24.08.2022
// Swift: 5.0
//

import UIKit

class HotSellCell: UICollectionViewCell {
    static let identifier: String = "HotSellCell"

  private let iphoneImage: UIImageView = {
		let image = UIImageView(image: UIImage(named: "IphoneBackground"))
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

    override init(frame: CGRect) {
        super.init(frame: frame)
      	backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
        layer.cornerRadius = 15
    }

  override func layoutSubviews() {
    super.layoutSubviews()
    addSubviews()
    setupConstraints()
  }

  private func addSubviews() {
    addSubview(iphoneImage)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      iphoneImage.topAnchor.constraint(equalTo: topAnchor),
      iphoneImage.bottomAnchor.constraint(equalTo: bottomAnchor),
      iphoneImage.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
      iphoneImage.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
