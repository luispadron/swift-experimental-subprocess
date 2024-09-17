// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftExperimentalSubprocess",
    platforms: [.macOS("14.0"), .iOS("18.0"), .tvOS("18.0"), .watchOS("11.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftExperimentalSubprocess",
            targets: ["SwiftExperimentalSubprocess"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-foundation",
            branch: "main"),
        .package(
            url: "https://github.com/apple/swift-system",
            from: "1.0.0")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftExperimentalSubprocess",
            dependencies: [
                "_CShims",
                .product(name: "FoundationEssentials", package: "swift-foundation"),
                .product(name: "SystemPackage", package: "swift-system"),

            ],
            path: "Sources/Subprocess"
        ),
        .testTarget(
            name: "SwiftExperimentalSubprocessTests",
            dependencies: [
                "SwiftExperimentalSubprocess",
                .product(name: "FoundationEssentials", package: "swift-foundation"),
                .product(name: "SystemPackage", package: "swift-system"),
            ],
            resources: [
                .copy("SubprocessTests/Resources")
            ]
        ),

        .target(
            name: "_CShims",
            path: "Sources/_CShims"
        ),
    ]
)
