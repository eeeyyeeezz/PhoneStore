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

  private lazy var progressView: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .large)
    view.color = .white
    view.center = center
    view.stopAnimating()
    return view
  }()

  private let phoneImage: UIImageView = {
		let image = UIImageView()
    image.layer.cornerRadius = 15
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private lazy var newView: UIView = {
		let view = UIView()
    view.backgroundColor = .orange
    debugPrint("corner", (frame.height / 6) / 2, frame.height / 6)
    view.layer.cornerRadius = ((frame.height / 6) / 2)
    view.isHidden = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let newLabel: UILabel = {
    let label = UILabel()
    label.text = "New"
    label.textColor = .white
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
    label.font = label.font.withSize(15)
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
      progressView.startAnimating()
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
            self?.phoneImage.image = image
          }
        }
      }
    }
  }

  private func addSubviews() {
    addSubviews([
      progressView,
      phoneImage,
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
      phoneImage.topAnchor.constraint(equalTo: topAnchor),
      phoneImage.bottomAnchor.constraint(equalTo: bottomAnchor),
      phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor),
      phoneImage.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    NSLayoutConstraint.activate([
      newView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      newView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      newView.widthAnchor.constraint(equalToConstant: frame.height / 6),
      newView.heightAnchor.constraint(equalToConstant: frame.height / 6)
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
      newLabel.topAnchor.constraint(equalTo: newView.topAnchor),
      newLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
      newLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
      newLabel.bottomAnchor.constraint(equalTo: newView.bottomAnchor)
    ])

    NSLayoutConstraint.activate([
      phoneNameLabel.topAnchor.constraint(equalTo: newView.bottomAnchor, constant: 10),
      phoneNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
    ])

    NSLayoutConstraint.activate([
      parametrsLabel.topAnchor.constraint(equalTo: phoneNameLabel.bottomAnchor, constant: 10),
      parametrsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
    ])

    NSLayoutConstraint.activate([
      buyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
      buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(frame.height / 10)),
      buyButton.widthAnchor.constraint(equalToConstant: 98),
      buyButton.heightAnchor.constraint(equalToConstant: 23)
    ])

  }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
