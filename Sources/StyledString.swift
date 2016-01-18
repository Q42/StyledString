//
//  StyledString.swift
//  StylesString
//
//  Created by Sander de Vos on 30/11/15.
//  Copyright © 2015 Sander de Vos. All rights reserved.
//

import Foundation
import UIKit

public struct StyledString {
  private let node: StyleNode
  private var style: Style = Style()

  public init() {
    self.node = .Unary("")
  }

  public init(_ string: String) {
    self.node = .Unary(string)
  }

  init(node: StyleNode) {
    self.node = node
  }

  init(_ string: String, style: Style) {
    self.node = .Unary(string)
    self.style = style
  }
}

// MARK: StringLiteralConvertible

extension StyledString: StringLiteralConvertible {
  public typealias StringLiteralType = String

  public init(stringLiteral value: String) {
    self.init(value)
  }

  public init(extendedGraphemeClusterLiteral value: String) {
    self.init(value)
  }

  public init(unicodeScalarLiteral value: String) {
    self.init(value)
  }
}

// MARK: Support Types

indirect enum StyleNode {
  case Unary(String)
  case Binary(StyledString, StyledString)
}

public enum TextEffect {
  case LetterPress
}

public enum Link {
  case Url(NSURL)
  case Text(String)
}

// MARK: NSAttributedString support

public extension StyledString {

  public init(NSAttributedString: Foundation.NSAttributedString) {
    let string = NSAttributedString.string

    var segments: [StyledString] = []

    NSAttributedString.enumerateAttributesInRange(NSMakeRange(0, NSAttributedString.length), options: []){ attributes, range, _ in
      segments.append(StyledString(string.substringWithRange(range), style: Style(attributes: attributes)))
    }
    self.node = segments.joinWithSeparator("").node
  }

  public var NSAttributedString: Foundation.NSAttributedString {
    return NSAttributedString(style)
  }

  private func NSAttributedString(parentStyle: Style) -> Foundation.NSAttributedString {
    switch node {
    case let .Unary(string):
      return Foundation.NSAttributedString(string: string, style: parentStyle)
    case let .Binary(lhs, rhs):
      return lhs.NSAttributedString(parentStyle.merge(lhs.style)) + rhs.NSAttributedString(parentStyle.merge(rhs.style))
    }
  }
}

// MARK: Equabtale

public func == (lhs: StyledString, rhs: StyledString) -> Bool {
  return lhs.NSAttributedString.isEqualToAttributedString(rhs.NSAttributedString)
}

extension StyledString: Equatable {
}

// MARK: Style vars

public extension StyledString {

  var font: UIFont? {
    get { return style.font }
    set { style.font = newValue }
  }

  var foregroundColor: UIColor? {
    get { return style.foregroundColor }
    set { style.foregroundColor = newValue }
  }

  var backgroundColor: UIColor? {
    get { return style.backgroundColor }
    set { style.backgroundColor = newValue }
  }

  var ligatures: Bool? {
    get { return style.ligature }
    set { style.ligature = newValue }
  }

  var kerning: Float? {
    get { return style.kern }
    set { style.kern = newValue }
  }

  var underlineStyle: NSUnderlineStyle? {
    get { return style.underlineStyle }
    set { style.underlineStyle = newValue }
  }

  var underlineColor: UIColor? {
    get { return style.underlineColor }
    set { style.underlineColor = newValue }
  }

  var strikethroughStyle: NSUnderlineStyle? {
    get { return style.strikethroughStyle }
    set { style.strikethroughStyle = newValue }
  }

  var strikethroughColor: UIColor? {
    get { return style.strikethroughColor }
    set { style.strikethroughColor = newValue }
  }

  var strokeWidth: Float?  {
    get { return style.strokeWidth }
    set { style.strokeWidth = newValue }
  }

  var strokeColor: UIColor?  {
    get { return style.strokeColor }
    set { style.strokeColor = newValue }
  }

  var shadowOffset: CGSize?  {
    get { return style.shadowOffset }
    set { style.shadowOffset = newValue }
  }

  var shadowBlurRadius: CGFloat?  {
    get { return style.shadowBlurRadius }
    set { style.shadowBlurRadius = newValue }
  }

  var shadowColor: UIColor?  {
    get { return style.shadowColor }
    set { style.shadowColor = newValue }
  }

  var textEffect: TextEffect? {
    get { return style.textEffect }
    set { style.textEffect = newValue }
  }

  var attachment: NSTextAttachment? {
    get { return style.attachment }
    set { style.attachment = newValue }
  }

  var link: Link? {
    get { return style.link }
    set { style.link = newValue }
  }

  var baselineOffset: Float? {
    get { return style.baselineOffset }
    set { style.baselineOffset = newValue }
  }

