//
//  String+Base64.swift
//  MMEcletic
//

import Foundation

public extension String {
    
    /// Encode content of string with Base64-algorithmn.
    /// - Returns: encoded string content
    func encodeToBase64String() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    /// Encode content of string with Base64-algorithmn.
    /// - Precondition: Content of string must be Base64-encoded.
    /// - Returns: Decoded string-content
    func decodeFromBase64String() -> Optional<String> {
        guard let data = Data(base64Encoded: self) else {
            return Optional.none
        }
        return String(data: data, encoding: .utf8)
    }

}
