//
//  MovieCollectionViewCell.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
  let containerView: UIView = {
    let view = UIView(frame: .zero)

    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 10.0
    view.clipsToBounds = true
    view.backgroundColor = UIColor(hexValue: 0xF0F0F0)

    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupDataCell() {
  }

  private func setupView() {
    contentView.addSubview(containerView)
  }
}
