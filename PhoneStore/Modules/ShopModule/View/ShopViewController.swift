//
// PhoneStore
// ShopViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class ShopViewController: UIViewController {
    weak var coordinator: MainCoordinator?

  	private let transition: PanelTransition

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

    private lazy var carouselCollectionView: CarouselCollectionView = {
        let carouselCollectionView = CarouselCollectionView(frame: view.frame)
        carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return carouselCollectionView
    }()

    deinit {
      NotificationCenter.default.removeObserver(self)
    }

    init(_ coordinator: MainCoordinator) {
      self.coordinator = coordinator
      self.transition = PanelTransition()
      super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        setupStyle()
        addSubviews()
        setupConstraints()
    }

    private func setupStyle() {
      	self.tabBarController?.title = "Explorer"
      	self.tabBarController?.tabBar.tintColor = .white
        view.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
      	navigationItem.title = "Moscow, Ru"
        let filter = UIBarButtonItem(image: UIImage(named: "Filter")?.withRenderingMode(.alwaysOriginal),
                                     style: .done,
                                     target: self,
                                     action: #selector(filterTapped))
        navigationItem.rightBarButtonItems = [filter]
      	NotificationCenter.default.addObserver(self, selector: #selector(openProductViewController),
                                                     name: .popProductView,
                                                     object: nil)
    }

		@objc
    private func openProductViewController() {
      guard let coordinator = coordinator else {
        return
      }
      let viewController =  coordinator.getProductViewController()
      viewController.modalPresentationStyle = .fullScreen
      present(viewController, animated: true)
    }

    @objc
    private func filterTapped() {
        guard let coordinator = coordinator else {
            return
        }
        let filter = coordinator.getFilterViewController()
      	filter.transitioningDelegate = transition
        filter.modalPresentationStyle = .custom
        present(filter, animated: true)
    }

    private func addSubviews() {
      	addSubviews([
					viewAllButton,
          categoryLabel,
          collectionView,
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
            categoryLabel.trailingAnchor.constraint(equalTo: viewAllButton.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.bounds.height / 7),
        ])

        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            carouselCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}
