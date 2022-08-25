// 
// PhoneStore
// HotSellCell.swift
// Created by eeeyyeeezz on 24.08.2022
// Swift: 5.0
//

import UIKit

class HotSellCell: UICollectionViewCell {
  static let identifier: String = "HotSellCell"

  var homeStore: [HomeStore]?

  var cellId: Int?

  private let iphoneImage: UIImageView = {
		let image = UIImageView()
    image.layer.cornerRadius = 15
    image.contentMode = .scaleAspectFit
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

  private let phoneNameLabel: UILabel = {
		let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var stack: UIStackView = {
		let stack = UIStackView()
    stack.axis = .vertical
    stack.addArrangedSubview(newView)
    stack.addArrangedSubview(phoneNameLabel)
    stack.distribution = .fillProportionally
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()

  private let parametrsLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = label.font.withSize(25)
    label.adjustsFontSizeToFitWidth = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var buyButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Buy Now!", for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 5
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
    setupCell()
    addSubviews()
    setupConstraints()
  }

  private func setupCell() {
    guard let homeStore = homeStore, let cellId = cellId else {
      return
    }
    newView.isHidden = homeStore[cellId].isNew == nil ? true : false
    phoneNameLabel.text = homeStore[cellId].title
    parametrsLabel.text = homeStore[cellId].subtitle
    setImage(homeStore[cellId].picture, cellId)
  }

  private func setImage(_ urlString: String, _ cellId: Int) {
    guard let url = URL(string: urlString) else {
      return
    }
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.iphoneImage.image = image
          }
        }
      }
    }
  }

  private func addSubviews() {
    addSubviews([
			iphoneImage,
      newView,
      phoneNameLabel,
      parametrsLabel,
      buyButton
    ])

    newView.addSubview(newLabel)
  }

  @objc
  private func buyButtonTapped() {
    guard let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ") else {
      return
    }
    UIApplication.shared.open(url)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      iphoneImage.topAnchor.constraint(equalTo: topAnchor),
      iphoneImage.bottomAnchor.constraint(equalTo: bottomAnchor),
      iphoneImage.leadingAnchor.constraint(equalTo: leadingAnchor),
      iphoneImage.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    NSLayoutConstraint.activate([
      newView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      newView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      newView.widthAnchor.constraint(equalToConstant: 40),
      newView.heightAnchor.constraint(equalToConstant: 40)
    ])

    ///
//    NSLayoutConstraint.activate([
//      stack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//      stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
//      stack.widthAnchor.constraint(equalToConstant: 40),
//      stack.heightAnchor.constraint(equalToConstant: 40)
//
//    ])
    ///

    NSLayoutConstraint.activate([
      newLabel.centerXAnchor.constraint(equalTo: newView.centerXAnchor),
      newLabel.centerYAnchor.constraint(equalTo: newView.centerYAnchor)
    ])

    NSLayoutConstraint.activate([
      phoneNameLabel.topAnchor.constraint(equalTo: newView.bottomAnchor, constant: 10),
      phoneNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
    ])

    NSLayoutConstraint.activate([
      parametrsLabel.topAnchor.constraint(equalTo: phoneNameLabel.bottomAnchor, constant: 10),
      parametrsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      parametrsLabel.bottomAnchor.constraint(equalTo: phoneNameLabel.bottomAnchor, constant: 30)
    ])

    NSLayoutConstraint.activate([
      buyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
      buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -34),
      buyButton.widthAnchor.constraint(equalToConstant: 98),
      buyButton.heightAnchor.constraint(equalToConstant: 23)
    ])
  }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
