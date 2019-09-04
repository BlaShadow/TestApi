//
//  MoviesServiceClient.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit
import Alamofire

class MoviesServiceClient: NSObject {
  static func retrieveMovies() {

    let url = String(format: "%@discover/movie", Constants.Api.moviesApiBaseUrl)

    let parameters: Parameters = [
      "primary_release_year": "2019",
      "sort_by": "popularity.desc",
      "api_key": Constants.Api.movieApiKey
    ]

    Alamofire.request(url, parameters: parameters, encoding: JSONEncoding.default)
      .responseJSON(completionHandler: { jsonData in
      print(jsonData.request?.url?.absoluteString)
      print(jsonData.result)
      print(jsonData.value)
    })
  }
}
