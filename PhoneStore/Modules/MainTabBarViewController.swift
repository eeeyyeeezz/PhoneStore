// 
// PhoneStore
// ViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//


import UIKit

class MainTabBarViewController: UITabBarController {

  private let shopViewController: ShopViewController = {
    let shop = ShopViewController()
    shop.tabBarItem = UITabBarItem(title: "",
                                   		image: UIImage(named: "Shop")?.withRenderingMode(.alwaysOriginal),
                                      selectedImage: UIImage(named: "Shop")?.withRenderingMode(.alwaysOriginal))
    return shop
  }()

  override func loadView() {
    super.loadView()
    setTabBar()
    setViewControllers()
  }

  private func setTabBar() {
    tabBar.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
    tabBar.tintColor = .black
    tabBar.isTranslucent = false
  }

  private func setViewControllers() {
		let navController = UINavigationController(rootViewController: shopViewController)

    viewControllers = [navController]
  }

}

