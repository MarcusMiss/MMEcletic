//
//  String+Components.swift
//  MMEcletic
//

import Foundation

public extension String {
    
    /// Returns all non-empty string-components.
    /// - Parameter separatedBy: separator symbol
    /// - Returns: all collected string-cmponents
    func noneEmptyComponents(separatedBy: String) -> [String] {
        return self.components(separatedBy: separatedBy).filter {
            let trimCompnent = $0.trim()
            return !trimCompnent.isEmpty
        }
    }

}

