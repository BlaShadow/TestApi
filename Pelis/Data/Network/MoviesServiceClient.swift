//
//  MoviesServiceClient.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit
import Alamofire

typealias MoviesCompletion = (_ error: Error?, _ items: [[String: Any]]?) -> Void

class MoviesServiceClient: NSObject {
  static func retrieveMovies(with completion: @escaping MoviesCompletion) {

    let url = String(format: "%@discover/movie", Constants.Api.moviesApiBaseUrl)

    let parameters: Parameters = [
      "primary_release_year": "2019",
      "sort_by": "popularity.desc",
      "api_key": Constants.Api.movieApiKey
    ]

    Alamofire.request(url, parameters: parameters, encoding: JSONEncoding.default)
      .responseJSON(completionHandler: { response in
        guard let jsonData = response.value as? [String: Any] else {
          return
        }

        guard let rawMovies = jsonData["results"] as? [[String: Any]] else {
          return
        }

        // Completion handler
        completion(nil, rawMovies)
    })
  }
}
