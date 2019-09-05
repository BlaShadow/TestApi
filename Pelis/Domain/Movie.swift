//
//  Movie.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class Movie: NSObject {
  let identifier: Int64
  let title: String
  let overview: String
  let releaseDate: Date
  let movieScore: Double
  let popularity: Double
  let backdropImagePath: String
  let posterImagePath: String

  var favorite = false
  var watchList = false

  init(identifier: Int64,
       title: String,
       overview: String,
       releaseDate: Date,
       movieScore: Double,
       backdropImage: String,
       posterImage: String,
       popularity: Double
    ) {

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
