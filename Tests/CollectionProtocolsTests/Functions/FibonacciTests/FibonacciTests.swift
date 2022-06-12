// FibonacciTests.swift
// CollectionProtocolsTests
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

final class FibonacciTests: XCTestCase {
	func test_fibonacci() {
		// Given
		let length: Int = 10
		
		// When
		let values: Array<UInt> = fibonacci(length)
		
		// Then
		XCTAssertEqual(values, [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
	}
}
