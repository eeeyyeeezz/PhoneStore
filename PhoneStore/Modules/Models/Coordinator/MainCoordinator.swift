//
// PhoneStore
// MainCoordinator.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = MainTabBarViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    func getShopViewController() -> UIViewController {
        let shop = ShopViewController()
        shop.coordinator = self
        shop.tabBarItem = UITabBarItem(title: "",
                                       image: UIImage(named: "Shop")?.withRenderingMode(.alwaysOriginal),
                                       selectedImage: UIImage(named: "Shop")?.withRenderingMode(.alwaysOriginal))
        return shop
    }

    func getFilterViewController() -> UIViewController {
        let filter = FilterViewController()

        return filter
    }
}
