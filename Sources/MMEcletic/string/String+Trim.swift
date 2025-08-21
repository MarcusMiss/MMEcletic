//
//  String+Trim.swift
//  MMEcletic
//

import Foundation

public extension String {
    
    /// Remove all whitespaces from beginning and end of string.
    ///
    /// - Returns: trimmed string
    func trim() -> String {
        return trimLeft().trimRight()
    }
    
    /// Remove all whitespaces from beginning of string.
    ///
    /// - Returns: left trimmed string
    func trimLeft() -> String {
        return trimWithOptions(options: [.anchored])
    }
    
    /// Remove all whitesapces from end of string.
    ///
    /// - Returns: right trimmed string
    func trimRight() -> String {
        return trimWithOptions(options: [.anchored, .backwards])
    }

    private func trimWithOptions(options: NSString.CompareOptions = []) -> String {
        var remainExpression: String = String(self)
        while let trailingRange = remainExpression.rangeOfCharacter(
            from: .whitespacesAndNewlines,
            options: options) {
                remainExpression.removeSubrange(trailingRange)
            }
        return remainExpression
    }

}
