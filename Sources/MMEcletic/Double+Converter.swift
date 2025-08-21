//
//  Double+Converter.swift
//  MMEcletic
//

import Foundation

public extension Double {

    /// Convert Double to Decimal.
    /// - Returns: Decimal-value
    func toDecimal() -> Decimal {
        return Decimal(string: String(self)) ?? Decimal.nan
    }

}
