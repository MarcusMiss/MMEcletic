//
//  String+SubscriptTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension String (Subscript)")
class StringSubscriptTests {

    @Test("String subscript[index]")
    func subscriptOffset() async throws {
        #expect("Hello"[1] == "e")
    }

    @Test("String subscript[range]")
    func subscriptRange() async throws {
        #expect("Hello"[0..<2] == "He")
        #expect("Hello"[0..<5] == "Hello")
    }

    @Test("String subscript[closed range]")
    func subscriptClosedRange() async throws {
        #expect("Hello"[0...2] == "Hel")
        #expect("Hello"[0...4] == "Hello")
    }

}
