// 
// PhoneStore
// PhoneCell.swift
// Created by eeeyyeeezz on 24.08.2022
// Swift: 5.0
//

import UIKit

class PhoneCell: UICollectionViewCell {
    static let identifier: String = "PhoneCell"

  	var bestSeller: [BestSeller]?

  	var cellId: Int?

  	private var likeButtonSelected: Bool = false

    private lazy var progressView: UIActivityIndicatorView = {
      let view = UIActivityIndicatorView(style: .large)
      view.color = .white
      view.center = center
      view.stopAnimating()
      return view
    }()

    private let phoneNameLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont(name: "MarkPro", size: 10)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    private let priceLabel: UILabel = {
      let label = UILabel()
      label.font = UIFont(name: "MarkPro", size: 16)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    private let discountLabel: UILabel = {
      let label = UILabel()
      let attributedText = NSAttributedString(
          string: "Loading...",
          attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
      )
      label.attributedText = attributedText
      label.textColor = .gray
      label.font = label.font.withSize(15)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    private let phoneImage: UIImageView = {
      let image = UIImageView()
      image.layer.cornerRadius = 15
      image.contentMode = .scaleAspectFit
      image.translatesAutoresizingMaskIntoConstraints = false
      return image
    }()

    private lazy var likeButton: UIButton = {
      let button = UIButton(type: .system)
      button.layer.cornerRadius = 15
      button.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
      button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    private let likeImage: UIImageView = {
      let image = UIImageView(image: UIImage(named: "EmptyLike"))
      image.translatesAutoresizingMaskIntoConstraints = false
      return image
    }()

    override init(frame: CGRect) {
      super.init(frame: frame)
      backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.9882352941, blue: 0.9882352941, alpha: 1)
      layer.cornerRadius = 25
    }

    override func layoutSubviews() {
      super.layoutSubviews()
      setupCell()
      addSubviews()
      setupConstraints()
    }

    override func prepareForReuse() {
      super.prepareForReuse()
      phoneNameLabel.text = ""
      priceLabel.text = ""
      phoneImage.image = nil
    }

  	@objc
  	private func likeButtonTapped(_ sender: UIButton) {
      // Здесь добавлять лайкнутые позиции
      if !likeButtonSelected {
        likeImage.image = UIImage(named: "FillLike")
        likeButtonSelected = true
      } else {
        likeImage.image = UIImage(named: "EmptyLike")
        likeButtonSelected = false
      }
    }

    private func addSubviews() {
			addSubviews([
        progressView,
        phoneNameLabel,
        priceLabel,
        discountLabel,
        phoneImage,
        likeButton
      ])

      likeButton.addSubview(likeImage)
    }

    private func setupConstraints() {
      NSLayoutConstraint.activate([
        phoneNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
        phoneNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -38),
        phoneNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15)
      ])

      NSLayoutConstraint.activate([
        priceLabel.bottomAnchor.constraint(equalTo: phoneNameLabel.topAnchor, constant: -10),
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21)
      ])

      NSLayoutConstraint.activate([
        discountLabel.bottomAnchor.constraint(equalTo: phoneNameLabel.topAnchor, constant: -10),
        discountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 7),
        discountLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
      ])

      NSLayoutConstraint.activate([
        phoneImage.topAnchor.constraint(equalTo: topAnchor),
        phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
        phoneImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -21),
        phoneImage.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -5)
      ])

      NSLayoutConstraint.activate([
        likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
        likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        likeButton.widthAnchor.constraint(equalToConstant: 30),
        likeButton.heightAnchor.constraint(equalToConstant: 30)
      ])

      NSLayoutConstraint.activate([
        likeImage.centerXAnchor.constraint(equalTo: likeButton.centerXAnchor),
        likeImage.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
      ])
    }

    private func setupCell() {
      guard let bestSeller = bestSeller, let cellId = cellId else {
        progressView.startAnimating()
        return
      }
      phoneNameLabel.text = bestSeller[cellId].title
      priceLabel.text = "$" + String(bestSeller[cellId].priceWithoutDiscount)
      discountLabel.text = "$" + String(bestSeller[cellId].discountPrice)
      setImage(bestSeller[cellId].picture, cellId)
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

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
