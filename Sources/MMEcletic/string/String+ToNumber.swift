//
//  String+ToNumber.swift
//  MMEcletic
//

import Foundation

public extension String {

    /// Convert String to Float-value
    /// -Returns: value or nil
    func toFloat() -> Optional<Float> {
        if let floatValue = Float(self) {
            return floatValue
        }
        return Optional<Float>.none
    }

    /// Convert String to Double-value
    /// -Returns: value or nil
    func toDouble() -> Optional<Double> {
        if let doubleValue = Double(self) {
            return doubleValue
        }
        return Optional<Double>.none
    }

    /// Convert String to Int-value
    /// -Returns: value or nil
    func toInt() -> Optional<Int> {
        if let intValue = Int(self) {
            return intValue
        }
        return Optional<Int>.none
    }

}
