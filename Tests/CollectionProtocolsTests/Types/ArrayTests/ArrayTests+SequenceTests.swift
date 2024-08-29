//
// Array+SequenceTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

extension ArrayTests {
	internal func test_anySatisfyWhereReturnsFalse() {
		// Given
		let sequence: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		let result: Bool = sequence.anySatisfy(where: { $0 == 0 })
		
		// Then
		XCTAssertFalse(result)
	}
	
	internal func test_anySatisfyWhereReturnsTrue() {
		// Given
		let sequence: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		let result: Bool = sequence.anySatisfy(where: { $0 == 10 })
		
		// Then
		XCTAssertTrue(result)
	}
	
	internal func test_noneSatisfyWhereReturnsFalse() {
		// Given
		let sequence: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		let result: Bool = sequence.noneSatisfy(where: { $0 == 10 })
		
		// Then
		XCTAssertFalse(result)
	}
	
	internal func test_noneSatisfyWhereReturnsTrue() {
		// Given
		let sequence: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		let result: Bool = sequence.noneSatisfy(where: { $0 == 0 })
		
		// Then
		XCTAssertTrue(result)
	}
	
	internal func test_containsContentsOfReturnsFalse() {
		// Given
		let sequence: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		let result: Bool = sequence.contains(contentsOf: [1, 3, 5])
		
		// Then
		XCTAssertFalse(result)
	}
	
	internal func test_containsContentsOfReturnsTrue() {
		// Given
		let sequence: Array<UInt> = [10, 20, 30, 40, 50]
		
		// Then
		let result: Bool = sequence.contains(contentsOf: [10, 30, 50])
		
		// Then
		XCTAssertTrue(result)
	}
	
	internal func test_containsContentsOfFails() {
		// Given
		let sequence: Array<String> = ["h", "e", "l", "l", "o"]
		
		// Then
		let result: Int = sequence.count(where: { $0 == "y" })
		
		// Then
		XCTAssertEqual(result, 0)
	}
		
	internal func test_containsContentsOfSucceeds() {
		// Given
		let sequence: Array<String> = ["h", "e", "l", "l", "o"]
		
		// Then
		let result: Int = sequence.count(where: { $0 == "l" })
		
		// Then
		XCTAssertEqual(result, 2)
	}
}
