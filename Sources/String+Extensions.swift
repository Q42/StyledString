//
//  String+Extensions.swift
//  Pods
//
//  Created by Sander de Vos on 15/12/15.
//
//

import Foundation

extension String {
  func substringWithRange(range: NSRange) -> String {
    let startIndex = self.startIndex.advancedBy(range.location)
    let endIndex = startIndex.advancedBy(range.length)
    return substringWithRange(Range(start: startIndex, end: endIndex))
  }
}