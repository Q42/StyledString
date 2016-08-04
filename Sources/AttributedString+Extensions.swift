//
//  AttributedString+Extensions.swift
//  Pods
//
//  Created by Sander de Vos on 15/12/15.
//
//

import Foundation

extension AttributedString {
  convenience init(string: String, style: StyledString.Style) {
    self.init(string: string, attributes: style.attributes)
  }
}

func +(lhs: AttributedString, rhs: AttributedString) -> AttributedString {
  let result = NSMutableAttributedString()
  result.append(lhs)
  result.append(rhs)
  return result
}
