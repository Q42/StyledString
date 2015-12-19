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

  private init(node: StyleNode) {
    self.node = node
  }

  public init(string: String) {
    self.node = .Unary(string)
  }

  public init() {
    self.node = .Unary("")
  }
}

extension StyledString: StringLiteralConvertible {
  public typealias StringLiteralType = String

  public init(stringLiteral value: String) {
    self.init(string: value)
  }

  public init(extendedGraphemeClusterLiteral value: String) {
    self.init(string: value)
  }

  public init(unicodeScalarLiteral value: String) {
    self.init(string: value)
  }
}

public indirect enum StyleNode {
  case Unary(String)
  case Binary(StyledString, StyledString)
}

public enum TextLink {
  case Url(NSURL)
  case UrlString(String)
}

public enum TextEffect {
  case LetterPress

  private var value: String {
    switch self {
    case LetterPress: return NSTextEffectLetterpressStyle
    }
  }
}

infix operator ??= { }
private func ??=<T>(inout l: T?, @autoclosure val: () -> T?) {
  l = l ?? val()
}

private struct Style {
  var font: UIFont?
  var foregroundColor: UIColor?
  var backgroundColor: UIColor?
  var ligature: Bool?
  var kern: Float?
  var strikethroughStyle: NSUnderlineStyle?
  var strikethroughColor: UIColor?
  var underlineStyle: NSUnderlineStyle?
  var underlineColor: UIColor?
  var strokeWidth: Float?
  var strokeColor: UIColor?
  var textEffect: TextEffect?
  var attachment: NSTextAttachment?
  var link: TextLink?
  var baselineOffset: Float?
  var obliqueness: Float?
  var expansion: Float?
  var writingDirection: [Int]?
  var verticalGlyphForm: Bool?

  // Shadow
  var shadowOffset: CGSize?
  var shadowBlurRadius: CGFloat?
  var shadowColor: AnyObject?

  // Paragraph Style
  var alignment: NSTextAlignment?
  var firstLineHeadIndent: CGFloat?
  var headIndent: CGFloat?
  var tailIndent: CGFloat?
  var lineHeightMultiple: CGFloat?
  var maximumLineHeight: CGFloat?
  var minimumLineHeight: CGFloat?
  var lineSpacing: CGFloat?
  var paragraphSpacing: CGFloat?
  var paragraphSpacingBefore: CGFloat?
  var tabStops: [NSTextTab]?
  var defaultTabInterval: CGFloat?
  var lineBreakMode: NSLineBreakMode?
  var hyphenationFactor: Float?
  var baseWritingDirection: NSWritingDirection?

  func merge(style: Style) -> Style {
    var result = self
    result.font ??= style.font
    result.foregroundColor ??= style.foregroundColor
    result.backgroundColor ??= style.backgroundColor
    result.ligature ??= style.ligature
    result.kern ??= style.kern
    result.strikethroughStyle ??= style.strikethroughStyle
    result.strikethroughColor ??= style.strikethroughColor
    result.underlineStyle ??= style.underlineStyle
    result.underlineColor ??= style.underlineColor
    result.strokeWidth ??= style.strokeWidth
    result.strokeColor ??= style.strokeColor
    result.textEffect ??= style.textEffect
    result.attachment ??= style.attachment
    result.link ??= style.link
    result.baselineOffset ??= style.baselineOffset
    result.obliqueness ??= style.obliqueness
    result.expansion ??= style.expansion

    // Shadow
    result.shadowOffset ??= style.shadowOffset
    result.shadowBlurRadius ??= style.shadowBlurRadius
    result.shadowColor ??= style.shadowColor

    // Paragraph Style
    result.alignment ??= style.alignment
    result.firstLineHeadIndent ??= style.firstLineHeadIndent
    result.headIndent ??= style.headIndent
    result.tailIndent  ??= style.tailIndent
    result.lineHeightMultiple ??= style.lineHeightMultiple
    result.maximumLineHeight ??= style.maximumLineHeight
    result.minimumLineHeight ??= style.minimumLineHeight
    result.lineSpacing ??= style.lineSpacing
    result.paragraphSpacing ??= style.paragraphSpacing
    result.paragraphSpacingBefore ??= style.paragraphSpacingBefore
    result.tabStops ??= style.tabStops
    result.defaultTabInterval ??= style.defaultTabInterval
    result.lineBreakMode ??= style.lineBreakMode
    result.hyphenationFactor ??= style.hyphenationFactor
    result.baseWritingDirection ??= style.baseWritingDirection

    return result
  }