  var obliqueness: Float? {
    get { return style.obliqueness }
    set { style.obliqueness = newValue }
  }

  var expansion: Float? {
    get { return style.expansion }
    set { style.expansion = newValue }
  }

  var writingDirection: [Int]? {
    get { return style.writingDirection }
    set { style.writingDirection = newValue }
  }

  var verticalGlyphForm: Bool? {
    get { return style.verticalGlyphForm }
    set { style.verticalGlyphForm = newValue }
  }

  var alignment: NSTextAlignment? {
    get { return style.alignment }
    set { style.alignment = newValue }
  }

  var firstLineHeadIndent: CGFloat? {
    get { return style.firstLineHeadIndent }
    set { style.firstLineHeadIndent = newValue }
  }

  var headIndent: CGFloat? {
    get { return style.headIndent }
    set { style.headIndent = newValue }
  }

  var tailIndent: CGFloat? {
    get { return style.tailIndent }
    set { style.tailIndent = newValue }
  }

  var lineHeightMultiple: CGFloat? {
    get { return style.lineHeightMultiple }
    set { style.lineHeightMultiple = newValue }
  }

  var maximumLineHeight: CGFloat? {
    get { return style.maximumLineHeight }
    set { style.maximumLineHeight = newValue }
  }

  var minimumLineHeight: CGFloat? {
    get { return style.minimumLineHeight }
    set { style.minimumLineHeight = newValue }
  }

  var lineSpacing: CGFloat? {
    get { return style.lineSpacing }
    set { style.lineSpacing = newValue }
  }

  var paragraphSpacing: CGFloat? {
    get { return style.paragraphSpacing }
    set { style.paragraphSpacing = newValue }
  }

  var paragraphSpacingBefore: CGFloat? {
    get { return style.paragraphSpacingBefore }
    set { style.paragraphSpacingBefore = newValue }
  }

  var defaultTabInterval: CGFloat? {
    get { return style.defaultTabInterval }
    set { style.defaultTabInterval = newValue }
  }

  var tabStops: [NSTextTab]? {
    get { return style.tabStops }
    set { style.tabStops = newValue }
  }

  var lineBreakMode: NSLineBreakMode? {
    get { return style.lineBreakMode }
    set { style.lineBreakMode = newValue }
  }

  var hyphenationFactor: Float? {
    get { return style.hyphenationFactor }
    set { style.hyphenationFactor = newValue }
  }

  var baseWritingDirection: NSWritingDirection? {
    get { return style.baseWritingDirection }
    set { style.baseWritingDirection = newValue }
  }

}

// MARK: Style methods

public extension StyledString {
  public func withFont(font: UIFont?) -> StyledString {
    var new = self
    new.style.font = font
    return new
  }

  public func withForegroundColor(foregroundColor: UIColor?) -> StyledString {
    var new = self
    new.style.foregroundColor = foregroundColor
    return new
  }

  public func withBackgroundColor(backgroundColor: UIColor?) -> StyledString {
    var new = self
    new.style.backgroundColor = backgroundColor
    return new
  }

  public func withLigatures(ligatures: Bool? = true) -> StyledString {
    var new = self
    new.style.ligature = ligatures
    return new
  }

  public func withKerning(kern: Float?) -> StyledString {
    var new = self
    new.style.kern = kern
    return new
  }

  public func withUnderline(style: NSUnderlineStyle? = .StyleSingle, color: UIColor? = nil) -> StyledString {
    var new = self
    new.style.underlineStyle = style
    new.style.underlineColor = color
    return new
  }

  public func withStrikethrough(style: NSUnderlineStyle? = .StyleSingle, color: UIColor? = nil) -> StyledString {
    var new = self
    new.style.strikethroughStyle = style
    new.style.strikethroughColor = color
    return new
  }

  public func withStroke(width: Float? = 1, color: UIColor? = nil) -> StyledString {
    var new = self
    new.style.strokeWidth = width
    new.style.strokeColor = color
    return new
  }

  public func withShadow(offset: CGSize? = CGSizeMake(1, 1), blurRadius: CGFloat? = 1, color: UIColor? = nil) -> StyledString {
    var new = self
    new.style.shadowOffset = offset
    new.style.shadowBlurRadius = blurRadius
    new.style.shadowColor = color
    return new
  }

  public func withTextEffect(effect: TextEffect? = .LetterPress) -> StyledString {
    var new = self
    new.style.textEffect = effect
    return new
  }

  public func withAttachment(attachment: NSTextAttachment?) -> StyledString {
    var new = self
    new.style.attachment = attachment
    return new
  }

  public func withLink(link: NSURL?) -> StyledString {
    var new = self
    if let link = link {
      new.style.link = .Url(link)
    } else {
      new.style.link = nil
    }
    return new
  }

