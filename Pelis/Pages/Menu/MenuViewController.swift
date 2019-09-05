//
//  MenuViewController.swift
//  Pelis
//
//  Created by Blashadow on 9/5/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
  let buttonContainerWidth: CGFloat = 300
  var menuView = MenuView()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(menuView)

    setupMenuConstraints()

    setupButtonsActions()
  }

  private func setupMenuConstraints() {
    let result = MenuTransitioningManager.snapshotScale * MenuTransitioningManager.snapshotDistance
    let width = UIScreen.main.bounds.size.width - result

    NSLayoutConstraint.activate([
      menuView.widthAnchor.constraint(equalToConstant: width),
      menuView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
      menuView.leftAnchor.constraint(equalTo: view.leftAnchor),
      menuView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  private func setupButtonsActions() {
    // Feed button
    menuView.feedButton.addTarget(self, action: #selector(openFeed), for: .touchDown)

    // Watch list
    menuView.feedButton.addTarget(self, action: #selector(openWatchList), for: .touchDown)
  }

  @objc private func openFeed() {
    closeMenu()
  }

  @objc private func openWatchList() {
  }

  @objc func closeMenu() {
    dismiss(animated: true, completion: nil)
  }
}
