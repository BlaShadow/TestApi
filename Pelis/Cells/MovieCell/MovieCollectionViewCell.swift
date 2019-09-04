//
//  MovieCollectionViewCell.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit
import Nuke

class MovieCollectionViewCell: UICollectionViewCell {
  let containerView: UIView = {
    let view = UIView(frame: .zero)

    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 10.0
    view.clipsToBounds = true
    view.backgroundColor = UIColor(hexValue: 0xF0F0F0)

    return view
  }()

  let posterImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = UIView.ContentMode.scaleAspectFill
    imageView.clipsToBounds = true

    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupDataCell(with movie: Movie) {
    let posterImageUrl = URL(string: movie.posterImageUrl)

    if let posterImageUrl = posterImageUrl {
      Nuke.loadImage(with: posterImageUrl, into: posterImageView)
    }
  }

  private func setupView() {
    contentView.addSubview(containerView)

    NSLayoutConstraint.activate([
      containerView.widthAnchor.constraint(equalTo: widthAnchor),
      containerView.heightAnchor.constraint(equalTo: heightAnchor),
      containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])

    containerView.addSubview(posterImageView)

    NSLayoutConstraint.activate([
      posterImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
      posterImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
      posterImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      posterImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
    ])
  }
}
