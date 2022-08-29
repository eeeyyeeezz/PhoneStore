// 
// PhoneStore
// CartView.swift
// Created by eeeyyeeezz on 29.08.2022
// Swift: 5.0
//


import UIKit

final class CartView: UIView {

  private let addToCartButton: UIButton = {
		let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    button.layer.cornerRadius = 15
//    button.setTitle("Add To Cart", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    addSubviews()
    setupConstraints()
  }

  private func addSubviews() {
    addSubviews([
			addToCartButton
    ])
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      addToCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
      addToCartButton.heightAnchor.constraint(equalToConstant: 54)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
