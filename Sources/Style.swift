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
    case NSTextEffectLetterpressStyle: self = .letterPress
    default: return nil
    }
  }
  var rawValue: String {
    switch self {
    case .letterPress: return NSTextEffectLetterpressStyle
    }
  }
}

extension StyledString {
  struct Style {
    var attributes: [String: Any] = [:]

    var font: UIFont? {
      get { return attributes[NSFontAttributeName] as? UIFont }
      set { attributes[NSFontAttributeName] = newValue }
    }
    var foregroundColor: UIColor? {
      get { return attributes[NSForegroundColorAttributeName] as? UIColor }
      set { attributes[NSForegroundColorAttributeName] = newValue }
    }
    var backgroundColor: UIColor? {
      get { return attributes[NSBackgroundColorAttributeName] as? UIColor }
      set { attributes[NSBackgroundColorAttributeName] = newValue }
    }
    var ligature: Bool? {
      get { return attributes[NSLigatureAttributeName] as? Bool }
      set { attributes[NSLigatureAttributeName] = newValue }
    }
    var kern: Float? {
      get { return attributes[NSKernAttributeName] as? Float }
      set { attributes[NSKernAttributeName] = newValue }
    }
    var strikethroughStyle: NSUnderlineStyle? {
      get { return (attributes[NSStrikethroughStyleAttributeName] as? Int).flatMap(NSUnderlineStyle.init) }
      set { attributes[NSStrikethroughStyleAttributeName] = newValue?.rawValue }
    }
    var strikethroughColor: UIColor? {
      get { return attributes[NSStrikethroughColorAttributeName] as? UIColor }
      set { attributes[NSStrikethroughColorAttributeName] = newValue }
    }
    var underlineStyle: NSUnderlineStyle? {
      get { return (attributes[NSUnderlineStyleAttributeName] as? Int).flatMap(NSUnderlineStyle.init) }
      set { attributes[NSUnderlineStyleAttributeName] = newValue?.rawValue }
    }
    var underlineColor: UIColor? {
      get { return attributes[NSUnderlineColorAttributeName] as? UIColor }
      set { attributes[NSUnderlineColorAttributeName] = newValue }
    }
    var strokeWidth: Float? {
      get { return attributes[NSStrokeWidthAttributeName] as? Float }
      set { attributes[NSStrokeWidthAttributeName] = newValue }
    }
    var strokeColor: UIColor? {
      get { return attributes[NSStrokeColorAttributeName] as? UIColor }
      set { attributes[NSStrokeColorAttributeName] = newValue }
    }
    var textEffect: TextEffect? {
      get { return (attributes[NSTextEffectAttributeName] as? String).flatMap(TextEffect.init) }
      set { attributes[NSTextEffectAttributeName] = newValue?.rawValue }
    }
    @available(iOS 7.0, *)
    var attachment: NSTextAttachment? {
      get { return attributes[NSAttachmentAttributeName] as? NSTextAttachment }
      set { attributes[NSAttachmentAttributeName] = newValue }
    }
    var link: Link? {
      get { return attributes[NSLinkAttributeName].flatMap(Link.init) }
      set { attributes[NSLinkAttributeName] = newValue?.rawValue }
    }
    var baselineOffset: Float? {
      get { return attributes[NSBaselineOffsetAttributeName] as? Float }
      set { attributes[NSBaselineOffsetAttributeName] = newValue }
    }
    var obliqueness: Float? {
      get { return attributes[NSObliquenessAttributeName] as? Float }
      set { attributes[NSObliquenessAttributeName] = newValue }
    }
    var expansion: Float? {
      get { return attributes[NSExpansionAttributeName] as? Float }
      set { attributes[NSExpansionAttributeName] = newValue }
    }
    var writingDirection: [Int]? {
      get { return attributes[NSWritingDirectionAttributeName] as? [Int] }
      set { attributes[NSWritingDirectionAttributeName] = newValue }
    }
    var verticalGlyphForm: Bool? {
      get { return attributes[NSVerticalGlyphFormAttributeName] as? Bool }
      set { attributes[NSVerticalGlyphFormAttributeName] = newValue }
    }

