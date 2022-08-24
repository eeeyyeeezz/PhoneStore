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

  private let newView: UIView = {
		let view = UIView()
    view.backgroundColor = .orange
    view.layer.cornerRadius = 20
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let newLabel: UILabel = {
    let label = UILabel()
    label.text = "New"
    label.textColor = .white
    label.font = label.font.withSize(15)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let iphoneNameLabel: UILabel = {
		let label = UILabel()
    label.text = "Iphone 12"
    label.textColor = .white
    label.font = label.font.withSize(25)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let parametrsLabel: UILabel = {
    let label = UILabel()
    label.text = "Súper. Mega. Rápido."
    label.textColor = .white
    label.font = label.font.withSize(20)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var buyButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Buy Now!", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
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
    addSubviews([
			iphoneImage,
      newView,
      newLabel,
      iphoneNameLabel,
      parametrsLabel,
      buyButton
    ])
  }

  @objc
  private func buyButtonTapped() {
    guard let url = URL(string: "google.com") else {
      return
    }
    UIApplication.shared.openURL(url)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      iphoneImage.topAnchor.constraint(equalTo: topAnchor),
      iphoneImage.bottomAnchor.constraint(equalTo: bottomAnchor),
      iphoneImage.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
      iphoneImage.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    NSLayoutConstraint.activate([
      newView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      newView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      newView.widthAnchor.constraint(equalToConstant: 40),
      newView.heightAnchor.constraint(equalToConstant: 40)
    ])

    NSLayoutConstraint.activate([
      newLabel.centerXAnchor.constraint(equalTo: newView.centerXAnchor),
      newLabel.centerYAnchor.constraint(equalTo: newView.centerYAnchor)
    ])

    NSLayoutConstraint.activate([
      iphoneNameLabel.topAnchor.constraint(equalTo: newView.bottomAnchor, constant: 10),
      iphoneNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
    ])

    NSLayoutConstraint.activate([
      parametrsLabel.topAnchor.constraint(equalTo: iphoneNameLabel.bottomAnchor, constant: 10),
      parametrsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      parametrsLabel.bottomAnchor.constraint(equalTo: iphoneNameLabel.bottomAnchor, constant: 30)
    ])

    NSLayoutConstraint.activate([
      buyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
      buyButton.widthAnchor.constraint(equalToConstant: 175),
      buyButton.heightAnchor.constraint(equalToConstant: 30)
    ])
  }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
