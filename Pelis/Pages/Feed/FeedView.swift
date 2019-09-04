//
//  FeedView.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class FeedView: UIView {
  var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.layoutMargins = .zero
    collectionView.backgroundColor = UIColor.white
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.showsVerticalScrollIndicator = false

    return collectionView
  }()

  init() {
    super.init(frame: .zero)

    self.translatesAutoresizingMaskIntoConstraints = false

    self.setupViewConstraint()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViewConstraint() {
    self.addSubview(collectionView)

    NSLayoutConstraint.activate([
      collectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
      collectionView.heightAnchor.constraint(equalTo: self.heightAnchor),
      collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
}
