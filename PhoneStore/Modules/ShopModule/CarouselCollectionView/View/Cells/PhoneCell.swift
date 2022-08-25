// 
// PhoneStore
// PhoneCell.swift
// Created by eeeyyeeezz on 24.08.2022
// Swift: 5.0
//

import UIKit

//private let apiUrl = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"

class PhoneCellViewModel {


  init() {
    parsData()
  }

  private func parsData() {

  }

  func getImage() -> UIImageView {
    UIImageView()
  }

  func getPhoneName() -> String {
    "Iphone"
  }

  func getPrice() -> String {
    "1000$"
  }

  func getDiscountPrice() -> String {
    "5000$"
  }


}

class PhoneCell: UICollectionViewCell {
    static let identifier: String = "PhoneCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 25
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
