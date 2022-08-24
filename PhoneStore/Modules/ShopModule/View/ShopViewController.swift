//
// PhoneStore
// ShopViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class ShopViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Category"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("view all", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 0.431372549, blue: 0.3058823529, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let collectionView: CategoryCollectionView = {
        let collectionView = CategoryCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private let searchBar: SearchBar = {
        let search = SearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()

    private lazy var carouselCollectionView: CarouselCollectionView = {
        let carouselCollectionView = CarouselCollectionView(frame: view.frame)
        carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return carouselCollectionView
    }()

    override func loadView() {
        super.loadView()
        setupStyle()
        addSubviews()
        setupConstraints()
    }

    private func setupStyle() {
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        title = "Moscow, Ru"
        let filter = UIBarButtonItem(image: UIImage(named: "Filter")?.withRenderingMode(.alwaysOriginal),
                                     style: .done,
                                     target: self,
                                     action: #selector(filterTapped))

        navigationItem.rightBarButtonItems = [filter]
    }

    @objc
    private func filterTapped() {
        guard let coordinator = coordinator else {
            return
        }
        let filter = UINavigationController(rootViewController: coordinator.getFilterViewController())
        filter.modalPresentationStyle = .pageSheet
        present(filter, animated: true)
    }

    private func addSubviews() {
      	addSubviews([
					viewAllButton,
          categoryLabel,
          collectionView,
          searchBar,
          carouselCollectionView
        ])
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewAllButton.widthAnchor.constraint(equalToConstant: 80),
            viewAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])

        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            categoryLabel.trailingAnchor.constraint(equalTo: viewAllButton.leadingAnchor),
            categoryLabel.heightAnchor.constraint(equalToConstant: 40),
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 17),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 130),
        ])

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 35),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 34),
        ])

        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
