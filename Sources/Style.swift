//
//  Style.swift
//  Pods
//
//  Created by Sander de Vos on 15/12/15.
//
//

infix operator ??= { }
private func ??=<T>(inout l: T?, @autoclosure val: () -> T?) {
  l = l ?? val()
}

enum TextLink {
  case Url(NSURL)
  case UrlString(String)
}

extension TextEffect {
  var value: String {
    switch self {
    case LetterPress: return NSTextEffectLetterpressStyle
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

    var attributes: [String: AnyObject] {
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
}