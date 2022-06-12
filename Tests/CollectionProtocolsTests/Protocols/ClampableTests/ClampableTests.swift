// ClampableTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

protocol ClampableTests: XCTestCase {
	associatedtype TestSubject
	where TestSubject: Clampable
	
	func test_clampingFromValueSucceeds()
	func test_clampFromValueSucceeds()
	func test_clampingFromThroughValueSucceeds()
	func test_clampFromThroughValueSucceeds()
	func test_clampingThroughValueSucceeds()
	func test_clampThroughValueSucceeds()
	func test_clampingToClosedRangeSucceeds()
	func test_clampToClosedRangeSucceeds()
	func test_clampingFromPartialRangeSucceeds()
	func test_clampFromPartialRangeSucceeds()
	func test_clampingThroughPartialRangeSucceeds()
	func test_clampThroughPartialRangeSucceeds()
}
