//
//  BoolTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Bool")
class BoolTests {

    @Test("Check XOR-operator")
    func validateXOR() async throws {
        #expect(true  ^ false == true)
        #expect(false  ^ true == true)
        #expect(false  ^ false == false)
        #expect(true  ^ true == false)
    }

}
