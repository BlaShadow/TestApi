//
//  MovieCollectionViewCell.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit
import Nuke

protocol MovieCellActionResponderProtocol {
  func didTapFavoriteIcon(movie: Movie)
}

class MovieCollectionViewCell: UICollectionViewCell {
  private weak var movie: Movie?
  private var actionResponder: MovieCellActionResponderProtocol?

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

  let favoriteIcon: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "FavoriteIconLine")
    imageView.isUserInteractionEnabled = true

    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupDataCell(responder: MovieCellActionResponderProtocol, with movieParam: Movie) {
    actionResponder = responder
    movie = movieParam

    favoriteIcon.image = imageForFavoriteValue(movieParam.favorite)

    let posterImageUrl = URL(string: movieParam.posterImageUrl)

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

    containerView.addSubview(favoriteIcon)

    NSLayoutConstraint.activate([
      favoriteIcon.widthAnchor.constraint(equalToConstant: 20),
      favoriteIcon.heightAnchor.constraint(equalToConstant: 20),
      favoriteIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
      favoriteIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
    ])

    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteIconTapped))
    favoriteIcon.addGestureRecognizer(tapGesture)
  }

  @objc private func favoriteIconTapped() {
    if let movie = movie, let responder = actionResponder {
      responder.didTapFavoriteIcon(movie: movie)

      DatabaseManager.shared.update {
        movie.favorite = !movie.favorite
        favoriteIcon.image = imageForFavoriteValue(movie.favorite)
      }
    }
  }

  private func imageForFavoriteValue(_ value: Bool) -> UIImage? {
    if value {
      return UIImage(named: "FavoriteIconFilled")
    }

    return UIImage(named: "FavoriteIconLine")
  }
}
