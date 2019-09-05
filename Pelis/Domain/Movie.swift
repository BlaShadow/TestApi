//
//  Movie.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit
import RealmSwift

class Movie: Object {
  @objc dynamic var identifier: Int64 = 0
  @objc dynamic var title: String = ""
  @objc dynamic var overview: String = ""
  @objc dynamic var releaseDate: Date = Date()
  @objc dynamic var movieScore: Double = 0.0
  @objc dynamic var popularity: Double = 0.0
  @objc dynamic var backdropImagePath: String = ""
  @objc dynamic var posterImagePath: String = ""

  @objc dynamic var favorite = false
  @objc dynamic var watchList = false

  convenience init(
    identifier: Int64,
    title: String,
    overview: String,
    releaseDate: Date,
    movieScore: Double,
    backdropImage: String,
    posterImage: String,
    popularity: Double
  ) {
    self.init()

    self.identifier = identifier
    self.title = title
    self.overview = overview
    self.releaseDate = releaseDate
    self.movieScore = movieScore
    self.backdropImagePath = backdropImage
    self.posterImagePath = posterImage
    self.popularity = popularity
  }

  var backDropImageUrl: String {
    return String(format: "https://image.tmdb.org/t/p/w780%@", self.backdropImagePath)
  }

  var posterImageUrl: String {
    return String(format: "https://image.tmdb.org/t/p/w500%@", self.posterImagePath)
  }

  enum CodingKeys: String, CodingKey {
    case identifier, title, overview, releaseDate, movieScore, backdropImagePath, posterImagePath, popularity
  }
}
