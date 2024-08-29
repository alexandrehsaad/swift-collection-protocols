// swift-tools-version:5.9

import PackageDescription

let package: Package = .init(
	name: "swift-collection-protocols",
	defaultLocalization: "en",
	products: [
		.library(name: "CollectionProtocols", targets: ["CollectionProtocols"])
	],
	dependencies: [
		.package(url: "https://github.com/swiftlang/swift-docc-plugin.git", .upToNextMajor(from: "1.4.2"))
	],
	targets: [
        .target(
            name: "CollectionProtocols",
            path: "Sources",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
        ),
        .testTarget(
            name: "CollectionProtocolsTests",
            dependencies: ["CollectionProtocols"],
            path: "Tests",
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency=complete")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
