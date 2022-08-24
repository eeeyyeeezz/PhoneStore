//
// PhoneStore
// FilterViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class FilterViewController: UIViewController {
    override func loadView() {
        super.loadView()
        setupStyle()
        view.backgroundColor = .white
    }

    private func setupStyle() {
        title = "Filter options"
    }
}
