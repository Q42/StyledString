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
  init?(rawValue: Any) {
    if let string = rawValue as? String {
      self = .text(string)
    } else if let url = rawValue as? URL {
      self = .url(url)
    }
    return nil
  }

  var rawValue: Any {
    switch self {
    case .text(let value): return value
    case .url(let value): return value
    }
  }
}

extension TextEffect {
  init?(rawValue: String) {
    switch rawValue {
    case NSAttributedString.TextEffectStyle.letterpressStyle: self = .letterPress
    default: return nil
    }
  }
  var rawValue: String {
    switch self {
    case .letterPress: return NSAttributedString.TextEffectStyle.letterpressStyle.rawValue
    }
  }
}

extension StyledString {
  struct Style {
    var attributes: [String: Any] = [:]

    var font: UIFont? {
      get { return attributes[NSAttributedStringKey.font] as? UIFont }
      set { attributes[NSAttributedStringKey.font] = newValue }
    }
    var foregroundColor: UIColor? {
      get { return attributes[NSAttributedStringKey.foregroundColor] as? UIColor }
      set { attributes[NSAttributedStringKey.foregroundColor] = newValue }
    }
    var backgroundColor: UIColor? {
      get { return attributes[NSAttributedStringKey.backgroundColor] as? UIColor }
      set { attributes[NSAttributedStringKey.backgroundColor] = newValue }
    }
    var ligature: Bool? {
      get { return attributes[NSAttributedStringKey.ligature] as? Bool }
      set { attributes[NSAttributedStringKey.ligature] = newValue }
    }
    var kern: Float? {
      get { return attributes[NSAttributedStringKey.kern] as? Float }
      set { attributes[NSAttributedStringKey.kern] = newValue }
    }
    var strikethroughStyle: NSUnderlineStyle? {
      get { return (attributes[NSAttributedStringKey.strikethroughStyle] as? Int).flatMap(NSUnderlineStyle.init) }
      set { attributes[NSAttributedStringKey.strikethroughStyle] = newValue?.rawValue }
    }
    var strikethroughColor: UIColor? {
      get { return attributes[NSAttributedStringKey.strikethroughColor] as? UIColor }
      set { attributes[NSAttributedStringKey.strikethroughColor] = newValue }
    }
    var underlineStyle: NSUnderlineStyle? {
      get { return (attributes[NSAttributedStringKey.underlineStyle] as? Int).flatMap(NSUnderlineStyle.init) }
      set { attributes[NSAttributedStringKey.underlineStyle] = newValue?.rawValue }
    }
    var underlineColor: UIColor? {
      get { return attributes[NSAttributedStringKey.underlineColor] as? UIColor }
      set { attributes[NSAttributedStringKey.underlineColor] = newValue }
    }
    var strokeWidth: Float? {
      get { return attributes[NSAttributedStringKey.strokeWidth] as? Float }
      set { attributes[NSAttributedStringKey.strokeWidth] = newValue }
    }
    var strokeColor: UIColor? {
      get { return attributes[NSAttributedStringKey.strokeColor] as? UIColor }
      set { attributes[NSAttributedStringKey.strokeColor] = newValue }
    }
    var textEffect: TextEffect? {
      get { return (attributes[NSAttributedStringKey.textEffect] as? String).flatMap(TextEffect.init) }
      set { attributes[NSAttributedStringKey.textEffect] = newValue?.rawValue }
    }
    @available(iOS 7.0, *)
    var attachment: NSTextAttachment? {
      get { return attributes[NSAttributedStringKey.attachment] as? NSTextAttachment }
      set { attributes[NSAttributedStringKey.attachment] = newValue }
    }
    var link: Link? {
      get { return attributes[NSAttributedStringKey.link].flatMap(Link.init) }
      set { attributes[NSAttributedStringKey.link] = newValue?.rawValue }
    }
    var baselineOffset: Float? {
      get { return attributes[NSAttributedStringKey.baselineOffset] as? Float }
      set { attributes[NSAttributedStringKey.baselineOffset] = newValue }
    }
    var obliqueness: Float? {
      get { return attributes[NSAttributedStringKey.obliqueness] as? Float }
      set { attributes[NSAttributedStringKey.obliqueness] = newValue }
    }
    var expansion: Float? {
      get { return attributes[NSAttributedStringKey.expansion] as? Float }
      set { attributes[NSAttributedStringKey.expansion] = newValue }
    }
    var writingDirection: [Int]? {
      get { return attributes[NSAttributedStringKey.writingDirection] as? [Int] }
      set { attributes[NSAttributedStringKey.writingDirection] = newValue }
    }
    var verticalGlyphForm: Bool? {
      get { return attributes[NSAttributedStringKey.verticalGlyphForm] as? Bool }
      set { attributes[NSAttributedStringKey.verticalGlyphForm] = newValue }
    }

