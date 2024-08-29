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
    targets: [
        .target(
            name: "CocoaMarkdown",
            dependencies: ["cmark"],
            publicHeadersPath: "include",
            cSettings: [
                .define("CMARK_INLINE", to: "inline"),
                .headerSearchPath("."),
            ],
            cxxSettings: [
                .define("CMARK_INLINE", to: "inline"),
                .headerSearchPath("."),
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