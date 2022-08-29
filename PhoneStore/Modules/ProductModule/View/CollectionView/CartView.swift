// 
// PhoneStore
// CartView.swift
// Created by eeeyyeeezz on 29.08.2022
// Swift: 5.0
//


import UIKit

final class CartView: UIScrollView {

  override init(frame: CGRect) {
    super.init(frame: frame)
//    layer.cornerRadius = 15
    backgroundColor = .blue
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
