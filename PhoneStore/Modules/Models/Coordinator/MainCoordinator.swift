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
        let vc = MainTabBarViewController(self)
        navigationController.pushViewController(vc, animated: false)
    }

    func getShopViewController() -> UIViewController {
        let shop = ShopViewController(self)
//        shop.tabBarItem = UITabBarItem(title: "Aboba", image: nil, selectedImage: nil)
      	shop.tabBarItem = UITabBarItem(title: "Explorer",
                                     image: UIImage(named: "Phone")?.withRenderingMode(.alwaysOriginal),
                                     selectedImage: UIImage(named: "Phone")?.withRenderingMode(.alwaysOriginal))
        return shop
    }

    func getProductViewController() -> UIViewController {
      let product = ProductViewController(self)
      product.tabBarItem = UITabBarItem(title: "",
                                     image: UIImage(named: "Shop")?.withRenderingMode(.alwaysOriginal),
                                     selectedImage: UIImage(named: "Shop")?.withRenderingMode(.alwaysOriginal))
      return product
    }

    func getFilterViewController() -> UIViewController {
        let filter = FilterViewController()

        return filter
    }
}