    // Shadow
    var shadowOffset: CGSize? {
      get { return (attributes[NSShadowAttributeName] as? NSShadow)?.shadowOffset }
      set {
        let shadow = attributes[NSShadowAttributeName] as? NSShadow ?? NSShadow()
        shadow.shadowOffset = newValue ?? NSShadow().shadowOffset
        attributes[NSShadowAttributeName] = shadow
      }
    }
    var shadowBlurRadius: CGFloat? {
      get { return (attributes[NSShadowAttributeName] as? NSShadow)?.shadowBlurRadius }
      set {
        let shadow = attributes[NSShadowAttributeName] as? NSShadow ?? NSShadow()
        shadow.shadowBlurRadius = newValue ?? NSShadow().shadowBlurRadius
        attributes[NSShadowAttributeName] = shadow
      }
    }
    var shadowColor: UIColor? {
      get { return (attributes[NSShadowAttributeName] as? NSShadow)?.shadowColor as? UIColor }
      set {
        let shadow = attributes[NSShadowAttributeName] as? NSShadow ?? NSShadow()
        shadow.shadowColor = newValue ?? NSShadow().shadowColor
        attributes[NSShadowAttributeName] = shadow
      }
    }

    // Paragraph Style
    var alignment: NSTextAlignment? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.alignment }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.alignment = newValue ?? NSParagraphStyle().alignment
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var firstLineHeadIndent: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.firstLineHeadIndent }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.firstLineHeadIndent = newValue ?? NSParagraphStyle().firstLineHeadIndent
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var headIndent: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.headIndent }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.headIndent = newValue ?? NSParagraphStyle().headIndent
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var tailIndent: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.tailIndent }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.tailIndent = newValue ?? NSParagraphStyle().tailIndent
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var lineHeightMultiple: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.lineHeightMultiple }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineHeightMultiple = newValue ?? NSParagraphStyle().lineHeightMultiple
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var maximumLineHeight: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.maximumLineHeight }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.maximumLineHeight = newValue ?? NSParagraphStyle().maximumLineHeight
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var minimumLineHeight: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.minimumLineHeight }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.minimumLineHeight = newValue ?? NSParagraphStyle().minimumLineHeight
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var lineSpacing: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.lineSpacing }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineSpacing = newValue ?? NSParagraphStyle().lineSpacing
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var paragraphSpacing: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.paragraphSpacing }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.paragraphSpacing = newValue ?? NSParagraphStyle().paragraphSpacing
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var paragraphSpacingBefore: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.paragraphSpacingBefore }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.paragraphSpacingBefore = newValue ?? NSParagraphStyle().paragraphSpacingBefore
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var tabStops: [NSTextTab]? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.tabStops }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.tabStops = newValue ?? NSParagraphStyle().tabStops
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var defaultTabInterval: CGFloat? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.defaultTabInterval }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.defaultTabInterval = newValue ?? NSParagraphStyle().defaultTabInterval
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var lineBreakMode: NSLineBreakMode? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.lineBreakMode }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.lineBreakMode = newValue ?? NSParagraphStyle().lineBreakMode
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var hyphenationFactor: Float? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.hyphenationFactor }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.hyphenationFactor = newValue ?? NSParagraphStyle().hyphenationFactor
        attributes[NSParagraphStyleAttributeName] = style
      }
    }
    var baseWritingDirection: NSWritingDirection? {
      get { return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.baseWritingDirection }
      set {
        let style = attributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle ?? NSMutableParagraphStyle()
        style.baseWritingDirection = newValue ?? NSParagraphStyle().baseWritingDirection
        attributes[NSParagraphStyleAttributeName] = style
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
