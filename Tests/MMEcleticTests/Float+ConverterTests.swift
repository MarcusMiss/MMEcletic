//
//  Float+ConverterTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Float")
class FloatConverterTests {

    @Test("Check toDecimal()")
    func toDecimal() async throws {
        #expect(Float(100).toDecimal() == Decimal(100))
        #expect(Float(100.123).toDecimal() == Decimal(100.123))
        #expect(Float.nan.toDecimal() == Decimal.nan)
    }

}
