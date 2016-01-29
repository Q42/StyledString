//
//  StyleTests.swift
//  StyledString
//
//  Created by Sander de Vos on 18/01/16.
//  Copyright © 2016 Sander de Vos. All rights reserved.
//

import XCTest
import StyledString

private func AssertAttribute<T: Equatable>(configure: StyledString -> StyledString, _ key: String, _ value: T, file: StaticString = __FILE__, line: UInt = __LINE__) {
  AssertAttribute(configure, key, file: file, line: line) { (other: T) in
    XCTAssertEqual(value, other , "\(key) values should be equal", file: file, line: line)
  }
}

private func AssertAttribute<T>(configure: StyledString -> StyledString, _ key: String, file: StaticString = __FILE__, line: UInt = __LINE__, compare: T -> ()) {
  if let value = configure(StyledString("test")).NSAttributedString.attributesAtIndex(0, effectiveRange: nil)[key] as? T {
    compare(value)
  } else {
    XCTFail("\(key) values should be of the same type", file: file, line: line)
  }
}

class StyleTests: XCTestCase {

  func testFont() {
    let font = UIFont.boldSystemFontOfSize(30)
    AssertAttribute({ $0.withFont(font) }, NSFontAttributeName, font)
  }

  func testForegroundColor() {
    let foregroundColor = UIColor.redColor()
    AssertAttribute({ $0.withForegroundColor(foregroundColor) }, NSForegroundColorAttributeName, foregroundColor)
  }

  func testBackgroundColor() {
    let backgroundColor = UIColor.redColor()
    AssertAttribute({ $0.withBackgroundColor(backgroundColor) }, NSBackgroundColorAttributeName, backgroundColor)
  }

  func testLigatures() {
    let ligatures = true
    AssertAttribute({ $0.withLigatures(ligatures) }, NSLigatureAttributeName, ligatures)
  }

  func testKerning() {
    let kerning: Float = 10
    AssertAttribute({ $0.withKerning(kerning) }, NSKernAttributeName, kerning)
  }

  func testUnderlineStyle() {
    let underlineStyle = NSUnderlineStyle.StyleSingle
    AssertAttribute({ $0.withUnderline(underlineStyle) }, NSUnderlineStyleAttributeName, underlineStyle.rawValue)
  }

  func testUnderlineColor() {
    let underlineColor = UIColor.redColor()
    AssertAttribute({ $0.withUnderline(nil, color: underlineColor) }, NSUnderlineColorAttributeName, underlineColor)
  }

  func testStrikethroughStyle() {
    let strikethroughStyle = NSUnderlineStyle.StyleSingle
    AssertAttribute({ $0.withStrikethrough(strikethroughStyle) }, NSStrikethroughStyleAttributeName, strikethroughStyle.rawValue)
  }

  func testStrikethroughColor() {
    let strikethroughColor = UIColor.redColor()
    AssertAttribute({ $0.withStrikethrough(nil, color: strikethroughColor) }, NSStrikethroughColorAttributeName, strikethroughColor)
  }

  func testStrokeWidth() {
    let strokeWidth: Float = 10
    AssertAttribute({ $0.withStroke(strokeWidth) }, NSStrokeWidthAttributeName, strokeWidth)
  }

  func testStrokeColor() {
    let strokeColor = UIColor.redColor()
    AssertAttribute({ $0.withStroke(nil, color: strokeColor) }, NSStrokeColorAttributeName, strokeColor)
  }

  func testShadow() {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSizeMake(10, 10)
    shadow.shadowBlurRadius = 10
    shadow.shadowColor = UIColor.redColor()
    AssertAttribute({ $0.withShadow(shadow.shadowOffset, blurRadius: shadow.shadowBlurRadius, color: UIColor.redColor()) }, NSShadowAttributeName, shadow)
  }

  func testTextEffect() {
    let textEffect = TextEffect.LetterPress
    AssertAttribute({ $0.withTextEffect(textEffect) }, NSTextEffectAttributeName, NSTextEffectLetterpressStyle)
  }

