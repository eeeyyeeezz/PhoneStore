// 
// PhoneStore
// CustomBarButtonItem.swift
// Created by eeeyyeeezz on 29.08.2022
// Swift: 5.0
//


import UIKit

// BarButton сделанный для вида, для действия кнопок переопределить нажатие на UIImageView (или сделать кнопкой)
final class CustomBarButtonItem: UIView {

  init(frame: CGRect, image: UIImageView?) {
    super.init(frame: frame)
    if let image = image {
      image.center = center
      addSubview(image)
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
