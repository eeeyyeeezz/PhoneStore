// 
// PhoneStore
// CategoryCell.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class CategoryCell: UICollectionViewCell {

	static let identifier = "CategoryCell"

  private lazy var view: UIView = {
		let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    view.layer.cornerRadius = frame.height / 2
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var imageCell: UIImageView = {
		let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupStyle()
    addSubviews()
    setupConstraints()
  }

  private func setupStyle() {
    backgroundColor = nil
  }

  private func addSubviews() {
    addSubview(view)
    view.addSubview(imageCell)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      view.centerXAnchor.constraint(equalTo: centerXAnchor),
      view.centerYAnchor.constraint(equalTo: centerYAnchor),
      view.widthAnchor.constraint(equalToConstant: frame.height),
      view.heightAnchor.constraint(equalToConstant: frame.height),
    ])

    NSLayoutConstraint.activate([
      imageCell.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
