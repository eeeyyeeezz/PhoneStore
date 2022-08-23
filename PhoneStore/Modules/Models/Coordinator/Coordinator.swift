// 
// PhoneStore
// Coordinator.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get }

  func start()
}
