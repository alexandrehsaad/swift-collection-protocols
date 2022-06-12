// Randomizable.swift
// CollectionProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Representing instances that can be initiated with random values.
public protocol Randomizable
where Self: Strideable {
    /// Returns a random instance within the specified closed range.
    ///
    /// - parameter range: The range in which to create a random value.
    /// - returns: A random instance within the bounds of the range.
    static func random(in range: ClosedRange<Self>) -> Self
}

extension Randomizable {
	
	// MARK: - Generating Values
	
    /// Returns a random instance within the specified range.
    ///
    /// - parameter range: The range in which to create a random value.
    /// - returns: A random instance within the bounds of the range.
    public static func random(in range: Range<Self>) -> Self {
        let newRange: ClosedRange<Self> = range.lowerBound...range.upperBound
        return self.random(in: newRange)
    }
}
