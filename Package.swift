// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "SwaggerKit",
    products: [
        .library(
            name: "SwaggerKit",
            targets: ["SwaggerKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/jpsim/Yams.git", from: "2.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "2.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.2")
    ],
    targets: [
        .target(
            name: "SwaggerKit",
            dependencies: ["Yams"],
            path: "Sources"
        ),
        .testTarget(
            name: "SwaggerKitTests",
            dependencies: ["SwaggerKit", "Yams", "Quick", "Nimble"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
