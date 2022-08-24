//
// PhoneStore
// CategoryCell.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"

    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = (frame.height - frame.height / 3.5) / 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var imageCell: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var labelCell: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        addSubviews()
        setupConstraints()
    }

    private func setupStyle() {
        backgroundColor = nil
    }

    private func addSubviews() {
        addSubview(view)
        addSubview(labelCell)
        view.addSubview(imageCell)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.widthAnchor.constraint(equalToConstant: frame.height - (frame.height / 3.5)),
            view.heightAnchor.constraint(equalToConstant: frame.height - (frame.height / 3.5)),
        ])

        NSLayoutConstraint.activate([
            labelCell.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelCell.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelCell.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            imageCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
