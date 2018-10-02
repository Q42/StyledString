<img src="https://cloud.githubusercontent.com/assets/75655/11761753/631eee38-a0cf-11e5-9b23-4d201f1705cf.png" width="185" alt="StyledString">   [![CI Status](http://img.shields.io/travis/Sander%20de%20Vos/StyledString.svg?style=flat)](https://travis-ci.org/Sander%20de%20Vos/StyledString)
[![Version](https://img.shields.io/cocoapods/v/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)
[![License](https://img.shields.io/cocoapods/l/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)
[![Platform](https://img.shields.io/cocoapods/p/StyledString.svg?style=flat)](http://cocoapods.org/pods/StyledString)

<hr>

## Example

```swift
let hello = StyledString("Hello")
  .withUnderline()
  .with(foregroundColor: .blue)

let world = StyledString("world")
  .withStrikethrough()
  .with(foregroundColor: .red)

label.attributedText = (hello + " " + world)
  .withShadow()
  .with(font: .boldSystemFont(ofSize: 50))
  .attributedString
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

 - 0.7.0 - 2018-10-02 - Swift 4.2 support, use dictionaries for internal state
 - 0.6.0 - 2018-04-16 - Style is now public
 - 0.5.0 - 2017-11-02 - Add Swift 4 support
 - **0.4.2** - 2017-01-19 - CocoaPods release
 - 0.4.1 - 2017-01-17 - Add `@availability` annotations for Swift 3 conversion
 - 0.4.0 - 2017-01-02 - Swift 3 support
 - 0.3.0 - 2016-03-22 - Swift 2.2 support
 - 0.2.0 - 2015-12-19 - Renamed some `with*` methods
 - **0.1.0** - 2015-12-02 - Initial public release
 - 0.0.0 - 2015-02-02 - Initial private version for project at [Q42](http://q42.com)

## License

StyledString is available under the MIT license. See the LICENSE file for more info.