  private var attributes: [String: AnyObject] {
    var attributes: [String: AnyObject] = [:]
    if let font = font {
      attributes[NSFontAttributeName] = font
    }
    if let foregroundColor = foregroundColor {
      attributes[NSForegroundColorAttributeName] = foregroundColor
    }
    if let backgroundColor = backgroundColor {
      attributes[NSBackgroundColorAttributeName] = backgroundColor
    }
    if let ligature = ligature {
      attributes[NSLigatureAttributeName] = ligature
    }
    if let kern = kern {
      attributes[NSKernAttributeName] = kern
    }
    if let strikethroughStyle = strikethroughStyle {
      attributes[NSStrikethroughStyleAttributeName] = strikethroughStyle.rawValue
    }
    if let strikethroughColor = strikethroughColor {
      attributes[NSStrikethroughColorAttributeName] = strikethroughColor
    }
    if let underlineStyle = underlineStyle {
      attributes[NSUnderlineStyleAttributeName] = underlineStyle.rawValue
    }
    if let underlineColor = underlineColor {
      attributes[NSUnderlineColorAttributeName] = underlineColor
    }
    if let strokeWidth = strokeWidth {
      attributes[NSStrokeWidthAttributeName] = strokeWidth
    }
    if let strokeColor = strokeColor {
      attributes[NSStrokeColorAttributeName] = strokeColor
    }
    if let textEffect = textEffect {
      attributes[NSTextEffectAttributeName] = textEffect.value
    }
    if let attachment = self.attachment {
      attributes[NSAttachmentAttributeName] = attachment
    }
    if let link = self.link {
      switch link {
      case .Url(let url):
        attributes[NSLinkAttributeName] = url
      case .UrlString(let url):
        attributes[NSLinkAttributeName] = url
      }
    }
    if let baselineOffset = self.baselineOffset {
      attributes[NSBaselineOffsetAttributeName] = baselineOffset
    }
    if let obliqueness = self.obliqueness {
      attributes[NSObliquenessAttributeName] = obliqueness
    }
    if let expansion = self.expansion {
      attributes[NSExpansionAttributeName] = expansion
    }
    if let writingDirection = writingDirection {
      attributes[NSWritingDirectionAttributeName] = writingDirection
    }
    if let verticalGlyphForm = verticalGlyphForm {
      attributes[NSVerticalGlyphFormAttributeName] = verticalGlyphForm
    }

    // Shadow
    if shadowOffset != nil || shadowBlurRadius != nil || shadowColor != nil {
      let shadow = NSShadow()
      if let offset = self.shadowOffset {
        shadow.shadowOffset = offset
      }
      if let blurRadius = self.shadowBlurRadius {
        shadow.shadowBlurRadius = blurRadius
      }
      if let color = self.shadowColor {
        shadow.shadowColor = color
      }
      attributes[NSShadowAttributeName] = shadow
    }

    // Paragraph Style
    if alignment != nil || firstLineHeadIndent != nil || headIndent != nil || tailIndent != nil ||
      lineHeightMultiple != nil || maximumLineHeight != nil || minimumLineHeight != nil || lineSpacing != nil ||
      paragraphSpacing != nil || paragraphSpacingBefore != nil || tabStops != nil || defaultTabInterval != nil ||
      lineBreakMode != nil || hyphenationFactor != nil || baseWritingDirection != nil {

        let paragraphStyle = NSMutableParagraphStyle()

        if let alignment = alignment {
          paragraphStyle.alignment = alignment
        }
        if let firstLineHeadIndent = firstLineHeadIndent {
          paragraphStyle.firstLineHeadIndent = firstLineHeadIndent
        }
        if let headIndent = headIndent {
          paragraphStyle.headIndent = headIndent
        }
        if let tailIndent = tailIndent {
          paragraphStyle.tailIndent = tailIndent
        }
        if let lineHeightMultiple = lineHeightMultiple {
          paragraphStyle.lineHeightMultiple = lineHeightMultiple
        }
        if let maximumLineHeight = maximumLineHeight {
          paragraphStyle.maximumLineHeight = maximumLineHeight
        }
        if let minimumLineHeight = minimumLineHeight {
          paragraphStyle.minimumLineHeight = minimumLineHeight
        }
        if let lineSpacing = lineSpacing {
          paragraphStyle.lineSpacing = lineSpacing
        }
        if let paragraphSpacing = paragraphSpacing {
          paragraphStyle.paragraphSpacing = paragraphSpacing
        }
        if let paragraphSpacingBefore = paragraphSpacingBefore {
          paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
        }
        if let tabStops = tabStops {
          paragraphStyle.tabStops = tabStops
        }
        if let defaultTabInterval = defaultTabInterval {
          paragraphStyle.defaultTabInterval = defaultTabInterval
        }
        if let lineBreakMode = lineBreakMode {
          paragraphStyle.lineBreakMode = lineBreakMode
        }
        if let hyphenationFactor = hyphenationFactor {
          paragraphStyle.hyphenationFactor = hyphenationFactor
        }
        if let baseWritingDirection = baseWritingDirection {
          paragraphStyle.baseWritingDirection = baseWritingDirection
        }
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
    }
    return attributes
  }

}

public extension StyledString {
  public func NSAttributedString() -> Foundation.NSAttributedString {
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

// MARK: Attribute mutating methods

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
      new.style.link = .UrlString(link)
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

public func + (lhs: StyledString, rhs: StyledString) -> StyledString {
  return StyledString(node: .Binary(lhs, rhs))
}

// MARK: NSAttributedString Additions

private extension NSAttributedString {
  private convenience init(string: String, style: Style) {
    self.init(string: string, attributes: style.attributes)
  }
}

private func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
  let result = NSMutableAttributedString()
  result.appendAttributedString(lhs)
  result.appendAttributedString(rhs)
  return result
}

// MARK: SequenceType Additions

extension SequenceType where Generator.Element == StyledString {

  /// Interpose the `separator` between elements of `self`, then concatenate
  /// the result.  For example:
  ///
  ///     ["foo", "bar", "baz"].joinWithSeparator("-|-") // "foo-|-bar-|-baz"
  @warn_unused_result
  public func joinWithSeparator(separator: String) -> StyledString {
    return self.joinWithSeparator(StyledString(string: separator))
  }

  /// Interpose the `separator` between elements of `self`, then concatenate
  /// the result.  For example:
  ///
  ///     ["foo", "bar", "baz"].joinWithSeparator("-|-") // "foo-|-bar-|-baz"
  @warn_unused_result
  public func joinWithSeparator(separator: StyledString) -> StyledString {
    var result = StyledString(string: "")

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
