//
//  MoviesResponseHandler.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

class MoviesResponseHandler: NSObject {
  static func retrieveMovies(with completion: @escaping (_ items: [Movie]?) -> Void) {
    MoviesServiceClient.retrieveMovies { (_, rawResult) in

      guard let rawResult = rawResult else {
        return completion(nil)
      }

      DispatchQueue.main.async {
        completion(DataParser().parseListOfMovies(rawData: rawResult))
      }
    }
  }
}
