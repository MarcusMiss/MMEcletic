//
//  String+ToNumberTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension String (ToNumber)")
class StringToNumberTests {

    @Test("Convert to integer")
    func toInt() async throws {
        #expect("10".toInt()! == Int(10))
        #expect("".toInt().isPresent == false)
        #expect("abc".toInt().isPresent == false)
    }

    @Test("Convert to float")
    func toFloat() async throws {
        #expect("10".toFloat()! == Float(10))
        #expect("20.0".toFloat()! == Float(20))
        #expect("".toFloat().isPresent == false)
        #expect("abc".toFloat().isPresent == false)
    }

    @Test("Convert to double")
    func toDouble() async throws {
        #expect("10".toDouble()! == Double(10))
        #expect("20.0".toDouble()! == Double(20))
        #expect("".toDouble().isPresent == false)
        #expect("abc".toDouble().isPresent == false)
    }

}
