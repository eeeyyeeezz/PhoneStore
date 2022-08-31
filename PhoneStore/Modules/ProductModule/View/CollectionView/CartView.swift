// 
// PhoneStore
// CartView.swift
// Created by eeeyyeeezz on 29.08.2022
// Swift: 5.0
//


import UIKit

private struct CartViewModel {
  func parsData(_ completion: @escaping ((CartStruct) -> Void)) {
    if let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") {
      URLSession.shared.dataTask(with: url) { data, _, error in
        if let data = data {
          do {
              let result = try JSONDecoder().decode(CartStruct.self, from: data)
              completion(result)
          } catch {
              debugPrint(error)
          }
        }
      }.resume()
    }
  }
}

final class CartView: UIView {

  private let addToCartButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.431372549, blue: 0.3058823529, alpha: 1)
    button.layer.cornerRadius = 15
    button.setTitle("Add To Cart", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
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
