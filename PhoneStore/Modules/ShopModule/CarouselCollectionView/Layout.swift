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
        if sectionNumber == 1 {
            return createCollectionViewLayout() /// Ячейка с HotSales
        } else {
            return createBasicLayout(sectionNumber: sectionNumber) /// Ячейки с телефонами
        }
    }
}

private static func createCollectionViewLayout() -> NSCollectionLayoutSection? {
    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .fractionalHeight(1)))
    item.contentInsets.trailing = 5
    let group = NSCollectionLayoutGroup.horizontal(layoutSize:
        .init(widthDimension: .fractionalWidth(0.35),
              heightDimension: .fractionalHeight(0.2)),
        subitems: [item])
    group.contentInsets.leading = 10
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    return section
}

private static func createBasicLayout(sectionNumber: Int) -> NSCollectionLayoutSection? {
    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .fractionalHeight(1)))
    item.contentInsets.top = 16
    let height: NSCollectionLayoutDimension =
        .fractionalHeight((sectionNumber == 0 || sectionNumber == 3 || sectionNumber == 5) ? 0.15 : 0.25)
    let group = NSCollectionLayoutGroup.horizontal(layoutSize:
        .init(widthDimension:
            .fractionalWidth(1),
            heightDimension: height), subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    return section
}
}
