//
//  String+PaddingTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension String (Padding)")
class StringPaddingExtensionTests {

    @Test("Validate padLeft()")
    func padLeft() async throws {
        #expect(("Lorem".padLeft(10) == "     Lorem") == true)
        #expect(("Lorem".padLeft(10, withPad: "*") == "*****Lorem") == true)
        #expect(("Lorem".padLeft(5, withPad: "*") == "Lorem") == true)
        #expect(("LoremIpsum".padLeft(5, withPad: "*") == "LoremIpsum") == true)
    }

    @Test("Validate padRight()")
    func padRight() async throws {
        #expect(("Lorem".padRight(10) == "Lorem     ") == true)
        #expect(("Lorem".padRight(10, withPad: "*") == "Lorem*****") == true)
        #expect(("Lorem".padRight(5, withPad: "*") == "Lorem") == true)
        #expect(("LoremIpsum".padRight(5, withPad: "*") == "LoremIpsum") == true)
    }

}
