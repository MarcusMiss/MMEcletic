//
//  DecimalTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Decimal")
class DecimalTests {

    @Test("Check signum")
    func signum() async throws {
        #expect(Decimal(3.0).signum == 1.0)
        #expect(Decimal(0.0).signum == 0.0)
        #expect(Decimal(-3.0).signum == -1.0)
    }

}
