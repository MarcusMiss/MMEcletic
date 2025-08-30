//
//  Decimal+ConverterTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Decimal")
class DecimalConverterTests {

    @Test("Check toInt()")
    func toInt() async throws {
        #expect(Decimal(100).toInt() == Int(100))
        #expect(Decimal(100.123).toInt() == Int(100))
    }

    @Test("Check toDouble()")
    func toDouble() async throws {
        #expect(Decimal(100).toDouble() == Double(100))
        #expect(Decimal(100.1).toDouble() == Double(100.1))
    }

    @Test("Check toFloat()")
    func toFloat() async throws {
        #expect(Decimal(100).toFloat() == Float(100))
        #expect(Decimal(100.1).toFloat() == Float(100.1))
    }

}
