# StatusItemController

[![Actions Status](https://github.com/hexedbits/StatusItemController/workflows/CI/badge.svg)](https://github.com/hexedbits/StatusItemController/actions)

*A component to simplify managing macOS menu bar items*

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

- macOS 10.12+
- Swift 5.2+
- Xcode 11.4+
- SwiftLint

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

Add `StatusItemController` to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/hexedbits/StatusItemController", from: "1.0.0")
]
```

Alternatively, you can add the package [directly via Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Documentation

Read the [docs](https://hexedbits.github.io/StatusItemController). Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

#### Generate

````bash
$ ./scripts/build_docs.sh
````

#### Preview

````bash
$ open index.html -a Safari
````

## Contributing

Interested in making contributions to this project? Please review the guides below.

- [Contributing Guidelines](https://github.com/hexedbits/.github/blob/master/CONTRIBUTING.md)
- [Code of Conduct](https://github.com/hexedbits/.github/blob/master/CODE_OF_CONDUCT.md)
- [Support and Help](https://github.com/hexedbits/.github/blob/master/SUPPORT.md)
- [Security Policy](https://github.com/hexedbits/.github/blob/master/SECURITY.md)

Also, consider [sponsoring this project](https://www.jessesquires.com/sponsor/) or [buying my apps](https://www.hexedbits.com)! ✌️

## Credits

Created and maintained by [**@jesse_squires**](https://twitter.com/jesse_squires).

## License

Released under the MIT License. See `LICENSE` for details.

>**Copyright &copy; 2020-present Jesse Squires.**
