//
// PhoneStore
// CollectionViewLayout.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class CarouselCollectionView: UICollectionView {
    private var homeStore: [HomeStore]?
    private var bestSeller: [BestSeller]?
  	let viewModel: CarouselViewModel

    init(frame: CGRect) {
      	self.viewModel = CarouselViewModel()
        super.init(frame: frame, collectionViewLayout: CarouselCollectionView.configureLayout())
        delegate = self
        dataSource = self
      	backgroundColor = nil
      	setupCellsNumber()
        register(HotSellCell.self, forCellWithReuseIdentifier: HotSellCell.identifier)
        register(PhoneCell.self, forCellWithReuseIdentifier: PhoneCell.identifier)
        register(HeaderHotSales.self,
               forSupplementaryViewOfKind: HeaderHotSales.categoryId,
               withReuseIdentifier: HeaderHotSales.identifier)
      	register(HeaderPhone.self,
             forSupplementaryViewOfKind: HeaderPhone.categoryId,
             withReuseIdentifier: HeaderPhone.identifier)
    }

    private func setupCellsNumber() {
      viewModel.parsData { value in
        self.homeStore = value.homeStore
        self.bestSeller = value.bestSeller
        DispatchQueue.main.async {
          self.reloadData()
        }
      }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
}

extension CarouselCollectionView: UICollectionViewDataSource,
                                    UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      switch indexPath.section {
      case 0:
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: HeaderHotSales.identifier,
                                                                   for: indexPath)
        return header
      case 1:
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: HeaderPhone.identifier,
                                                                   for: indexPath)
        return header
      default:
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: HeaderHotSales.identifier,
                                                                   for: indexPath)
        return header
      }
    }

    func numberOfSections(in _: UICollectionView) -> Int { 2 }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { // HotSales
          guard let homeStore = homeStore else {
            return 1
          }
          return homeStore.count
        } else {
          guard let bestSeller = bestSeller else {
            return 1
          }
          return bestSeller.count
        }
    }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.section != 0 {
      NotificationCenter.default.post(name: .popProductView, object: nil)
    }
  }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 { // HotSales
          let cell = dequeueReusableCell(withReuseIdentifier: HotSellCell.identifier, for: indexPath) as! HotSellCell
          cell.homeStore = homeStore
          cell.cellId = indexPath.row
          return cell
        } else { // PhoneCell
          let cell = dequeueReusableCell(withReuseIdentifier: PhoneCell.identifier, for: indexPath) as! PhoneCell
          cell.bestSeller = bestSeller
          cell.cellId = indexPath.row
          return cell
        }
    }
}
