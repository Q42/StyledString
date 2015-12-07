# StyledString

[![CI Status](http://img.shields.io/travis/Sander de Vos/StyledString.svg?style=flat)](https://travis-ci.org/Sander de Vos/StyledString)
[![Version](https://img.shields.io/cocoapods/v/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)
[![License](https://img.shields.io/cocoapods/l/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)
[![Platform](https://img.shields.io/cocoapods/p/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Example

```swift
let hello = StyledString(string: "Hello")
  .withUnderline()
  .withColor(UIColor.blueColor())
let world = StyledString(string: "world")
  .withStrikethrough()
  .withColor(UIColor.redColor())

label.attributedText = (hello + " " + world)
  .withShadow()
  .withFont(UIFont.boldSystemFontOfSize(50))
  .NSAttributedString()
```

Result:

![Example image](https://cloud.githubusercontent.com/assets/75655/11640296/2e96c190-9d32-11e5-8706-42dfbdf439fe.png)

## Requirements

## Installation

StyledString is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StyledString"
```

## Author

Sander de Vos, sander@q42.nl

## License

StyledString is available under the MIT license. See the LICENSE file for more info.
