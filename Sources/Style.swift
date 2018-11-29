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
  public struct Style {
    private var attributes: [NSAttributedString.Key: Any] = [:]
    private var shadow: [NSShadow.Key: Any] = [:]
    private var paragraphStyle: [NSParagraphStyle.Key: Any] = [:]

    public var font: UIFont? {
      get { return attributes[.font] as? UIFont }
      set { attributes[.font] = newValue }
    }
    public var foregroundColor: UIColor? {
      get { return attributes[.foregroundColor] as? UIColor }
      set { attributes[.foregroundColor] = newValue }
    }
    public var backgroundColor: UIColor? {
      get { return attributes[.backgroundColor] as? UIColor }
      set { attributes[.backgroundColor] = newValue }
    }
    public var ligature: Bool? {
      get { return attributes[.ligature] as? Bool }
      set { attributes[.ligature] = newValue }
    }
    public var kern: Float? {
      get { return attributes[.kern] as? Float }
      set { attributes[.kern] = newValue }
    }
    public var strikethroughStyle: NSUnderlineStyle? {
      get { return (attributes[.strikethroughStyle] as? Int).flatMap(NSUnderlineStyle.init) }
      set { attributes[.strikethroughStyle] = newValue?.rawValue }
    }
    public var strikethroughColor: UIColor? {
      get { return attributes[.strikethroughColor] as? UIColor }
      set { attributes[.strikethroughColor] = newValue }
    }
    public var underlineStyle: NSUnderlineStyle? {
      get { return (attributes[.underlineStyle] as? Int).flatMap(NSUnderlineStyle.init) }
      set { attributes[.underlineStyle] = newValue?.rawValue }
    }
    public var underlineColor: UIColor? {
      get { return attributes[.underlineColor] as? UIColor }
      set { attributes[.underlineColor] = newValue }
    }
    public var strokeWidth: Float? {
      get { return attributes[.strokeWidth] as? Float }
      set { attributes[.strokeWidth] = newValue }
    }
    public var strokeColor: UIColor? {
      get { return attributes[.strokeColor] as? UIColor }
      set { attributes[.strokeColor] = newValue }
    }
    public var textEffect: TextEffect? {
      get { return (attributes[.textEffect] as? String).flatMap(TextEffect.init) }
      set { attributes[.textEffect] = newValue?.rawValue }
    }
    @available(iOS 7.0, *)
    public var attachment: NSTextAttachment? {
      get { return attributes[.attachment] as? NSTextAttachment }
      set { attributes[.attachment] = newValue }
    }
    public var link: Link? {
      get { return attributes[.link].flatMap(Link.init) }
      set { attributes[.link] = newValue?.rawValue }
    }
    public var baselineOffset: Float? {
      get { return attributes[.baselineOffset] as? Float }
      set { attributes[.baselineOffset] = newValue }
    }
    public var obliqueness: Float? {
      get { return attributes[.obliqueness] as? Float }
      set { attributes[.obliqueness] = newValue }
    }
    public var expansion: Float? {
      get { return attributes[.expansion] as? Float }
      set { attributes[.expansion] = newValue }
    }
    public var writingDirection: [Int]? {
      get { return attributes[.writingDirection] as? [Int] }
      set { attributes[.writingDirection] = newValue }
    }
    public var verticalGlyphForm: Bool? {
      get { return attributes[.verticalGlyphForm] as? Bool }
      set { attributes[.verticalGlyphForm] = newValue }
    }

    // Shadow
    public var shadowOffset: CGSize? {
      get { return shadow[.offset] as? CGSize }
      set { shadow[.offset] = newValue }
    }
    public var shadowBlurRadius: CGFloat? {
      get { return shadow[.blurRadius] as? CGFloat }
      set { shadow[.blurRadius] = newValue }
    }
    public var shadowColor: UIColor? {
      get { return shadow[.color] as? UIColor }
      set { shadow[.color] = newValue }
    }

    // Paragraph Style
    public var alignment: NSTextAlignment? {
      get { return paragraphStyle[.alignment] as? NSTextAlignment }
      set { paragraphStyle[.alignment] = newValue }
    }
    public var firstLineHeadIndent: CGFloat? {
      get { return paragraphStyle[.firstLineHeadIndent] as? CGFloat }
      set { paragraphStyle[.firstLineHeadIndent] = newValue }
    }
    public var headIndent: CGFloat? {
      get { return paragraphStyle[.headIndent] as? CGFloat }
      set { paragraphStyle[.headIndent] = newValue }
    }
    public  var tailIndent: CGFloat? {
      get { return paragraphStyle[.tailIndent] as? CGFloat }
      set { paragraphStyle[.tailIndent] = newValue }
    }
    public var lineHeightMultiple: CGFloat? {
      get { return paragraphStyle[.lineHeightMultiple] as? CGFloat }
      set { paragraphStyle[.lineHeightMultiple] = newValue }
    }
    public var maximumLineHeight: CGFloat? {
      get { return paragraphStyle[.maximumLineHeight] as? CGFloat }
      set { paragraphStyle[.maximumLineHeight] = newValue }
    }
    public var minimumLineHeight: CGFloat? {
      get { return paragraphStyle[.minimumLineHeight] as? CGFloat }
      set { paragraphStyle[.minimumLineHeight] = newValue }
    }
    public var lineSpacing: CGFloat? {
      get { return paragraphStyle[.lineSpacing] as? CGFloat }
      set { paragraphStyle[.lineSpacing] = newValue }
    }
    public var paragraphSpacing: CGFloat? {
      get { return paragraphStyle[.paragraphSpacing] as? CGFloat }
      set { paragraphStyle[.paragraphSpacing] = newValue }
    }
    public var paragraphSpacingBefore: CGFloat? {
      get { return paragraphStyle[.paragraphSpacingBefore] as? CGFloat }
      set { paragraphStyle[.paragraphSpacingBefore] = newValue }
    }
    public var tabStops: [NSTextTab]? {
      get { return paragraphStyle[.tabStops] as? [NSTextTab] }
      set { paragraphStyle[.tabStops] = newValue }
    }
    public var defaultTabInterval: CGFloat? {
      get { return paragraphStyle[.defaultTabInterval] as? CGFloat }
      set { paragraphStyle[.defaultTabInterval] = newValue }
    }
    public var lineBreakMode: NSLineBreakMode? {
      get { return paragraphStyle[.lineBreakMode] as? NSLineBreakMode }
      set { paragraphStyle[.lineBreakMode] = newValue }
    }
    public var hyphenationFactor: Float? {
      get { return paragraphStyle[.hyphenationFactor] as? Float }
      set { paragraphStyle[.hyphenationFactor] = newValue }
    }
    public var baseWritingDirection: NSWritingDirection? {
      get { return paragraphStyle[.baseWritingDirection] as? NSWritingDirection }
      set { paragraphStyle[.baseWritingDirection] = newValue }
    }

    internal var nsShadow: NSShadow? {
      get {
        if self.shadow.isEmpty { return nil }

        let result = NSShadow()
        result.shadowOffset = shadowOffset ?? result.shadowOffset
        result.shadowBlurRadius = shadowBlurRadius ?? result.shadowBlurRadius
        result.shadowColor = shadowColor ?? result.shadowColor

        return result
      }
      set {
        self.shadow[.offset] = newValue?.shadowOffset
        self.shadow[.blurRadius] = newValue?.shadowBlurRadius
        self.shadow[.color] = newValue?.shadowColor
      }
    }

    internal var nsParagraphStyle: NSParagraphStyle? {
      get {
        if self.paragraphStyle.isEmpty { return nil }

        let result = NSMutableParagraphStyle()
        result.alignment = alignment ?? result.alignment
        result.firstLineHeadIndent = firstLineHeadIndent ?? result.firstLineHeadIndent
        result.headIndent = headIndent ?? result.headIndent
        result.tailIndent = tailIndent ?? result.tailIndent
        result.lineHeightMultiple = lineHeightMultiple ?? result.lineHeightMultiple
        result.maximumLineHeight = maximumLineHeight ?? result.maximumLineHeight
        result.minimumLineHeight = minimumLineHeight ?? result.minimumLineHeight
        result.lineSpacing = lineSpacing ?? result.lineSpacing
        result.paragraphSpacing = paragraphSpacing ?? result.paragraphSpacing
        result.paragraphSpacingBefore = paragraphSpacingBefore ?? result.paragraphSpacingBefore
        result.tabStops = tabStops ?? result.tabStops
        result.defaultTabInterval = defaultTabInterval ?? result.defaultTabInterval
        result.lineBreakMode = lineBreakMode ?? result.lineBreakMode
        result.hyphenationFactor = hyphenationFactor ?? result.hyphenationFactor
        result.baseWritingDirection = baseWritingDirection ?? result.baseWritingDirection

        return result
      }
      set {
        self.paragraphStyle[.alignment] = newValue?.alignment
        self.paragraphStyle[.firstLineHeadIndent] = newValue?.firstLineHeadIndent
        self.paragraphStyle[.headIndent] = newValue?.headIndent
        self.paragraphStyle[.tailIndent] = newValue?.tailIndent
        self.paragraphStyle[.lineHeightMultiple] = newValue?.lineHeightMultiple
        self.paragraphStyle[.maximumLineHeight] = newValue?.maximumLineHeight
        self.paragraphStyle[.minimumLineHeight] = newValue?.minimumLineHeight
        self.paragraphStyle[.lineSpacing] = newValue?.lineSpacing
        self.paragraphStyle[.paragraphSpacing] = newValue?.paragraphSpacing
        self.paragraphStyle[.paragraphSpacingBefore] = newValue?.paragraphSpacingBefore
        self.paragraphStyle[.tabStops] = newValue?.tabStops
        self.paragraphStyle[.defaultTabInterval] = newValue?.defaultTabInterval
        self.paragraphStyle[.lineBreakMode] = newValue?.lineBreakMode
        self.paragraphStyle[.hyphenationFactor] = newValue?.hyphenationFactor
        self.paragraphStyle[.baseWritingDirection] = newValue?.baseWritingDirection
      }
    }

    internal init() {
    }

    internal init(attributes: [NSAttributedString.Key: Any]) {
      let shadow = attributes[.shadow] as? NSShadow
      let paragraphStyle = attributes[.paragraphStyle] as? NSParagraphStyle

      self.attributes = attributes
      self.attributes[.shadow] = nil
      self.attributes[.paragraphStyle] = nil

      self.nsShadow = shadow
      self.nsParagraphStyle = paragraphStyle
    }

    internal var nsAttributes: [NSAttributedString.Key: Any] {
      var attrs = self.attributes
      attrs[.shadow] = self.nsShadow
      attrs[.paragraphStyle] = self.nsParagraphStyle

      return attrs
    }

    internal func merge(_ style: Style) -> Style {
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

extension NSShadow {
  struct Key: Hashable, RawRepresentable {
    static let offset = Key("offset")
    static let blurRadius = Key("blurRadius")
    static let color = Key("color")

    let rawValue: String
    init(_ rawValue: String) { self.rawValue = rawValue }
    init(rawValue: String) { self.rawValue = rawValue }
  }
}

extension NSParagraphStyle {
  struct Key: Hashable {
    static let alignment = Key("alignment")
    static let firstLineHeadIndent = Key("firstLineHeadIndent")
    static let headIndent = Key("headIndent")
    static let tailIndent = Key("tailIndent")
    static let lineHeightMultiple = Key("lineHeightMultiple")
    static let maximumLineHeight = Key("maximumLineHeight")
    static let minimumLineHeight = Key("minimumLineHeight")
    static let lineSpacing = Key("lineSpacing")
    static let paragraphSpacing = Key("paragraphSpacing")
    static let paragraphSpacingBefore = Key("paragraphSpacingBefore")
    static let tabStops = Key("tabStops")
    static let defaultTabInterval = Key("defaultTabInterval")
    static let lineBreakMode = Key("lineBreakMode")
    static let hyphenationFactor = Key("hyphenationFactor")
    static let baseWritingDirection = Key("baseWritingDirection")

    let rawValue: String
    init(_ rawValue: String) { self.rawValue = rawValue }
    init(rawValue: String) { self.rawValue = rawValue }
  }
}
