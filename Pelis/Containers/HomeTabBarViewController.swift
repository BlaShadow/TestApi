//
//  HomeTabBarViewController.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class HomeTabBarViewController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func setupTabBarController() {
    let feedController = FeedViewController(nibName: nil, bundle: nil)
    let feedIcon = UIImage(named: "MoviesTabBarIcon")
    feedController.tabBarItem = UITabBarItem(title: "Feed", image: feedIcon, tag: 0)

    let favoritesController = FavoritesViewController(nibName: nil, bundle: nil)
    let favoriteIcon = UIImage(named: "FavoritesTabBarIcon")
    favoritesController.tabBarItem = UITabBarItem(title: "Favorites", image: favoriteIcon, tag: 0)

    self.viewControllers = [feedController, favoritesController]
  }
}
