//
// PhoneStore
// HeaderHotSales.swift
// Created by eeeyyeeezz on 25.08.2022
// Swift: 5.0
//

import UIKit

class HeaderHotSales: UICollectionReusableView {
    static let categoryId = "HeaderHotSalesCategoryId"
    static let identifier = "HeaderHotSales"

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hot Sales"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("see more", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews()
        setupConstaints()
    }

    private func addSubviews() {
        addSubview(seeMoreButton)
        addSubview(label)
    }

    private func setupConstaints() {
        NSLayoutConstraint.activate([
            seeMoreButton.widthAnchor.constraint(equalToConstant: 80),
            seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            seeMoreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
