//
// Clampable.swift
// CollectionProtocols
//
// Copyright © 2021-2024 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing values that can be clamped.
internal protocol Clampable
where Self: Comparable {}

extension Clampable {
	/// Returns a value clamped from a specified value.
	///
	/// ```swift
	///	print(0.clamping(from: 1))
	/// // Prints "1"
	/// ```
	///
	/// - parameter minimumValue: A minimum value.
	/// - returns: The value clamped.
	internal func clamping(from minimumValue: Self) -> Self {
		return max(minimumValue, self)
	}
	
	/// Clamps this value from a specified value.
	///
	/// ```swift
	///	var value = 0
	///	value.clamp(from: 1)
	///	print(value)
	///	// Prints "1"
	///	```
	///
	/// - parameter minimumValue: A minimum value.
	/// - returns: The value clamped.
	internal mutating func clamp(from minimumValue: Self) {
		self = self.clamping(from: minimumValue)
	}
	
	/// Returns a value clamped within two specified values.
	///
	/// ```swift
	/// print(0.clamping(from: 1, through: 10))
	///	// Prints "1"
	///	```
	///
	/// - parameter minimumValue: A minimum value.
	/// - parameter maximumValue: A maximum value.
	/// - returns: The value clamped.
	/// - Warning: The minimum value must be smaller than the maximum value.
    internal func clamping(
        from minimumValue: Self,
        through maximumValue: Self
    ) -> Self {
		precondition(minimumValue < maximumValue)
		return self
            .clamping(from: minimumValue)
            .clamping(through: maximumValue)
	}
	
	/// Clamps this value within two specified values.
	///
	/// ```swift
	/// var value = 0
	/// value.clamp(from: 1, through: 10)
	/// print(value)
	/// // Prints "1"
	/// ```
	///
	/// - parameter minimumValue: A minimum value.
	/// - parameter maximumValue: A maximum value.
	/// - returns: The value clamped.
	/// - Warning: The minimum value must be smaller than the maximum value.
    internal mutating func clamp(
        from minimumValue: Self,
        through maximumValue: Self
    ) {
        self = self.clamping(
            from: minimumValue,
            through: maximumValue
        )
	}
	
	/// Returns a value clamped to a maximum specified value.
	///
	/// ```swift
	/// print(11.clamping(through: 10))
	/// // Prints "10"
	/// ```
	///
	/// - parameter maximumValue: A maximum value.
	/// - returns: The value clamped.
	internal func clamping(through maximumValue: Self) -> Self {
		return min(self, maximumValue)
	}
	
	/// Clamps this value to a maximum specified value.
	///
	/// ```swift
	/// var value = 11
	/// value.clamp(through: 10)
	/// print(value)
	/// // Prints "10"
	/// ```
	///
	/// - parameter maximumValue: A maximum value.
	/// - returns: The value clamped.
	internal mutating func clamp(through maximumValue: Self) {
		self = self.clamping(through: maximumValue)
	}
	
	/// Returns a value clamped to a specified closed range.
	///
	/// ```swift
	/// print(0.clamping(to: 1...10))
	///	// Prints "1"
	///	```
	///
	/// - parameter closedRange: An interval from a lower bound up to, and including, an upper bound.
	/// - returns: The value clamped.
	internal func clamping(to closedRange: ClosedRange<Self>) -> Self {
        return self.clamping(
            from: closedRange.lowerBound,
            through: closedRange.upperBound
        )
	}

	/// Returns a value clamped to a specified closed range.
	///
	/// ```swift
	///	var value = 0
	/// value.clamp(to: 1...10)
	/// print(value)
	/// // Prints "1"
	/// ```
	///
	/// - parameter closedRange: An interval from a lower bound up to, and including, an upper bound.
	/// - returns: The value clamped.
	internal mutating func clamp(to closedRange: ClosedRange<Self>) {
		self = self.clamping(to: closedRange)
	}
	
	/// Returns a value clamped to a specified partial range.
	///
	/// ```swift
	/// print(0.clamping(from: 1...))
	///	// Prints "1"
	///	```
	///
	/// - parameter partialRange: An open interval from a lower bound.
	/// - returns: The value clamped.
	internal func clamping(from partialRange: PartialRangeFrom<Self>) -> Self {
		return self.clamping(from: partialRange.lowerBound)
	}
	
	/// Returns a value clamped to a specified partial range.
	///
	/// ```swift
	///	var value = 0
	/// value.clamp(from: 1...)
	/// print(value)
	/// // Prints "1"
	/// ```
	///
	/// - parameter partialRange: An open interval from a lower bound.
	/// - returns: The value clamped.
	internal mutating func clamp(from partialRange: PartialRangeFrom<Self>) {
		self = self.clamping(from: partialRange)
	}
	
	/// Returns a value clamped to a specified partial range.
	///
	/// ```swift
	/// print(11.clamping(through: ...10))
	///	// Prints "10"
	///	```
	///
	/// - parameter partialRange: An open interval to an upper bound.
	/// - returns: The value clamped.
	internal func clamping(through partialRange: PartialRangeThrough<Self>) -> Self {
		return self.clamping(through: partialRange.upperBound)
	}
	
	/// Returns a value clamped to a specified partial range.
	///
	/// ```swift
	///	var value = 11
	/// value.clamp(through: ...10)
	/// print(value)
	/// // Prints "10"
	/// ```
	///
	/// - parameter partialRange: An open interval to an upper bound.
	/// - returns: The value clamped.
	internal mutating func clamp(through partialRange: PartialRangeThrough<Self>) {
		self = self.clamping(through: partialRange)
	}
}
