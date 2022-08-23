// 
// PhoneStore
// ViewController.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class MainTabBarViewController: UITabBarController {

  weak var coordinator: MainCoordinator?

  override func loadView() {
    super.loadView()
    setTabBar()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupStyle()
    setViewControllers()
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

}

