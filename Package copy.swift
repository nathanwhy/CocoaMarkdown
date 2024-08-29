// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CocoaMarkdown",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "CocoaMarkdown",
            targets: ["CocoaMarkdown"]),
    ],
    dependencies: [
        // 如果 cmark 有 Swift Package，可以在这里添加依赖
        // .package(url: "https://github.com/commonmark/cmark.git", from: "0.31.1"),
    ],
    targets: [
        .target(
            name: "CocoaMarkdown",
            dependencies: ["cmark"],
            publicHeadersPath: "include",
            cSettings: [
                .define("CMARK_INLINE", to: "inline"),
                .headerSearchPath("CocoaMarkdown/Configuration"),
            ],
            cxxSettings: [
                .define("CMARK_INLINE", to: "inline"),
                .headerSearchPath("CocoaMarkdown/Configuration"),
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE"),
            ]
        ),
        .target(
            name: "cmark",
            path: "Sources/cmark",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include")
            ]
        ),
    ]
 )