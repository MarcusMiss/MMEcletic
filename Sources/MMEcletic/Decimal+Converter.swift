//
//  Decimal+Converter.swift
//  MMEcletic
//

import Foundation

public extension Decimal {

    /// Convert Decimal to Int.
    /// - Returns: Int-value
    func toInt() -> Int {
        return NSDecimalNumber(decimal: self).intValue
    }

    /// Convert Decimal to Double.
    /// - Returns: Double-value
    func toDouble() -> Double {
        return (self as NSDecimalNumber).doubleValue
    }

    /// Convert Decimal to Float.
    /// - Returns: Float-value
    func toFloat() -> Float {
        return (self as NSDecimalNumber).floatValue
    }

}
