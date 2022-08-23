// 
// PhoneStore
// SceneDelegate.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var coordinator: MainCoordinator?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = scene as? UIWindowScene else { return }
    let navController = UINavigationController()
    coordinator = MainCoordinator(navController)
    coordinator?.start()

    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = navController
    self.window = window
    window.makeKeyAndVisible()
  }


}

