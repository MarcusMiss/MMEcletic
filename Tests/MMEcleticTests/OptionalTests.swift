//
//  OptionalTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Optional")
class OptionalTests {

    @Test("Check isPresent")
    func validateIsPresent() async throws {
        #expect(Optional<String>.none.isPresent == false)
        #expect(Optional<String>.some("Lorem").isPresent == true)
    }

}
