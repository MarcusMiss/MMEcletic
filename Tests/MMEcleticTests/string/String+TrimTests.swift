//
//  MMString+TrimTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension String (Trim)")
class StringTrimExtensionTests {

    @Test("Validate trim(), trimLeft(), trimRight()")
    func validateTrimming() async throws {
        #expect("".trim() == "")
        #expect("  Lorem  ".trim() == "Lorem")
        #expect("  Lorem  ".trimLeft() == "Lorem  ")
        #expect("  Lorem  ".trimRight() == "  Lorem")
    }

}
