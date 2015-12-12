<img src="https://cloud.githubusercontent.com/assets/75655/11761753/631eee38-a0cf-11e5-9b23-4d201f1705cf.png" width="185" alt="StyledString">   [![CI Status](http://img.shields.io/travis/Sander de Vos/StyledString.svg?style=flat)](https://travis-ci.org/Sander de Vos/StyledString)
[![Version](https://img.shields.io/cocoapods/v/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)
[![License](https://img.shields.io/cocoapods/l/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)
[![Platform](https://img.shields.io/cocoapods/p/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)

<hr>

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

## Installation

StyledString is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "StyledString"
```

Releases
--------

 - **0.1.0** - 2015-12-02 - Initial public release
 - 0.0.0 - 2015-02-02 - Initial private version for project at [Q42](http://q42.com)

## License

StyledString is available under the MIT license. See the LICENSE file for more info.
