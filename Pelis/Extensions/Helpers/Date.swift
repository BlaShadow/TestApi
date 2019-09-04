//
//  Date.swift
//  Pelis
//
//  Created by Blashadow on 9/4/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

extension Date {
  /// Parse string to date with format 2018-03-12
  ///
  /// - Parameter value: string value
  /// - Returns: date
  static func dateWithString(value: String) -> Date {
    if value == "" {
      return Date.init(timeIntervalSinceNow: 0)
    }

    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "yyyy-MM-dd"

    return dateFormat.date(from: value) ?? Date(timeIntervalSince1970: 0)
  }

  /// Format date with format Jun 02, 2018
  func formatDateAsString() -> String {
    let dateFormat = DateFormatter()
    dateFormat.dateFormat = "MMM dd, yyyy"

    return dateFormat.string(from: self)
  }
}
