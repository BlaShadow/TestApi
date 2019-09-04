//
//  Constant.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

struct Constants {
  struct Api {
    static let moviesApiBaseUrl = "https://api.themoviedb.org/3/"
    static let movieApiKey = "d5ab1c88c6fa0649cd46d8723ada06a0"

    fileprivate static let sortOptions = [
      SortOption.nameAsc: "original_title.asc",
      SortOption.nameDesc: "original_title.desc",

      SortOption.scoreAsc: "vote_average.asc",
      SortOption.scoreDesc: "vote_average.desc",

      SortOption.publishYearAsc: "release_date.asc",
      SortOption.publishYearDesc: "release_date.desc",

      SortOption.popularityAsc: "popularity.asc",
      SortOption.popularityDesc: "popularity.desc"
    ]

    static func stringForSortOption(sortOption: SortOption) -> String {
      return Api.sortOptions[sortOption] ?? ""
    }
  }
}
