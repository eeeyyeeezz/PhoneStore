// 
// PhoneStore
// CategoryCollectionViewModel.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//


import UIKit

struct CategoryCollectionViewModel {

  func getCellImage(_ indexPath: IndexPath) -> UIImage? {
    switch indexPath.row {
    case 0:
      return UIImage(named: "Phone")?.withRenderingMode(.alwaysTemplate)
    case 1:
      return UIImage(named: "Heart")?.withRenderingMode(.alwaysOriginal)
    case 2:
      return UIImage(named: "Computer")?.withRenderingMode(.alwaysTemplate)
    case 3:
      return UIImage(named: "Books")?.withRenderingMode(.alwaysTemplate)
    default:
      return UIImage()
    }
  }

}
