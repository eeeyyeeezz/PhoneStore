// 
// PhoneStore
// CollectionViewLayout.swift
// Created by eeeyyeeezz on 23.08.2022
// Swift: 5.0
//

import UIKit

class ParametrsCell: UICollectionViewCell {
    static let identifier: String = "ParametrsCollectionViewCell"

    lazy var value: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var magnitude: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5333333333, green: 0.537254902, blue: 0.537254902, alpha: 1)
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
        layer.cornerRadius = 25
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CarouselCollectionView: UICollectionView {

  init(frame: CGRect) {
    	super.init(frame: frame, collectionViewLayout: CarouselCollectionView.configureLayout())
      delegate = self
      dataSource = self
      backgroundColor = .black
//      register(ParametrsCell.self, forCellWithReuseIdentifier: ParametrsCell.identifier)
//      register(LabelCell.self, forCellWithReuseIdentifier: LabelCell.identifier)
      translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension CarouselCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 2 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: ParametrsCell.identifier, for: indexPath) as! ParametrsCell

    return cell
  }

}
