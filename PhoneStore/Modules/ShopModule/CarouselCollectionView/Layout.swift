//
// PhoneStore
// Layout.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

extension CarouselCollectionView {
    static func configureLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, _ -> NSCollectionLayoutSection? in
            if sectionNumber == 0 {
                return createHotSalesLayout() /// Ячейка с HotSales
            } else {
                return createBasicLayout(sectionNumber: sectionNumber) /// Ячейки с телефонами
            }
        }
    }

    private static func createHotSalesLayout() -> NSCollectionLayoutSection? {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 5
      	let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                       heightDimension: .fractionalHeight(0.4)),
            																						subitems: [item])
        group.contentInsets.leading = 10
      	group.contentInsets.trailing = 10
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return section
    }

    private static func createBasicLayout(sectionNumber _: Int) -> NSCollectionLayoutSection? {
     		let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.45),
                                                           heightDimension: .fractionalHeight(1)))
      	item.contentInsets.trailing = 8
      	let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.45)),
                                                     subitem: item, count: 2)
      	group.contentInsets.top = 16
      	group.contentInsets.leading = 8
      	group.contentInsets.trailing = 8
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}
