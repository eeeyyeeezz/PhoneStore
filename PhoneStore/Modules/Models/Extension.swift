// 
// PhoneStore
// Extension.swift
// Created by eeeyyeeezz on 24.08.2022
// Swift: 5.0
//


import UIKit

// TODO: Передать нормально без повторения кода
extension UIViewController {

  func addSubviews(_ views: [UIView]) {
    views.forEach {
      view.addSubview($0)
    }
  }
}

extension UIView {
  func addSubviews(_ views: [UIView]) {
    views.forEach {
      addSubview($0)
    }
  }
}

extension Notification.Name {
    static let popProductView = Notification.Name("PopProductView")
}
