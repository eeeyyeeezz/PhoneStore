//
// PhoneStore
// ViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class MainTabBarViewController: UITabBarController {
    weak var coordinator: MainCoordinator?

    init(_ coordinator: MainCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setViewControllers()
        setTabBarAppearance()
        setupStyle()
    }

    private func setTabBarAppearance() {
        tabBar.backgroundColor = nil
        let positionOnX: CGFloat = 7
        let positionOnY: CGFloat = 5
        let width = tabBar.bounds.width - (positionOnX * 2)
        let height = tabBar.bounds.height + (positionOnY * 2)

        let roundLayer = CAShapeLayer()

        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX,
                                                          y: tabBar.bounds.minY - positionOnY,
                                                          width: width,
                                                          height: height),
                                      cornerRadius: height / 2)
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.unselectedItemTintColor = .white
    }

    private func setupStyle() {
        navigationController?.isNavigationBarHidden = true
    }

    private func setTabBar() {
        tabBar.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
        tabBar.tintColor = .black
        tabBar.isTranslucent = false
    }

    private func setViewControllers() {
        guard let coordinator = coordinator else {
            return
        }
        let shopViewController = UINavigationController(rootViewController: coordinator.getShopViewController())
        viewControllers = [shopViewController]
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
