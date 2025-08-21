//
//  String+ComponentsTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Components")
class StringComponentsTests {
    
    @Test("Validate noneEmptyComponents()")
    func noneEmptyComponents() {
        #expect("1,,2, ,3,".noneEmptyComponents(separatedBy: ",").count == 3)
        #expect(",,".noneEmptyComponents(separatedBy: ",").count == 0)
        #expect("".noneEmptyComponents(separatedBy: ",").count == 0)
    }

}
