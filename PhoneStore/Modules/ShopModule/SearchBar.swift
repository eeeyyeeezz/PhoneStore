// 
// PhoneStore
// SearchBar.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class SearchBar: UISearchBar {

  override init(frame: CGRect) {
    super.init(frame: frame)
    barStyle = .default
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
