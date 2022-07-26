// Collection+.swift
// CollectionProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Collection {
	
	// MARK: - Inspecting Indexes
	
	/// The position of the first element in this collection.
	/// If the collection doesn't contain an element, the value of this property is nil.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// print(collection.firstIndex)
	/// // Prints "0"
	/// ```
	public var firstIndex: Int? {
		guard self.isEmpty == false else {
			return nil
		}
		
		return .zero
	}
	
	/// The position of the second element in this collection.
	/// If the collection doesn't contain two elements, the value of this property is nil.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// print(collection.secondIndex)
	/// // Prints "1"
	/// ```
	private var secondIndex: Int? {
		return self.indices.index(self.startIndex, offsetBy: 1, limitedBy: self.endIndex) as? Int
	}
	
	/// The position of the third element in this collection.
	/// If the collection doesn't contain three elements, the value of this property is nil.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// print(collection.thirdIndex)
	/// // Prints "2"
	/// ```
	private var thirdIndex: Int? {
		return self.indices.index(self.startIndex, offsetBy: 2, limitedBy: self.endIndex) as? Int
	}
	
	/// Returns an array containing, in order, the elements in this collection that satisfy the given predicate.
	///
	/// ```swift
	/// let collection: Array<String> = ["h", "e", "l", "l", "o"]
	/// print(collection.indices(where: { $0 == "l" })
	/// // Prints "[2, 3]"
	/// ```
	///
	/// - parameter condition: The condition to evaluate each element against.
	/// - throws: Rethrows a thrown error.
	/// - returns: A collection of all indices where the specified condition evaluates to true.
	public func indices(where condition: (Self.Element) throws -> Bool)
	rethrows -> Array<Self.Index> {
		return try self.indices.filter({ (index) in
			try condition(self[index])
		})
	}
	
	// MARK: - Inspecting Elements
	
	/// The second element of this collection.
	/// If the collection doesn't contain two indices, the value of this property is nil.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// print(collection.second)
	/// // Prints "20"
	/// ```
	@available(swift, deprecated: 5.5)
	public var second: Self.Element? {
		guard let index: Self.Index = self.secondIndex as? Self.Index else {
			return nil
		}
		
		return self[index]

	}

	/// The third element of this collection.
	/// If the collection doesn't contain three indices, the value of this property is nil.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// print(collection.third)
	/// // Prints "30"
	/// ```
	@available(swift, deprecated: 5.5)
	public var third: Self.Element? {
		guard let index: Self.Index = self.thirdIndex as? Self.Index else {
			return nil
		}
		
		return self[index]
	}
	
	/// Returns the element after the specified element in this collection.
	///
	/// ```swift
	/// let collection: Array<UInt> = [10, 20, 30, 40, 50]
	/// print(collection.after(10))
	/// // Prints "20"
	/// ```
	///
	/// - returns: The next element.
	public func after(_ element: Self.Element) -> Self.Element?
	where Self.Element: Equatable {
		guard let index = self.firstIndex(of: element) else {
			return nil
		}
		
		let nextIndex: Self.Index = self.index(after: index)
		
		guard nextIndex < self.endIndex else {
			return nil
		}
		
		return self[nextIndex]
	}
}


extension Collection
where Self.Element: Equatable {
	
	// MARK: -
	
	/// Returns a boolean value indicating whether the elements of this sequence are equal.
	///
	/// - returns: A boolean indicating whether all the elements are equal.
	public var areEqual: Bool {
		return self.dropFirst().allSatisfy({ (element) in
			self.first == element
		})
	}
}
