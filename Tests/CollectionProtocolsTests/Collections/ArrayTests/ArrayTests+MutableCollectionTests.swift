// Array+MutableCollectionTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

extension ArrayTests {
	func test_replaceWhereFails() {
		// Given
		var collection: Array<UInt> = []
		
		// Then
		collection.replace(where: { $0 == 0 }, with: 30)
		
		// Then
		XCTAssertEqual(collection, [])
	}
	
	func test_replaceWhereSucceeds() {
		// Given
		var collection: Array<UInt> = [10, 20, 0, 40, 50]
		
		// Then
		collection.replace(where: { $0 == 0 }, with: 30)
		
		// Then
		XCTAssertEqual(collection, [10, 20, 30, 40, 50])
	}
	
	func test_replaceFirstWithFails() {
		// Given
		var collection: Array<UInt> = []
		
		// Then
		collection.replaceFirst(with: 10)
		
		// Then
		XCTAssertEqual(collection, [])
	}
	
	func test_replaceFirstWithSucceeds() {
		// Given
		var collection: Array<UInt> = [0, 20, 30, 40, 50]
		
		// Then
		collection.replaceFirst(with: 10)
		
		// Then
		XCTAssertEqual(collection, [10, 20, 30, 40, 50])
	}
	
	func test_replaceLastWithFails() {
		// Given
		var collection: Array<UInt> = []
		
		// Then
		collection.replaceLast(with: 50)
		
		// Then
		XCTAssertEqual(collection, [])
	}
	
	func test_replaceLastWithSucceeds() {
		// Given
		var collection: Array<UInt> = [10, 20, 30, 40, 0]
		
		// Then
		collection.replaceLast(with: 50)
		
		// Then
		XCTAssertEqual(collection, [10, 20, 30, 40, 50])
	}
}
