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

    @Test("Validate trimPrefix()")
    func validateTrimOfPrefix() async throws {
        #expect("".trimPrefix("") == "")
        #expect("Lorem".trimPrefix("murks") == "Lorem")
        #expect("Lorem".trimPrefix("L") == "orem")
        #expect("Lorem".trimPrefix("Lo") == "rem")
        #expect("Lorem".trimPrefix("Lor") == "em")
        #expect("Lorem".trimPrefix("Lore") == "m")
        #expect("Lorem".trimPrefix("Lorem") == "")
    }

    @Test("Validate trimPostfix()")
    func validateTrimOfPostfix() async throws {
        #expect("".trimPostfix("") == "")
        #expect("Lorem".trimPostfix("murks") == "Lorem")
        #expect("Lorem".trimPostfix("orem") == "L")
        #expect("Lorem".trimPostfix("rem") == "Lo")
        #expect("Lorem".trimPostfix("em") == "Lor")
        #expect("Lorem".trimPostfix("m") == "Lore")
        #expect("Lorem".trimPostfix("") == "Lorem")
    }

}
