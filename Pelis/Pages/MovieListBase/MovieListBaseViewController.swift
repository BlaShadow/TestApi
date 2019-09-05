//
//  MovieListBaseViewController.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

protocol MovieListBaseProtocol {
  func fetchMovies(with completion: @escaping (_ movies: [Movie]) -> Void)
}

class MovieListBaseViewController: UIViewController, MovieListBaseProtocol {
  private let movieListView = MovieListView()
  private var movieCollectionHandler: MoviesCollectionHandler?
  private let menuTransitioningManager = MenuTransitioningManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    // Setup movies delegate & datasource
    movieCollectionHandler = MoviesCollectionHandler(collectionView: movieListView.collectionView)

    view.addSubview(movieListView)

    NSLayoutConstraint.activate([
      movieListView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
      movieListView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
      movieListView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      movieListView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])

    refreshMovies()

    let drawerButton = UIBarButtonItem(title: "☰", style: .plain, target: self, action: #selector(openDrawer))
    navigationItem.leftBarButtonItem = drawerButton
  }

  func refreshMovies() {
    fetchMovies { [weak self] (movies) in
      self?.movieCollectionHandler?.update(movies: movies)
    }
  }

  @objc func openDrawer() {
    let menuController = MenuViewController()
    menuController.transitioningDelegate = menuTransitioningManager

    present(menuController, animated: true, completion: nil)
  }

  func fetchMovies(with completion: @escaping ([Movie]) -> Void) {
  }
}