  func testAttachment() {
    let attachment = NSTextAttachment(data: NSData(), ofType: "test")
    AssertAttribute({ $0.withAttachment(attachment) }, NSAttachmentAttributeName, attachment)
  }

  func testLinkUrl() {
    let link = NSURL(string: "http://www.apple.com")!
    AssertAttribute({ $0.withLink(link) }, NSLinkAttributeName, link)
  }

  func testLinkText() {
    let link = "http://www.apple.com"
    AssertAttribute({ $0.withLink(link) }, NSLinkAttributeName, link)
  }

  func testBaselineOffset() {
    let baselineOffset: Float = 10
    AssertAttribute({ $0.withBaselineOffset(baselineOffset) }, NSBaselineOffsetAttributeName, baselineOffset)
  }

  func testObliqueness() {
    let obliqueness: Float = 10
    AssertAttribute({ $0.withObliqueness(obliqueness) }, NSObliquenessAttributeName, obliqueness)
  }

  func testExpansion() {
    let expansion: Float = 10
    AssertAttribute({ $0.withExpansion(expansion) }, NSExpansionAttributeName, expansion)
  }

  func testWritingDirection() {
    let writingDirection = [10, 10]
    AssertAttribute({ $0.withWritingDirection(writingDirection) }, NSWritingDirectionAttributeName) {
      XCTAssertEqual($0, writingDirection, "\(NSWritingDirectionAttributeName) values should be equal")
    }
  }

  func testVerticalGlyphForm() {
    let verticalGlyphForm = true
    AssertAttribute({ $0.withVerticalGlyphForm(verticalGlyphForm) }, NSVerticalGlyphFormAttributeName, verticalGlyphForm)
  }

  func testAlignment() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.alignment = .Justified
    AssertAttribute({ $0.withAlignment(.Justified) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testFirstLineHeadIndent() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.firstLineHeadIndent = 10
    AssertAttribute({ $0.withFirstLineHeadIndent(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testHeadIndent() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.headIndent = 10
    AssertAttribute({ $0.withHeadIndent(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testTailIndent() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.tailIndent = 10
    AssertAttribute({ $0.withTailIndent(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testLineHeightMultiple() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.lineHeightMultiple = 10
    AssertAttribute({ $0.withLineHeightMultiple(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testMaximumLineHeight() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.maximumLineHeight = 10
    AssertAttribute({ $0.withMaximumLineHeight(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testMinimumLineHeight() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.minimumLineHeight = 10
    AssertAttribute({ $0.withMinimumLineHeight(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testLineSpacing() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.lineSpacing = 10
    AssertAttribute({ $0.withLineSpacing(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testParagraphSpacing() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.paragraphSpacing = 10
    AssertAttribute({ $0.withParagraphSpacing(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testParagraphSpacingBefore() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.paragraphSpacingBefore = 10
    AssertAttribute({ $0.withParagraphSpacingBefore(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testDefaultTabInterval() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.defaultTabInterval = 10
    AssertAttribute({ $0.withDefaultTabInterval(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testTabStops() {
    let tabStops = [NSTextTab(textAlignment: .Justified, location: 10, options: [:])]
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.tabStops = tabStops
    AssertAttribute({ $0.withTabStops(tabStops) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testLineBreakMode() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.lineBreakMode = .ByClipping
    AssertAttribute({ $0.withLineBreakMode(.ByClipping) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testHyphenationFactor() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.hyphenationFactor = 10
    AssertAttribute({ $0.withHyphenationFactor(10) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

  func testBaseWritingDirection() {
    let paragrapStyle = NSMutableParagraphStyle()
    paragrapStyle.baseWritingDirection = .RightToLeft
    AssertAttribute({ $0.withBaseWritingDirection(.RightToLeft) }, NSParagraphStyleAttributeName, paragrapStyle)
  }

}
