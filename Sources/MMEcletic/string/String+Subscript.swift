//
//  String+Subscript.swift
//  MMEcletic
//

import Foundation

public extension String {

    /// Return character from given position.
    /// - Parameter offset: position of character within string
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }

    /// Return substring excluding upper bounds of range.
    /// - Parameter range: range of substring to return
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }

    /// Return substring including upper bounds of range.
    /// - Parameter range: range of substring to return
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }

}
