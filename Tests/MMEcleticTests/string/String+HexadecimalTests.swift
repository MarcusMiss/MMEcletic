//
//  String+HexadecimalTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension String (Hexadecimal)")
class StringHexadecimalTests {
    
    @Test("String isHexadecimal")
    func isHexadecimal() async throws {
        #expect("".isHexadecimal() == false)
        #expect("0".isHexadecimal() == false)
        #expect("A".isHexadecimal() == false)
        
        #expect("0x0000".isHexadecimal() == true)
        #expect("0x0100".isHexadecimal() == true)
        #expect("0xCafeBabe".isHexadecimal() == true)
        #expect("0x12345678ABCD".isHexadecimal() == true)
    }

    @Test("display namefromHexadecimal")
    func fromHexadecimal() {
        #expect("FOO".fromHexadecimal().isPresent == false)
        #expect("0x0".fromHexadecimal() == Decimal(0))
        #expect("0x0000".fromHexadecimal() == Decimal(0))
        #expect("0x0100".fromHexadecimal() == Decimal(256))
        #expect("0XFFFF".fromHexadecimal() == Decimal(65535))
        #expect("0xCafeBabe".fromHexadecimal() == Decimal(3405691582))
    }

}
