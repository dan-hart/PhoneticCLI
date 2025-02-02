// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "PhoneticCLI",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
        .macCatalyst(.v13),
        .tvOS(.v14),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        .executable(
            name: "PhoneticCLI",
            targets: ["PhoneticCLI"]
        )
    ],
    dependencies: [
        // Dependency on PhoneticTextSwift package.
        .package(url: "https://github.com/dan-hart/PhoneticTextSwift.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "PhoneticCLI",
            dependencies: [
                "PhoneticTextSwift"
            ],
            path: "Sources/PhoneticCLI"
        ),
        .testTarget(
            name: "PhoneticCLITests",
            dependencies: ["PhoneticCLI"],
            path: "Tests/PhoneticCLITests"
        )
    ]
)
