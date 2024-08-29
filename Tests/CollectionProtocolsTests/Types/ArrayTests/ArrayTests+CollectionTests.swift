//
// Array+CollectionTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

extension ArrayTests {
	internal func test_firstIndexFails() {
		// Given
		let collection: Array<UInt> = .init()
		
		// Then
		XCTAssertEqual(collection.startIndex, 0)
		XCTAssertNil(collection.firstIndex)
	}
	
	internal func test_firstIndexSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.startIndex, 0)
		XCTAssertEqual(collection.firstIndex, 0)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_secondFails() {
		// Given
		let collection: Array<UInt> = .init()
		
		// Then
		XCTAssertNil(collection.second)
		XCTAssertEqual(collection.endIndex, 0)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_secondSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.second, 20)
		XCTAssertEqual(collection.endIndex, 5)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_thirdFails() {
		// Given
		let collection: Array<UInt> = .init()
		
		// Then
		XCTAssertNil(collection.third)
		XCTAssertEqual(collection.endIndex, 0)
	}
	
	@available(swift, deprecated: 5.5)
	internal func test_thirdSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.third, 30)
		XCTAssertEqual(collection.endIndex, 5)
	}
	
	internal func test_afterSucceeds() {
		// Given
		let collection: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		XCTAssertEqual(collection.after(10), 20)
	}
}
