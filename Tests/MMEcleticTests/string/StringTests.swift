//
//  StringTests.swift
//  MMEcletic
//


import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension String")
class StringTests {

    @Test("Validate replaceFirst()")
    func replaceFirst() async throws {
        #expect(("Hello World".replaceFirst("o", "X") == "HellX World") == true)
        #expect(("Hello World".replaceFirst("x", "X") == "Hello World") == true)
    }

}
