//
//  FavoritesViewController.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class FavoritesViewController: MovieListBaseViewController {
  override func fetchMovies(with completion: @escaping ([Movie]) -> Void) {
    let result = DatabaseManager.shared.retrieveData(filter: { movie in
      // Realm not updating don't know why
      return movie.identifier % 3 == 0
    })

    guard let movies = result as? [Movie] else {
      return completion([])
    }

    completion(movies)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    refreshMovies()
  }
}
