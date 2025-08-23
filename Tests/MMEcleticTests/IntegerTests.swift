//
//  IntegerTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Integer")
class IntegerTests {

    @Test("Check isZero")
    func validateIsZero() async throws {
        #expect(Int(0).isZero == true)
        #expect(Int(10).isZero == false)
    }

}
