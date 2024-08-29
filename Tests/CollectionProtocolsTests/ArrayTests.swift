//
// ArrayTests.swift
// CollectionProtocolsTests
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

import XCTest
@testable import CollectionProtocols

internal final class ArrayTests: XCTestCase {}

// MARK: - BidirectionalCollection

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

// MARK: - Collection

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

// MARK: - MutableCollection

extension ArrayTests {
    internal func test_replaceWhereFails() {
        // Given
        var collection: Array<UInt> = .init()
        
        // Then
        collection.replace(where: { $0 == 0 }, with: 30)
        
        // Then
        XCTAssertEqual(collection, [])
    }
    
    internal func test_replaceWhereSucceeds() {
        // Given
        var collection: Array<UInt> = [10, 20, 0, 40, 50]
        
        // Then
        collection.replace(where: { $0 == 0 }, with: 30)
        
        // Then
        XCTAssertEqual(collection, [10, 20, 30, 40, 50])
    }
    
    internal func test_replaceFirstWithFails() {
        // Given
        var collection: Array<UInt> = .init()
        
        // Then
        collection.replaceFirst(with: 10)
        
        // Then
        XCTAssertEqual(collection, [])
    }
    
    internal func test_replaceFirstWithSucceeds() {
        // Given
        var collection: Array<UInt> = [0, 20, 30, 40, 50]
        
        // Then
        collection.replaceFirst(with: 10)
        
        // Then
        XCTAssertEqual(collection, [10, 20, 30, 40, 50])
    }
    
    internal func test_replaceLastWithFails() {
        // Given
        var collection: Array<UInt> = .init()
        
        // Then
        collection.replaceLast(with: 50)
        
        // Then
        XCTAssertEqual(collection, [])
    }
    
    internal func test_replaceLastWithSucceeds() {
        // Given
        var collection: Array<UInt> = [10, 20, 30, 40, 0]
        
        // Then
        collection.replaceLast(with: 50)
        
        // Then
        XCTAssertEqual(collection, [10, 20, 30, 40, 50])
    }
    
    internal func test_modifyEachFails() {
        // Given
        var collection: Array<UInt> = .init()
        
        // Then
        collection.modifyEach({ $0 += 1 })
        
        // Then
        XCTAssertEqual(collection, [])
    }
    
    internal func test_modifyEachSucceeds() {
        // Given
        var collection: Array<UInt> = .init(1...5)
        
        // Then
        collection.modifyEach({ $0 += 1 })
        
        // Then
        XCTAssertEqual(collection, [2, 3, 4, 5, 6])
    }
}

// MARK: - RangeReplaceableCollection

extension ArrayTests {
    internal func test_removeFirstWhereFails() {
        // Given
        var collection: Array<String> = ["h", "e", "l", "l", "o"]
        
        // Then
        collection.removeFirst(where: { $0 == "y" })
        
        // Then
        XCTAssertEqual(collection, ["h", "e", "l", "l", "o"])
    }
    
    internal func test_removeFirstWhereSucceeds() {
        // Given
        var collection: Array<String> = ["h", "e", "l", "l", "o"]
        
        // Then
        collection.removeFirst(where: { $0 == "l" })
        
        // Then
        XCTAssertEqual(collection, ["h", "e", "l", "o"])
    }
    
    internal func test_removeLastWhereFails() {
        // Given
        var collection: Array<String> = ["h", "e", "l", "l", "o"]
        
        // Then
        collection.removeLast(where: { $0 == "y" })
        
        // Then
        XCTAssertEqual(collection, ["h", "e", "l", "l", "o"])
    }
    
    internal func test_removeLastWithSucceeds() {
        // Given
        var collection: Array<String> = ["h", "e", "l", "l", "o"]
        
        // Then
        collection.removeLast(where: { $0 == "l" })
        
        // Then
        XCTAssertEqual(collection, ["h", "e", "l", "o"])
    }
    
    internal func test_removeRandomElementSucceeds() {
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

// MARK: - Sequence

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
