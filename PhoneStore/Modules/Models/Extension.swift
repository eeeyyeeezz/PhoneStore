// 
// PhoneStore
// Extension.swift
// Created by eeeyyeeezz on 24.08.2022
// Swift: 5.0
//


import UIKit

extension UIViewController {

  func addSubviews(_ views: [UIView]) {
    views.forEach {
      view.addSubview($0)
    }
  }
}

extension UICollectionViewCell {

  func addSubviews(_ views: [UIView]) {
    views.forEach {
      addSubview($0)
    }
  }
}
