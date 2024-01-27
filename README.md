# StatusItemController  [![CI](https://github.com/hexedbits/StatusItemController/workflows/CI/badge.svg)](https://github.com/hexedbits/StatusItemController/actions)

*A "view controller" for menu bar Mac apps*

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fhexedbits%2FStatusItemController%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/hexedbits/StatusItemController) <br> [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fhexedbits%2FStatusItemController%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/hexedbits/StatusItemController)

## About

This library provides a `StatusItemController` component that you can use to create menu bar apps, or apps with menu bar items in macOS.

This component is used in [Red Eye](https://www.hexedbits.com/redeye/) and [Lucifer](https://www.hexedbits.com/lucifer/).

## Usage

1. Subclass `StatusItemController`
1. Implement the following methods:
    1. `buildMenu() -> NSMenu`
    1. `leftClickAction()`
    1. `rightClickAction()`
1. Create an instance of your `StatusItemController` subclass in your `NSApplicationDelegate`.

## Requirements

- macOS 11.0+
- Swift 5.9+
- Xcode 15.0+
- [SwiftLint](https://github.com/realm/SwiftLint)

## Installation

### [CocoaPods](http://cocoapods.org)

````ruby
pod 'StatusItemController', '~> 2.0.0'
````

### [Swift Package Manager](https://swift.org/package-manager/)

Add `StatusItemController` to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/hexedbits/StatusItemController", from: "2.0.0")
]
```

Alternatively, you can add the package [directly via Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Documentation

You can read the [documentation here](https://hexedbits.github.io/StatusItemController). Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

## Notes on Testing

Unfortunately, `StatusItemController` cannot be tested directly. Attempting to create an `NSStatusItem` _outside_ of an app context throws an assert, which makes sense. Thus, in order to test `StatusItemController` it must be embedded in an app. Tests can be found in the Example App test suite. See [#15](https://github.com/hexedbits/StatusItemController/issues/15) for more details.

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/hexedbits/.github/blob/main/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/hexedbits/.github/blob/main/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/hexedbits/.github/blob/main/SUPPORT.md)
- [Security Policy](https://github.com/hexedbits/.github/blob/main/SECURITY.md)

Also consider [sponsoring this project](https://github.com/sponsors/jessesquires) or [buying my apps](https://www.hexedbits.com)! ✌️

## Credits

Created and maintained by [**Jesse Squires**](https://www.jessesquires.com).

## License

Released under the MIT License. See `LICENSE` for details.

> **Copyright &copy; 2020-present Jesse Squires.**
