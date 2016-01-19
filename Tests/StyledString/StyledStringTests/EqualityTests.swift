//
//  EqualityTests.swift
//  StyledString
//
//  Created by Sander de Vos on 18/01/16.
//  Copyright © 2016 Sander de Vos. All rights reserved.
//

import XCTest
import StyledString

class EqualityTests: XCTestCase {
    
  func testEqualityNoAttributes() {

    let lhs = StyledString("test")
    let rhs = StyledString("test")

    XCTAssertEqual(lhs, rhs, "lhs should equal rhs")
  }

  func testInequalityNoAttributes() {

    let lhs = StyledString("lhs")
    let rhs = StyledString("rhs")

    XCTAssertNotEqual(lhs, rhs, "lhs should not equal rhs")
  }

  func testEqualityWithAttributes() {

    let lhs = StyledString("test").withShadow()
    let rhs = StyledString("test").withShadow()

    XCTAssertEqual(lhs, rhs, "lhs should equal rhs")
  }

  func testInequalityWithAttributes() {

    let lhs = StyledString("test").withShadow(CGSizeMake(10, 10))
    let rhs = StyledString("test").withShadow(CGSizeZero)

    XCTAssertNotEqual(lhs, rhs, "lhs should not equal rhs")
  }


}
