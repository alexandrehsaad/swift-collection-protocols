//
// Int+ClampableTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

#if hasFeature(RetroactiveAttribute)
extension Int: @retroactive Clampable {}
#else
extension Int: Clampable {}
#endif

extension IntTests {
	internal func test_clampingFromValueSucceeds() {
		// Given
		let value: Float = 0
		let lowerBound: Float = 1
		
		// When
		let newValue: Float = value.clamping(from: lowerBound)

		// Then
		XCTAssertEqual(newValue, 1)
	}
	
	internal func test_clampFromValueSucceeds() {
		// Given
		var value: Float = 0
		let lowerBound: Float = 1
		
		// When
		value.clamp(from: lowerBound)

		// Then
		XCTAssertEqual(value, 1)
	}
	
	internal func test_clampingFromThroughValueSucceeds() {
		// Given
		let value: Float = 0
		let lowerBound: Float = 1
		let upperBound: Float = 5
		
		// When
		let newValue: Float = value.clamping(from: lowerBound, through: upperBound)

		// Then
		XCTAssertEqual(newValue, 1)
	}
	
	internal func test_clampFromThroughValueSucceeds() {
		// Given
		var value: Float = 0
		let lowerBound: Float = 1
		let upperBound: Float = 5
		
		// When
		value.clamp(from: lowerBound, through: upperBound)

		// Then
		XCTAssertEqual(value, 1)
	}
	
	internal func test_clampingThroughValueSucceeds() {
		// Given
		let value: Float = 6
		let upperBound: Float = 5
		
		// When
		let newValue: Float = value.clamping(through: upperBound)

		// Then
		XCTAssertEqual(newValue, 5)
	}
	
	internal func test_clampThroughValueSucceeds() {
		// Given
		var value: Float = 6
		let upperBound: Float = 5
		
		// When
		value.clamp(through: upperBound)

		// Then
		XCTAssertEqual(value, 5)
	}
	
	internal func test_clampingToClosedRangeSucceeds() {
		// Given
		let value: Float = 0
		let range: ClosedRange<Float> = 1...5
		
		// When
		let newValue: Float = value.clamping(to: range)

		// Then
		XCTAssertEqual(newValue, 1)
	}
	
	internal func test_clampToClosedRangeSucceeds() {
		// Given
		var value: Float = 0
		let range: ClosedRange<Float> = 1...5
		
		// When
		value.clamp(to: range)

		// Then
		XCTAssertEqual(value, 1)
	}
	
	internal func test_clampingFromPartialRangeSucceeds() {
		// Given
		let value: Float = 0
		let range: PartialRangeFrom<Float> = 1...
		
		// When
		let newValue: Float = value.clamping(from: range)

		// Then
		XCTAssertEqual(newValue, 1)
	}
	
	internal func test_clampFromPartialRangeSucceeds() {
		// Given
		var value: Float = 0
		let range: PartialRangeFrom<Float> = 1...
		
		// When
		value.clamp(from: range)

		// Then
		XCTAssertEqual(value, 1)
	}
	
	internal func test_clampingThroughPartialRangeSucceeds() {
		// Given
		let value: Float = 6
		let range: PartialRangeThrough<Float> = ...5
		
		// When
		let newValue: Float = value.clamping(through: range)

		// Then
		XCTAssertEqual(newValue, 5)
	}
	
	internal func test_clampThroughPartialRangeSucceeds() {
		// Given
		var value: Float = 6
		let range: PartialRangeThrough<Float> = ...5
		
		// When
		value.clamp(through: range)

		// Then
		XCTAssertEqual(value, 5)
	}
}
