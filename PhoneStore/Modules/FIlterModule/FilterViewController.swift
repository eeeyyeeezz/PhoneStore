//
// PhoneStore
// FilterViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class FilterViewController: UIViewController {

    private lazy var dismissButton: UIBarButtonItem = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
        button.addTarget(self, action: #selector(dismissController), for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()

    override func loadView() {
        super.loadView()
        setupStyle()
    }

    @objc
    private func dismissController() {
        dismiss(animated: true)
    }

    private func setupStyle() {
        view.layer.cornerRadius = 20
        title = "Filter options"
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.leftBarButtonItem = dismissButton
    }
}
