// Array+RangeReplaceableCollectionTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

extension ArrayTests {
	func test_removeFirstWhereFails() {
		// Given
		var collection: Array<String> = ["h", "e", "l", "l", "o"]
		
		// Then
		collection.removeFirst(where: { $0 == "y" })
		
		// Then
		XCTAssertEqual(collection, ["h", "e", "l", "l", "o"])
	}
	
	func test_removeFirstWhereSucceeds() {
		// Given
		var collection: Array<String> = ["h", "e", "l", "l", "o"]
		
		// Then
		collection.removeFirst(where: { $0 == "l" })
		
		// Then
		XCTAssertEqual(collection, ["h", "e", "l", "o"])
	}
	
	func test_removeLastWhereFails() {
		// Given
		var collection: Array<String> = ["h", "e", "l", "l", "o"]
		
		// Then
		collection.removeLast(where: { $0 == "y" })
		
		// Then
		XCTAssertEqual(collection, ["h", "e", "l", "l", "o"])
	}
	
	func test_removeLastWithSucceeds() {
		// Given
		var collection: Array<String> = ["h", "e", "l", "l", "o"]
		
		// Then
		collection.removeLast(where: { $0 == "l" })
		
		// Then
		XCTAssertEqual(collection, ["h", "e", "l", "o"])
	}
	
	func test_removeRandomElementSucceeds() {
		// Given
		var collection: Array<UInt> = [10, 20, 30, 40, 0]
		
		// Then
		for _ in collection.indices {
			collection.removeRandomElement()
		}
		
		// Then
		XCTAssertTrue(collection.isEmpty)
	}
}
