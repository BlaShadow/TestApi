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
    items = moviesItems

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

    cellMovie.setupDataCell(responder: self, with: items[indexPath.row])

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
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
      if let cell = collectionView.cellForItem(at: indexPath) {
        cell.contentView.transform = .init(scaleX: 0.95, y: 0.95)
      }
    })
  }

  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
      if let cell = collectionView.cellForItem(at: indexPath) {
        cell.contentView.transform = CGAffineTransform.identity
      }
    })
  }
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

extension MoviesCollectionHandler: MovieCellActionResponderProtocol {
  func didTapFavoriteIcon(movie: Movie) {
    DatabaseManager.shared.setFavoriteMovie(movie: movie, value: !movie.favorite)

    if let collectionView = collectionView {
      let index = items.firstIndex(of: movie) ?? 0
      collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
  }
}
