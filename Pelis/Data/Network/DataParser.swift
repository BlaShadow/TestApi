//
//  DataParser.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class DataParser: NSObject {
  func parseListOfMovies(rawData: [[String: AnyObject]]) -> [Movie] {
    var result: [Movie] = []

    for item: [String: AnyObject] in rawData {
      result.append(parseSingleMovieWith(rawItem: item))
    }

    return result
  }

  fileprivate func parseSingleMovieWith(rawItem item: [String: AnyObject]) -> Movie {

    let identifier = item["id"]?.int64Value
    let title = item["title"] as? String ?? ""
    let overview = item["overview"] as? String ?? ""
    let releaseDateStr = item["release_date"] as? String ?? ""
    let releaseDate = Date.dateWithString(value: releaseDateStr)
    let backdropImagePath = item["backdrop_path"] as? String ?? ""
    let posterImagePath = item["poster_path"] as? String ?? ""
    let movieScore = item["vote_average"]?.doubleValue ?? 0.0
    let popularity = item["popularity"]?.doubleValue ?? 0.0

    let movie = Movie(identifier: identifier!,
          title: title,
          overview: overview,
          releaseDate: releaseDate,
          movieScore: movieScore ,
          backdropImage: backdropImagePath,
          posterImage: posterImagePath,
          popularity: popularity)

    return movie
  }
}
