//
// PhoneStore
// ProductCell.swift
// Created by eeeyyeeezz on 29.08.2022
// Swift: 5.0
//

import UIKit

class ProductCell: UICollectionViewCell {
    static let identifier = "ProductCell"

    var productStruct: ProductStruct?

    var cellId: Int?

    private let phoneImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupCells()
        addSubviews()
        setupConstraints()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        phoneImage.image = nil
    }

    private func setupCells() {
        guard let productStruct = productStruct, let _ = cellId else {
            return
        }
        setImage(productStruct.images[0])
    }

    private func setImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.phoneImage.image = image
                    }
                }
            }
        }
    }

    private func addSubviews() {
        addSubviews([
            phoneImage,
        ])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            phoneImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -15),
            phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 75),
            phoneImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
            phoneImage.heightAnchor.constraint(equalToConstant: bounds.height),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
