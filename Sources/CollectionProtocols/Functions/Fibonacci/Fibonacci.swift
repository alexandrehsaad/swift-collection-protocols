// Fibonacci.swift
// CollectionProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// Returns the fibonnaci sequence with the specified length.
///
/// ```swift
/// print(fibonacci(10))
/// // Prints "[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]"
/// ```
///
/// - parameter length: The length of the sequence.
/// - returns: The fibonacci sequence.
public func fibonacci<Value>(_ length: Array.Index) -> Array<Value>
where Value: Comparable & Numeric & Strideable, Value.Stride: SignedInteger {
	guard length > 1 else {
		return [.zero]
	}
	
	var sequence: Array<Value> = [0, 1]

	for _ in 2..<length {
		if let lhs: Value = sequence.secondLast,
		   let rhs: Value = sequence.last {
			sequence.append(lhs + rhs)
		}
	}
	
	return sequence
}
