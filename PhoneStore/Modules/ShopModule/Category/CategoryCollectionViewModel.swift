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

  func setupTextCellLabel(_ indexPath: IndexPath) -> String {
    switch indexPath.row {
    case 0:
      return "Phones"
    case 1:
      return "Health"
    case 2:
      return "Computer"
    case 3:
      return "Books"
    default:
      return "Default"
    }
  }

  func checkSelectedCells(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> Bool {
    for i in 0...3 {
      let customIndexPath = IndexPath(item: i, section: 0)
      let cell = collectionView.cellForItem(at: customIndexPath) as! CategoryCell
      if cell.view.backgroundColor == .orange, indexPath != customIndexPath {
        return true
      }
    }
    return false
  }

}
