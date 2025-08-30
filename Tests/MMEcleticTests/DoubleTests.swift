//
//  DoubleTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Double")
class DoubleTests {

    @Test("Check signum")
    func signum() async throws {
        #expect(Double(3.0).signum == 1.0)
        #expect(Double(0.0).signum == 0.0)
        #expect(Double(-3.0).signum == -1.0)
    }

}
