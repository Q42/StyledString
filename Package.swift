// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "StyledString",
  products: [
    .library(name: "StyledString", targets: ["StyledString"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(name: "StyledString"),
    .testTarget(name: "StyledStringTests", dependencies: ["StyledString"]),
  ]
)

