//
// Array+BidirectionalCollectionTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

extension ArrayTests {
	internal func test_lastIndexFails() {
		// Given
		let collection: Array<UInt> = .init()
		
		// Then
		XCTAssertNil(collection.lastIndex)
		XCTAssertEqual(collection.endIndex, 0)
	}
	
	internal func test_lastIndexSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.lastIndex, 4)
		XCTAssertEqual(collection.endIndex, 5)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_secondLastFails() {
		// Given
		let collection: Array<UInt> = .init()
		
		// Then
		XCTAssertNil(collection.secondLast)
		XCTAssertEqual(collection.endIndex, 0)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_secondLastSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.secondLast, 40)
		XCTAssertEqual(collection.endIndex, 5)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_thirdLastFails() {
		// Given
		let collection: Array<UInt> = .init()
		
		// Then
		XCTAssertNil(collection.thirdLast)
		XCTAssertEqual(collection.endIndex, 0)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_thirdLastSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.thirdLast, 30)
		XCTAssertEqual(collection.endIndex, 5)
	}
	
	internal func test_beforeSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.before(50), 40)
	}
}
