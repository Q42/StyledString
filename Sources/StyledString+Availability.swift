//
//  StyledString+Availability.swift
//  StylesString
//
//  Created by Tom Lokhorst on 2017-01-16.
//

import Foundation

// Swift 3 renames
public extension StyledString {

  @available(*, unavailable, renamed: "attributedString")
  public var NSAttributedString: Foundation.NSAttributedString {
    fatalError()
  }
}


public extension StyledString {

  @available(*, unavailable, renamed: "with(font:)")
  public func withFont(_ font: UIFont?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(foregroundColor:)")
  public func withForegroundColor(_ foregroundColor: UIColor?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(backgroundColor:)")
  public func withBackgroundColor(_ backgroundColor: UIColor?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(ligatures:)")
  public func withLigatures(_ ligatures: Bool? = true) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(kerning:)")
  public func withKerning(_ kern: Float?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(underlineStyle:color:)")
  public func withUnderline(_ style: NSUnderlineStyle? = .styleSingle, color: UIColor? = nil) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(strikethroughStyle:color:)")
  public func withStrikethrough(_ style: NSUnderlineStyle? = .styleSingle, color: UIColor? = nil) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(strokeWidth:color:)")
  public func withStroke(_ width: Float? = 1, color: UIColor? = nil) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(shadowOffset:blurRadius:color:)")
  public func withShadow(_ offset: CGSize? = CGSize(width: 1, height: 1), blurRadius: CGFloat? = 0, color: UIColor? = nil) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(textEffect:)")
  public func withTextEffect(_ effect: TextEffect? = .letterPress) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(attachment:)")
  public func withAttachment(_ attachment: NSTextAttachment?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(link:)")
  public func withLink(_ link: NSURL?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(link:)")
  public func withLink(_ link: String?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(baselineOffset:)")
  public func withBaselineOffset(_ offset: Float?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(obliqueness:)")
  public func withObliqueness(_ obliqueness: Float?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(expansion:)")
  public func withExpansion(_ expansion: Float?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(writingDirection:)")
  public func withWritingDirection(_ writingDirection: [Int]?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(verticalGlyphForm:)")
  public func withVerticalGlyphForm(_ verticalGlyphForm: Bool? = true) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(alignment:)")
  public func withAlignment(_ alignment: NSTextAlignment?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(firstLineHeadIndent:)")
  public func withFirstLineHeadIndent(_ firstLineHeadIndent: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(headIndent:)")
  public func withHeadIndent(_ headIndent: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(tailIndent:)")
  public func withTailIndent(_ tailIndent: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(lineHeightMultiple:)")
  public func withLineHeightMultiple(_ lineHeightMultiple: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(maximumLineHeight:)")
  public func withMaximumLineHeight(_ maximumLineHeight: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(minimumLineHeight:)")
  public func withMinimumLineHeight(_ minimumLineHeight: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(lineSpacing:)")
  public func withLineSpacing(_ lineSpacing: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(paragraphSpacing:)")
  public func withParagraphSpacing(_ paragraphSpacing: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(paragraphSpacingBefore:)")
  public func withParagraphSpacingBefore(_ paragraphSpacingBefore: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(defaultTabInterval:)")
  public func withDefaultTabInterval(_ defaultTabInterval: CGFloat?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(tabStops:)")
  public func withTabStops(_ tabStops: [NSTextTab]?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(lineBreakMode:)")
  public func withLineBreakMode(_ lineBreakMode: NSLineBreakMode?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(hyphenationFactor:)")
  public func withHyphenationFactor(_ hyphenationFactor: Float?) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "with(baseWritingDirection:)")
  public func withBaseWritingDirection(_ writingDirection: NSWritingDirection?) -> StyledString {
    fatalError()
  }

}

extension Sequence where Iterator.Element == StyledString {

  @available(*, unavailable, renamed: "joined(separator:)")
  public func joinWithSeparator(_ separator: String) -> StyledString {
    fatalError()
  }

  @available(*, unavailable, renamed: "joined(separator:)")
  public func joinWithSeparator(_ separator: StyledString) -> StyledString {
    fatalError()
  }

}
