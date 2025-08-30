//
//  String.swift
//  MMEcletic
//

import Foundation

public extension String {
    
    /// Replace first occurence in string.
    /// - Parameters:
    ///   - pattern: text to find
    ///   - replacement: replacement text
    /// - Returns: text with replacement
    func replaceFirst(_ pattern: String, _ replacement: String) -> String {
        if let range = self.range(of: pattern) {
            return self.replacingCharacters(in: range, with: replacement)
        }
        return self
    }

}
