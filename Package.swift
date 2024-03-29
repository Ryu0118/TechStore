// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TechStore",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(name: "Domain", targets: ["Domain"]),
        .library(name: "Presentation", targets: ["Presentation"]),
        .library(name: "Infrastructure", targets: ["Infrastructure"]),
        .library(name: "Shared", targets: ["Shared"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.47.2"),
        .package(url: "https://github.com/kean/Nuke", from: "11.5.3"),
        .package(url: "https://github.com/scinfu/SwiftSoup.git", from: "2.4.3"),
        .package(url: "https://github.com/Ryu0118/FeedKit", branch: "master"),
    ],
    targets: [
        .target(
            name: "Domain",
            dependencies: [
                .product(name: "Dependencies", package: "swift-composable-architecture"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .target(
            name: "Presentation",
            dependencies: [
                "Domain",
                "Shared",
                .product(name: "Dependencies", package: "swift-composable-architecture"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "NukeUI", package: "Nuke"),
            ]
        ),
        .target(
            name: "Infrastructure",
            dependencies: [
                "Domain",
                .product(name: "Dependencies", package: "swift-composable-architecture"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SwiftSoup", package: "SwiftSoup"),
                .product(name: "FeedKit", package: "FeedKit"),
            ],
            resources: [
                .process("Resources"),
            ]
        ),
        .target(name: "Shared"),
        .testTarget(
            name: "TechStoreTests",
            dependencies: [
                "Domain",
                "Presentation",
                .product(name: "Dependencies", package: "swift-composable-architecture"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
    ]
)
