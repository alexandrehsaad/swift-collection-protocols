// MutableCollection+.swift
// CollectionProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
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
	public mutating func replace(where predicate: (Self.Element) -> Bool, with newElement: Self.Element) {
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
		guard let index: Self.Index = self.firstIndex as? Self.Index else {
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
		guard let index: Self.Index = self.lastIndex as? Self.Index else {
			return
		}
		
		self[index] = newElement
	}
}
