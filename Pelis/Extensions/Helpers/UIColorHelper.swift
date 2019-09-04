//
//  UIColorHelper.swift
//  Pelis
//
//  Created by Blashadow on 9/3/19.
//  Copyright © 2019 Blashadow. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(hexValue: Int) {
    let components = (
      R: CGFloat((hexValue >> 16) & 0xff) / 255,
      G: CGFloat((hexValue >> 08) & 0xff) / 255,
      B: CGFloat((hexValue >> 00) & 0xff) / 255
    )
    self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
  }
}
