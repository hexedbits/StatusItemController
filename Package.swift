// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//  Documentation
//  https://hexedbits.github.io/StatusItemController
//
//  GitHub
//  https://github.com/hexedbits/StatusItemController
//
//  Copyright © 2020-present Jesse Squires, Hexed Bits
//  https://www.hexedbits.com
//

import PackageDescription

let package = Package(
    name: "StatusItemController",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "StatusItemController",
            targets: ["StatusItemController"])
    ],
    targets: [
        .target(
            name: "StatusItemController",
            path: "Sources"),
        .testTarget(name: "StatusItemControllerTests",
                    dependencies: ["StatusItemController"],
                    path: "Tests")
    ],
    swiftLanguageVersions: [.v5]
)
