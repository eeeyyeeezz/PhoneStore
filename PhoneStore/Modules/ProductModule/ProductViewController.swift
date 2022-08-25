// 
// PhoneStore
// ProductViewController.swift
// Created by eeeyyeeezz on 25.08.2022
// Swift: 5.0
//


import UIKit

class ProductViewController: UIViewController {

  weak var coordinator: MainCoordinator?

  init(_ coordinator: MainCoordinator) {
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    super.loadView()
    setupStyle()
  }

  private func setupStyle() {
    view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
