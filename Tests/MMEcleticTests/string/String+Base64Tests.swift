//
//  StringBase64Tests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Base64 (String")
class StringBase64Tests {
    
    @Test("Validate Base64-Decoding")
    func decodeFromBase64String() {
        #expect("TG9yZW1JcHN1bQ==".decodeFromBase64String() == "LoremIpsum")
        #expect("eyJmb28iOiJiYXIiLCJiYXoiOiJiYXQifQ".decodeFromBase64String().isPresent == false)
    }

    @Test("Validate Base64-Encoding")
    func encodeToBase64String() {
        #expect("LoremIpsum".encodeToBase64String() == "TG9yZW1JcHN1bQ==")
    }

}
