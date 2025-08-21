//
//  Double+ConverterTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Double")
class DoubleTests {

    @Test("Check toDecimal()")
    func toDecimal() async throws {
        #expect(Double(100).toDecimal() == Decimal(100))
        #expect(Double(100.123).toDecimal() == Decimal(100.123))
        #expect(Double.nan.toDecimal() == Decimal.nan)
    }

}
