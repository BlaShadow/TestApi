//
//  FeedViewController.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class FeedViewController: MovieListBaseViewController {
  override func fetchMovies(with completion: @escaping ([Movie]) -> Void) {
    MoviesResponseHandler.retrieveMovies { movies in
      if let movies = movies {
        completion(movies)
      }
    }
  }
}
