//
//  NSAttributedString+Extensions.swift
//  Pods
//
//  Created by Sander de Vos on 15/12/15.
//
//

extension NSAttributedString {
  convenience init(string: String, style: StyledString.Style) {
    self.init(string: string, attributes: style.attributes)
  }
}

func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
  let result = NSMutableAttributedString()
  result.appendAttributedString(lhs)
  result.appendAttributedString(rhs)
  return result
}