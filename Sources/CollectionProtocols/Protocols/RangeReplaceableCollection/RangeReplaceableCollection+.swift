//
// RangeReplaceableCollection+.swift
// CollectionProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension RangeReplaceableCollection {
	/// Removes and returns the first element in this collection that satisfies the given predicate.
	///
	/// ```swift
	/// var collection: Array<String> =  ["h", "e", "l", "l", "o"]
	/// collection.removeFirst(where: { $0 == "l" })
	/// print(collection)
	/// // Prints "["h", "e", "l", "o"]"
	/// ```
	///
	/// - parameter predicate: A closure that takes an element as its argument and returns a boolean value that indicates whether the passed element represents a match.
	/// - throws: Rethrows a thrown error.
	/// - returns: A collection with an element removed.
	@discardableResult
	public mutating func removeFirst(where predicate: (Self.Element) throws -> Bool)
	rethrows -> Self.Element? {
		guard let index: Self.Index = try self.firstIndex(where: { (element) in
			try predicate(element) == true
		}) else {
			return nil
		}
		
		return self.remove(at: index)
	}
	
	/// Removes and returns the last element in this collection that satisfies the given predicate.
	///
	/// ```swift
	/// var collection: Array<String> =  ["h", "e", "l", "l", "o"]
	/// collection.removeLast(where: { $0 == "l" })
	/// print(collection)
	/// // Prints "["h", "e", "l", "o"]"
	/// ```
	///
	/// - parameter predicate: A closure that takes an element as its argument and returns a boolean value that indicates whether the passed element represents a match.
	/// - throws: Rethrows a thrown error.
	/// - returns: A collection with an element removed.
	@discardableResult
	public mutating func removeLast(where predicate: (Self.Element) throws -> Bool)
	rethrows -> Self.Element?
	where Self: BidirectionalCollection {
		guard let index: Self.Index = try self.lastIndex(where: { (element) in
			try predicate(element) == true
		}) else {
			return nil
		}
		
		return self.remove(at: index)
	}
	
	/// Removes and returns a random element from this collection.
	///
	/// ```swift
	/// var collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// collection.removeRandomElement()
	/// ```
	///
	/// - returns: A collection with a random element removed.
	@discardableResult
	public mutating func removeRandomElement() -> Self.Element? {
		guard let randomIndex = self.indices.randomElement() else {
			return nil
		}
		
		return self.remove(at: randomIndex)
	}
}