  public func withLink(link: String?) -> StyledString {
    var new = self
    if let link = link {
      new.style.link = .Text(link)
    } else {
      new.style.link = nil
    }
    return new
  }

  public func withBaselineOffset(offset: Float?) -> StyledString {
    var new = self
    new.style.baselineOffset = offset
    return new
  }

  public func withObliqueness(obliqueness: Float?) -> StyledString {
    var new = self
    new.style.obliqueness = obliqueness
    return new
  }

  public func withExpansion(expansion: Float?) -> StyledString {
    var new = self
    new.style.expansion = expansion
    return new
  }

  public func withWritingDirection(writingDirection: [Int]?) -> StyledString {
    var new = self
    new.style.writingDirection = writingDirection
    return new
  }

  public func withVerticalGlyphForm(verticalGlyphForm: Bool? = true) -> StyledString {
    var new = self
    new.style.verticalGlyphForm = verticalGlyphForm
    return new
  }

  public func withAlignment(alignment: NSTextAlignment?) -> StyledString {
    var new = self
    new.style.alignment = alignment
    return new
  }

  public func withFirstLineHeadIndent(firstLineHeadIndent: CGFloat?) -> StyledString {
    var new = self
    new.style.firstLineHeadIndent = firstLineHeadIndent
    return new
  }

  public func withHeadIndent(headIndent: CGFloat?) -> StyledString {
    var new = self
    new.style.headIndent = headIndent
    return new
  }

  public func withTailIndent(tailIndent: CGFloat?) -> StyledString {
    var new = self
    new.style.tailIndent = tailIndent
    return new
  }

  public func withLineHeightMultiple(lineHeightMultiple: CGFloat?) -> StyledString {
    var new = self
    new.style.lineHeightMultiple = lineHeightMultiple
    return new
  }

  public func withMaximumLineHeight(maximumLineHeight: CGFloat?) -> StyledString {
    var new = self
    new.style.maximumLineHeight = maximumLineHeight
    return new
  }

  public func withMinimumLineHeight(minimumLineHeight: CGFloat?) -> StyledString {
    var new = self
    new.style.minimumLineHeight = minimumLineHeight
    return new
  }

  public func withLineSpacing(lineSpacing: CGFloat?) -> StyledString {
    var new = self
    new.style.lineSpacing = lineSpacing
    return new
  }

  public func withParagraphSpacing(paragraphSpacing: CGFloat?) -> StyledString {
    var new = self
    new.style.paragraphSpacing = paragraphSpacing
    return new
  }

  public func withParagraphSpacingBefore(paragraphSpacingBefore: CGFloat?) -> StyledString {
    var new = self
    new.style.paragraphSpacingBefore = paragraphSpacingBefore
    return new
  }

  public func withDefaultTabInterval(defaultTabInterval: CGFloat?) -> StyledString {
    var new = self
    new.style.defaultTabInterval = defaultTabInterval
    return new
  }

  public func withTabStops(tabStops: [NSTextTab]?) -> StyledString {
    var new = self
    new.style.tabStops = tabStops
    return new
  }

  public func withLineBreakMode(lineBreakMode: NSLineBreakMode?) -> StyledString {
    var new = self
    new.style.lineBreakMode = lineBreakMode
    return new
  }

  public func withHyphenationFactor(hyphenationFactor: Float?) -> StyledString {
    var new = self
    new.style.hyphenationFactor = hyphenationFactor
    return new
  }

  public func withBaseWritingDirection(writingDirection: NSWritingDirection?) -> StyledString {
    var new = self
    new.style.baseWritingDirection = writingDirection
    return new
  }

}

// MARK: StyledString Operators

public func + (lhs: StyledString, rhs: StyledString) -> StyledString {
  return StyledString(node: .Binary(lhs, rhs))
}

// MARK: SequenceType Additions

extension SequenceType where Generator.Element == StyledString {

  /// Interpose the `separator` between elements of `self`, then concatenate
  /// the result.  For example:
  ///
  ///     ["foo", "bar", "baz"].joinWithSeparator("-|-") // "foo-|-bar-|-baz"
  @warn_unused_result
  public func joinWithSeparator(separator: String) -> StyledString {
    return self.joinWithSeparator(StyledString(separator))
  }

  /// Interpose the `separator` between elements of `self`, then concatenate
  /// the result.  For example:
  ///
  ///     ["foo", "bar", "baz"].joinWithSeparator("-|-") // "foo-|-bar-|-baz"
  @warn_unused_result
  public func joinWithSeparator(separator: StyledString) -> StyledString {
    var result = StyledString("")

    var first = true
    for item in self {
      if !first {
        result = result + separator
      }

      first = false

      result = result + item
    }

    return result
  }
}
