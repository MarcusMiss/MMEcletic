//
//  String+Hexadecimal.swift
//  MMEcletic
//

import Foundation

public extension String {

    /// Conversion-table
    private static let hexToDecimalConversionTable : [Character: Int] = [
        "0": 0, "1": 1, "2": 2, "3": 3,
        "4": 4, "5": 5, "6": 6, "7": 7,
        "8": 8, "9": 9, "A": 10, "B": 11,
        "C": 12, "D": 13, "E": 14, "F": 15
    ]

    /// Check if content of this string is a hexadecimal number (0x/0X-prefix)
    /// - Returns: true if hexadecimal number
    func isHexadecimal() -> Bool {
        if let _ = try? /0[xX][0-9a-fA-F]+/.wholeMatch(in: self) {
            return true
        }
        return false
    }

    /// If String contains a hexdecimal number it will be converted to Decimal.
    /// - Returns: converted number
    func fromHexadecimal() -> Optional<Decimal> {
        if !self.isHexadecimal() {
            return Optional.none
        }
        var resultDecimal: Decimal = Decimal()
        var hexString: String = self.dropFirst(2).uppercased()
        hexString = String(hexString.replacingOccurrences(of: "0", with: "", options: .anchored).reversed())
        if !hexString.isEmpty {
            for (index, symbol) in hexString.enumerated() {
                let intValue: Int? = String.hexToDecimalConversionTable[symbol]
                resultDecimal += Decimal(intValue!) * pow(16, index)
                continue
            }
        }
        return resultDecimal
    }

}
