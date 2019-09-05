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

  @objc func nice() {
    print("Working great!")
  }

  func setupTabBarController() {

    let feedController = FeedViewController(nibName: nil, bundle: nil)
    let feedIcon = UIImage(named: "MoviesTabBarIcon")
    feedController.tabBarItem = UITabBarItem(title: "", image: feedIcon, tag: 0)
    feedController.edgesForExtendedLayout = []

    let navigation1 = UINavigationController(rootViewController: feedController)
    navigation1.navigationBar.topItem?.title = "Movies"

    let favoritesController = FavoritesViewController(nibName: nil, bundle: nil)
    let favoriteIcon = UIImage(named: "FavoritesTabBarIcon")
    favoritesController.tabBarItem = UITabBarItem(title: "", image: favoriteIcon, tag: 0)
    favoritesController.edgesForExtendedLayout = []

    let navigation2 = UINavigationController(rootViewController: favoritesController)
    navigation2.navigationBar.topItem?.title = "Favorites"

    self.viewControllers = [navigation1, navigation2]
  }
}
