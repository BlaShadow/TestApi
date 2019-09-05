//
//  MenuView.swift
//  Pelis
//
//  Created by Blashadow on 9/5/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class MenuView: UIView {
  var buttonContainer: UIView = {
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false

    return view
  }()

  private static let buttonCreator = { (text: String) -> UIButton in
    let item = UIButton(type: UIButton.ButtonType.roundedRect)

    item.translatesAutoresizingMaskIntoConstraints = false
    item.titleLabel?.font = UIFont(name: "Helvetica", size: 24)
    item.setTitle(text, for: UIControl.State.normal)

    item.setTitleColor(UIColor(hexValue: 0x333), for: UIControl.State.normal)
    item.setTitleColor(UIColor(hexValue: 0xFAFAFA), for: UIControl.State.selected)

    return item
  }

  var feedButton: UIButton = MenuView.buttonCreator("Feed")
  var watchListButton: UIButton = MenuView.buttonCreator("Watch List")

  init() {
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false

    self.setupViewConstraint()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViewConstraint() {
    addSubview(buttonContainer)

    NSLayoutConstraint.activate([
      buttonContainer.widthAnchor.constraint(equalToConstant: 200),
      buttonContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
      buttonContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
      buttonContainer.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])

    buttonContainer.addSubview(feedButton)

    NSLayoutConstraint.activate([
      feedButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor),
      feedButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
      feedButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor),
      feedButton.topAnchor.constraint(equalTo: buttonContainer.topAnchor)
    ])

    buttonContainer.addSubview(watchListButton)

    NSLayoutConstraint.activate([
      watchListButton.widthAnchor.constraint(equalTo: buttonContainer.widthAnchor),
      watchListButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
      watchListButton.centerXAnchor.constraint(equalTo: buttonContainer.centerXAnchor),
      watchListButton.topAnchor.constraint(equalTo: feedButton.bottomAnchor),
      watchListButton.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor)
    ])
  }
}
