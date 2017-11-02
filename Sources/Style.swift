//
//  Style.swift
//  Pods
//
//  Created by Sander de Vos on 15/12/15.
//
//

import Foundation
import UIKit

infix operator ??=
private func ??= <T>(l: inout T?, val: @autoclosure () -> T?) {
  l = l ?? val()
}

extension Link {
  init?(value: Any?) {
    if let string = value as? String {
      self = .text(string)
    } else if let url = value as? URL {
      self = .url(url)
    }
    return nil
  }

  var value: Any {
    switch self {
    case .text(let value): return value
    case .url(let value): return value
    }
  }
}

extension TextEffect: RawRepresentable {
  public init?(rawValue: String) {
    switch rawValue {
    case NSAttributedString.TextEffectStyle.letterpressStyle.rawValue: self = .letterPress
    default: return nil
    }
  }
  public var rawValue: String {
    switch self {
    case .letterPress: return NSAttributedString.TextEffectStyle.letterpressStyle.rawValue
    }
  }
}

extension StyledString {
  struct Style {
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
    var link: Link?
    var baselineOffset: Float?
    var obliqueness: Float?
    var expansion: Float?
    var writingDirection: [Int]?
    var verticalGlyphForm: Bool?

    // Shadow
    var shadowOffset: CGSize?
    var shadowBlurRadius: CGFloat?
    var shadowColor: UIColor?

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

    init() {
    }

    init(attributes: [NSAttributedStringKey: Any]) {
      font = attributes[NSAttributedStringKey.font] as? UIFont
      foregroundColor = attributes[NSAttributedStringKey.foregroundColor] as? UIColor
      backgroundColor = attributes[NSAttributedStringKey.backgroundColor] as? UIColor
      ligature = attributes[NSAttributedStringKey.backgroundColor] as? Bool
      kern = attributes[NSAttributedStringKey.kern] as? Float
      if let rawValue = attributes[NSAttributedStringKey.strikethroughStyle] as? Int {
        strikethroughStyle = NSUnderlineStyle(rawValue: rawValue)
      }
      strikethroughColor = attributes[NSAttributedStringKey.strikethroughColor] as? UIColor
      if let rawValue = attributes[NSAttributedStringKey.underlineStyle] as? Int {
        underlineStyle = NSUnderlineStyle(rawValue: rawValue)
      }
      underlineColor = attributes[NSAttributedStringKey.underlineColor] as? UIColor
      strokeWidth = attributes[NSAttributedStringKey.strokeWidth] as? Float

      strokeColor = attributes[NSAttributedStringKey.strokeColor] as? UIColor

      if let rawValue = attributes[NSAttributedStringKey.textEffect] as? String {
        textEffect = TextEffect(rawValue: rawValue)
      }

      attachment = attributes[NSAttributedStringKey.attachment] as? NSTextAttachment

      link = Link(value: attributes[NSAttributedStringKey.link])

      baselineOffset = attributes[NSAttributedStringKey.baselineOffset] as? Float
      obliqueness = attributes[NSAttributedStringKey.obliqueness] as? Float
      expansion = attributes[NSAttributedStringKey.expansion] as? Float

      writingDirection = attributes[NSAttributedStringKey.writingDirection] as? [Int]
      verticalGlyphForm = attributes[NSAttributedStringKey.verticalGlyphForm] as? Bool

      // Shadow
      if let shadow = attributes[NSAttributedStringKey.shadow] as? NSShadow {
        shadowOffset = shadow.shadowOffset
        shadowBlurRadius = shadow.shadowBlurRadius
        shadowColor = shadow.shadowColor as? UIColor
      }

      // Paragraph Style
      if let paragraphStyle = attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle {
        alignment = paragraphStyle.alignment
        firstLineHeadIndent = paragraphStyle.firstLineHeadIndent
        headIndent = paragraphStyle.headIndent
        tailIndent = paragraphStyle.tailIndent
        lineHeightMultiple = paragraphStyle.lineHeightMultiple
        maximumLineHeight = paragraphStyle.maximumLineHeight
        minimumLineHeight = paragraphStyle.minimumLineHeight
        lineSpacing = paragraphStyle.lineSpacing
        paragraphSpacing = paragraphStyle.paragraphSpacing
        paragraphSpacingBefore = paragraphStyle.paragraphSpacingBefore
        tabStops = paragraphStyle.tabStops
        defaultTabInterval = paragraphStyle.defaultTabInterval
        lineBreakMode = paragraphStyle.lineBreakMode
        hyphenationFactor = paragraphStyle.hyphenationFactor
        baseWritingDirection = paragraphStyle.baseWritingDirection
      }
    }

    func merge(_ style: Style) -> Style {
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

    var attributes: [NSAttributedStringKey: Any] {
      var attributes: [NSAttributedStringKey: Any] = [:]
      if let font = font {
        attributes[NSAttributedStringKey.font] = font
      }
      if let foregroundColor = foregroundColor {
        attributes[NSAttributedStringKey.foregroundColor] = foregroundColor
      }
      if let backgroundColor = backgroundColor {
        attributes[NSAttributedStringKey.backgroundColor] = backgroundColor
      }
      if let ligature = ligature {
        attributes[NSAttributedStringKey.ligature] = ligature
      }
      if let kern = kern {
        attributes[NSAttributedStringKey.kern] = kern
      }
      if let strikethroughStyle = strikethroughStyle {
        attributes[NSAttributedStringKey.strikethroughStyle] = strikethroughStyle.rawValue
      }
      if let strikethroughColor = strikethroughColor {
        attributes[NSAttributedStringKey.strikethroughColor] = strikethroughColor
      }
      if let underlineStyle = underlineStyle {
        attributes[NSAttributedStringKey.underlineStyle] = underlineStyle.rawValue
      }
      if let underlineColor = underlineColor {
        attributes[NSAttributedStringKey.underlineColor] = underlineColor
      }
      if let strokeWidth = strokeWidth {
        attributes[NSAttributedStringKey.strokeWidth] = strokeWidth
      }
      if let strokeColor = strokeColor {
        attributes[NSAttributedStringKey.strokeColor] = strokeColor
      }
      if let textEffect = textEffect {
        attributes[NSAttributedStringKey.textEffect] = textEffect.rawValue
      }
      if let attachment = self.attachment {
        attributes[NSAttributedStringKey.attachment] = attachment
      }
      if let link = self.link {
        attributes[NSAttributedStringKey.link] = link.value
      }
      if let baselineOffset = self.baselineOffset {
        attributes[NSAttributedStringKey.baselineOffset] = baselineOffset
      }
      if let obliqueness = self.obliqueness {
        attributes[NSAttributedStringKey.obliqueness] = obliqueness
      }
      if let expansion = self.expansion {
        attributes[NSAttributedStringKey.expansion] = expansion
      }
      if let writingDirection = writingDirection {
        attributes[NSAttributedStringKey.writingDirection] = writingDirection
      }
      if let verticalGlyphForm = verticalGlyphForm {
        attributes[NSAttributedStringKey.verticalGlyphForm] = verticalGlyphForm
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
        attributes[NSAttributedStringKey.shadow] = shadow
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
          attributes[NSAttributedStringKey.paragraphStyle] = paragraphStyle
      }
      return attributes
    }
    
  }
}
