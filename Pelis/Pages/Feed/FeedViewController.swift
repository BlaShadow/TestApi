//
//  FeedViewController.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
  private let feedView = FeedView()
  private var movieCollectionHandler: MoviesCollectionHandler?

  override func viewDidLoad() {
    super.viewDidLoad()

    // Setup movies delegate & datasource
    movieCollectionHandler = MoviesCollectionHandler(collectionView: feedView.collectionView)

    view.addSubview(feedView)
    NSLayoutConstraint.activate([
      feedView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
      feedView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
      feedView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      feedView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])

    MoviesResponseHandler.retrieveMovies { [weak self] movies in
      if let movies = movies {
        self?.movieCollectionHandler?.update(movies: movies)
      }
    }
  }
}
