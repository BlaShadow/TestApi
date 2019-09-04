//
//  MoviesCollectionHandler.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class MoviesCollectionHandler: NSObject {
  private var items: [Movie] = []
  private weak var collectionView: UICollectionView?
  private let numberOfItemsPerRow = 3
  private let marginValue: CGFloat = 10
  private let movieCellIdentifier = "MOVIE"

  init(collectionView view: UICollectionView) {
    super.init()

    collectionView = view

    collectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: movieCellIdentifier)
    collectionView?.delegate = self
    collectionView?.dataSource = self
  }

  func update(movies moviesItems: [Movie]) {
    items += moviesItems

    collectionView?.reloadData()
  }
}

extension MoviesCollectionHandler: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdentifier, for: indexPath)

    guard let cellMovie = cell as? MovieCollectionViewCell else {
      return cell
    }

    cellMovie.setupDataCell(with: items[indexPath.row])

    return cell
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return marginValue
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: marginValue, left: marginValue, bottom: marginValue, right: marginValue)
  }
}

extension MoviesCollectionHandler: UICollectionViewDelegate {
}

extension MoviesCollectionHandler: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let availableWidth = collectionView.frame.width - 40
    let widthPerItem = Double(availableWidth) / Double(numberOfItemsPerRow)

    return CGSize(width: widthPerItem, height: widthPerItem)
  }
}
