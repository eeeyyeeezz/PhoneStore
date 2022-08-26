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
            return UIImage(named: "Heart")?.withRenderingMode(.alwaysTemplate)
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

    private func checkSelectedCells(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
        for i in 0 ... 3 {
            let customIndexPath = IndexPath(item: i, section: 0)
            let cell = collectionView.cellForItem(at: customIndexPath) as! CategoryCell
            if cell.view.backgroundColor == .orange, indexPath != customIndexPath {
              cell.imageCell.tintColor = #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.768627451, alpha: 1)
              cell.view.backgroundColor = .white
            }
        }
    }

  func setupCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) {
    checkSelectedCells(collectionView, indexPath)

    let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
    if cell.isSelected {
        if cell.view.backgroundColor == .white {
          	cell.imageCell.tintColor = .white
            cell.view.backgroundColor = .orange
        } else {
          	cell.imageCell.tintColor = #colorLiteral(red: 0.7058823529, green: 0.7058823529, blue: 0.768627451, alpha: 1)
            cell.view.backgroundColor = .white
        }
    }
  }
}
