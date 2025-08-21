//
//  Float+Converter.swift
//  MMEcletic
//

import Foundation

public extension Float {

    /// Convert Float to Decimal.
    /// - Returns: Decimal-value
    func toDecimal() -> Decimal {
        return Decimal(string: String(self)) ?? Decimal.nan
    }

}
