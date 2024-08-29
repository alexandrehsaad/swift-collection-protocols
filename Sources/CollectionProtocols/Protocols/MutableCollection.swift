//
// MutableCollection.swift
// CollectionProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension MutableCollection {
	/// Replaces the elements of this collection that satisfies the given predicate.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 0, 40, 50]
	/// collection.replace(where: { $0 == 0 }, with: 30)
	/// print(collection)
	/// // Prints "[10, 20, 30, 40, 50]"
	/// ```
	///
	/// - parameter predicate: A closure that takes an element as its argument and returns a boolean value that indicates whether the passed element satisfies the given predicate.
	/// - parameter newElement: The new element to add to the collection.
	public mutating func replace(
		where predicate: (Self.Element) -> Bool,
		with newElement: Self.Element
	) {
		for index in self.indices {
			if predicate(self[index]) == true {
				self[index] = newElement
			}
		}
	}
	
	/// Replaces the first element in this collection with the specified replacement.
	/// If the collection is empty, the element won't be replaced.
	///
	/// ```swift
	/// var collection: Array<UInt> = [0, 20, 30, 40, 50]
	/// collection.replaceLast(with: 10)
	///
	/// print(collection)
	/// // Prints "[10, 20, 30, 40, 50]"
	/// ```
	///
	/// - parameter newElement: The element to place.
	public mutating func replaceFirst(with newElement: Self.Element) {
		guard let index: Self.Index = self.firstIndex else {
			return
		}
		
		self[index] = newElement
	}
	
	/// Replaces the last element in this collection with the specified replacement.
	/// If the collection is empty, the element won't be replaced.
	///
	/// ```swift
	/// var collection: Array<UInt> = [10, 20, 30, 40, 0]
	/// collection.replaceLast(with: 50)
	///
	/// print(collection)
	/// // Prints "[10, 20, 30, 40, 50]"
	/// ```
	///
	/// - parameter newElement: The element to place.
	public mutating func replaceLast(with newElement: Self.Element)
	where Self: BidirectionalCollection {
		guard let index: Self.Index = self.lastIndex else {
			return
		}
		
		self[index] = newElement
	}
	
	/// Modifies the given closure on each element in the sequence in the same order as a `for inout`-`in` loop.
	///
	/// ```swift
	/// var collection: Array<UInt> = .init(1...5)
	/// collection.modifyEach({ $0 += 1 })
	///
	/// print(collection)
	/// // Prints "[2, 3, 4, 5, 6]"
	/// ```
	///
	/// Using the `modifyEach` method is distinct from a `for`-`in` loop in two important ways:
	///
	/// 1. You cannot use a `break` or `continue` statement to exit the current call of the `body` closure or skip subsequent calls.
	/// 2. Using the `return` statement in the `body` closure will exit only from the current call to `body`, not from any outer scope, and won't skip subsequent calls.
	///
	/// - Parameter body: A closure that takes a modifiable element of the sequence as a parameter.
	public mutating func modifyEach(
		_ body: (inout Self.Element) throws -> Void
	) rethrows {
		var index: Self.Index = self.startIndex
		while index != self.endIndex {
			try body(&self[index])
			self.formIndex(after: &index)
		}
	}
}
