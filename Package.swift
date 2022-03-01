// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "iOS-UILibrary",
  defaultLocalization: "en",
  platforms: [.macOS(.v11), .iOS(.v14)],
  products: [.library(name: "iOS-UILibrary", targets: ["Design"])],
  dependencies: [
    // Delightful Swift snapshot testing.
    .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.9.0"),

    // Handy SwiftUI features that didn't make it into the SwiftUI standard library.
    .package(name: "HandySwiftUI", url: "https://github.com/Flinesoft/HandySwiftUI.git", .branch("main")),

    // Safely access Apple's SF Symbols using static typing
    .package(name: "SFSafeSymbols", url: "https://github.com/piknotech/SFSafeSymbols.git", from: "2.1.3"),
  ],
  targets: [
    .target(
      name: "Design",
      dependencies: [
        "HandySwiftUI",
        "SFSafeSymbols",
      ],
      resources: [
        .process("Resources/Fonts"),
        .process("Resources/Localizations"),
        .process("Resources/Colors.xcassets"),
        .process("Resources/Images.xcassets"),
      ]
    ),
    .testTarget(
      name: "DesignTests",
      dependencies: [
        "Design",
        "SnapshotTesting",
        "SFSafeSymbols",
      ],
      exclude: [
        "__Snapshots__",
      ]
    ),
  ]
)
