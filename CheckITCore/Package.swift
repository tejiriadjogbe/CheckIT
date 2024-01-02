// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CheckITCore",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "CheckITCore",
            targets: ["CheckITCore"]),
    ],
    dependencies: [],
    targets: [
        .target(
           name: "Models",
           dependencies: []),
        .target(
           name: "Utilities",
           dependencies: [],
           resources: [
            .process("Resources")
        ]),
        .target(
           name: "Network",
           dependencies: [
           "Models"
           ]),
        .target(
            name: "CheckITCore",
            dependencies: [
            "Models",
            "Utilities",
            "Network"
            ]),
        .testTarget(
            name: "CheckITCoreTests",
            dependencies: ["CheckITCore"]),
    ]
)
