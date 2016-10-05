//
//  ViewController+Q42Projects.swift
//  StyledStringExample
//
//  Created by Tom Lokhorst on 2015-12-12.
//  Copyright © 2015 Tom Lokhorst. All rights reserved.
//

import Foundation
import StyledString

extension ViewController {
  func q42Projects() -> StyledString {
    return [
      thin("Swift ") + light("CancellationToken"),
      thin("Swift ") + light("JsonGen"),
      light("SegueManager"),
      light("Promissum"),
      light("ElementDiff"),
      light("Styled") + thin("String"),
      light("Xcode") + thin(".swift"),
      light("R") + thin(".swift"),
    ]
    .joined(separator: "\n")
  }

  private func thin(_ str: String) -> StyledString {
    return StyledString(str)
      .withForegroundColor(UIColor(red: 0.204, green: 0.204, blue: 0.204, alpha: 1.0))
      .withFont(.systemFont(ofSize: 72, weight: UIFontWeightThin))
  }

  private func light(_ str: String) -> StyledString {
    return StyledString(str)
      .withForegroundColor(.black)
      .withFont(.systemFont(ofSize: 72, weight: UIFontWeightLight))
  }
}