    // Shadow
    var shadowOffset: CGSize? {
      get { return (attributes[NSAttributedStringKey.shadow] as? NSShadow)?.shadowOffset }
      set {
        let shadow = attributes[NSAttributedStringKey.shadow] as? NSShadow ?? NSShadow()
        shadow.shadowOffset = newValue ?? NSShadow().shadowOffset
        attributes[NSAttributedStringKey.shadow] = shadow
      }
    }
    var shadowBlurRadius: CGFloat? {
      get { return (attributes[NSAttributedStringKey.shadow] as? NSShadow)?.shadowBlurRadius }
      set {
        let shadow = attributes[NSAttributedStringKey.shadow] as? NSShadow ?? NSShadow()
        shadow.shadowBlurRadius = newValue ?? NSShadow().shadowBlurRadius
        attributes[NSAttributedStringKey.shadow] = shadow
      }
    }
    var shadowColor: UIColor? {
      get { return (attributes[NSAttributedStringKey.shadow] as? NSShadow)?.shadowColor as? UIColor }
      set {
        let shadow = attributes[NSAttributedStringKey.shadow] as? NSShadow ?? NSShadow()
        shadow.shadowColor = newValue ?? NSShadow().shadowColor
        attributes[NSAttributedStringKey.shadow] = shadow
      }
    }

    // Paragraph Style
    var alignment: NSTextAlignment? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.alignment }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.alignment = newValue ?? NSParagraphStyle().alignment
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var firstLineHeadIndent: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.firstLineHeadIndent }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.firstLineHeadIndent = newValue ?? NSParagraphStyle().firstLineHeadIndent
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var headIndent: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.headIndent }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.headIndent = newValue ?? NSParagraphStyle().headIndent
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var tailIndent: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.tailIndent }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.tailIndent = newValue ?? NSParagraphStyle().tailIndent
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var lineHeightMultiple: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.lineHeightMultiple }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineHeightMultiple = newValue ?? NSParagraphStyle().lineHeightMultiple
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var maximumLineHeight: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.maximumLineHeight }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.maximumLineHeight = newValue ?? NSParagraphStyle().maximumLineHeight
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var minimumLineHeight: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.minimumLineHeight }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.minimumLineHeight = newValue ?? NSParagraphStyle().minimumLineHeight
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var lineSpacing: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.lineSpacing }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineSpacing = newValue ?? NSParagraphStyle().lineSpacing
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var paragraphSpacing: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.paragraphSpacing }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.paragraphSpacing = newValue ?? NSParagraphStyle().paragraphSpacing
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var paragraphSpacingBefore: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.paragraphSpacingBefore }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.paragraphSpacingBefore = newValue ?? NSParagraphStyle().paragraphSpacingBefore
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var tabStops: [NSTextTab]? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.tabStops }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.tabStops = newValue ?? NSParagraphStyle().tabStops
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var defaultTabInterval: CGFloat? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.defaultTabInterval }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.defaultTabInterval = newValue ?? NSParagraphStyle().defaultTabInterval
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var lineBreakMode: NSLineBreakMode? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.lineBreakMode }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineBreakMode = newValue ?? NSParagraphStyle().lineBreakMode
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var hyphenationFactor: Float? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.hyphenationFactor }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.hyphenationFactor = newValue ?? NSParagraphStyle().hyphenationFactor
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }
    var baseWritingDirection: NSWritingDirection? {
      get { return (attributes[NSAttributedStringKey.paragraphStyle] as? NSParagraphStyle)?.baseWritingDirection }
      set {
        let style = attributes[NSAttributedStringKey.paragraphStyle] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.baseWritingDirection = newValue ?? NSParagraphStyle().baseWritingDirection
        attributes[NSAttributedStringKey.paragraphStyle] = style
      }
    }

    init() {
    }

    init(attributes: [String: Any]) {
      self.attributes = attributes
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
  }
}
