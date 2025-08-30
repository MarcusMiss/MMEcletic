//
//  FloatTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Float")
class FloatTests {

    @Test("Check signum")
    func signum() async throws {
        #expect(Float(3.0).signum == 1.0)
        #expect(Float(0.0).signum == 0.0)
        #expect(Float(-3.0).signum == -1.0)
    }

}
