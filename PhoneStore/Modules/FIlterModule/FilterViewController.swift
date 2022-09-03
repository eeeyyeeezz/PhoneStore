//
// PhoneStore
// FilterViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class FilterViewController: UIViewController {
    private lazy var dismissButton: UIButton = {
			let button = UIButton(frame: CGRect(x: 20, y: 20, width: 25, height: 25))
      button.layer.cornerRadius = 7.5
      button.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
      button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
      return button
    }()

    override func loadView() {
        super.loadView()
        setupStyle()
      	addSubviews()
    }

  	@objc
    private func dismissController() {
      self.dismiss(animated: true)
    }

    private func setupStyle() {
      view.layer.cornerRadius = 10
      title = "Filter options"
      view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    private func addSubviews() {
      addSubviews([
				dismissButton
      ])
    }
}
