//
//  StyledStringTests.swift
//  StyledStringTests
//
//  Created by Tom Lokhorst on 2018-11-27.
//  Copyright © 2018 Q42. All rights reserved.
//

import XCTest
import StyledString

class StyledStringTests: XCTestCase {

  func testJoined() {
    let first = StyledString("First")
    let second = StyledString("Second")

    let joined = [first, second].joined(separator: "\n")

    let target = StyledString("First\nSecond")

    XCTAssertEqual(joined, target)
  }

  func testRightAlign() {
    let first = StyledString("First").with(alignment: .right)
    let second = StyledString("Second").with(alignment: .right)

    let joined = first + second

    let attributes = joined.attributedString.attributes(at: 0, effectiveRange: nil)
    let paragraphStyle = attributes[NSAttributedString.Key.paragraphStyle] as! NSParagraphStyle
    XCTAssertEqual(paragraphStyle.alignment, .right)
  }

}
