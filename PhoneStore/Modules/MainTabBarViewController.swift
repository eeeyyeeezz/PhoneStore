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
                                      image: UIImage(named: "Shop"),
                                      selectedImage: UIImage(named: "Shop"))
    return shop
  }()

  override func loadView() {
    super.loadView()
    setTabBar()
    setViewControllers()
  }

  private func setTabBar() {
    tabBar.backgroundColor = #colorLiteral(red: 0.8823529412, green: 0.8078431373, blue: 0.8117647059, alpha: 1)
    tabBar.tintColor = .black
    tabBar.isTranslucent = false
  }

  private func setViewControllers() {
    viewControllers = [shopViewController]
  }

}

