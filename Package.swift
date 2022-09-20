// swift-tools-version:5.7

import PackageDescription

let package: Package = .init(
	name: "swift-collection-protocols",
	defaultLocalization: "en",
	products: [
		.library(name: "CollectionProtocols", targets: ["CollectionProtocols"])
	],
	dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-contributors-plugin", branch: "main"),
		.package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMinor(from: "1.0.0"))
	],
	targets: [
		.target(name: "CollectionProtocols", path: "Sources"),
		.testTarget(name: "CollectionProtocolsTests", dependencies: ["CollectionProtocols"], path: "Tests")
	],
	swiftLanguageVersions: [.v5]
)
