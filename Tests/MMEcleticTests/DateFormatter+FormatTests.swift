//
//  DateFormatter+FormatTests.swift
//  MMEcletic
//
//  Created by Marcus on 23.08.25.
//


import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension DateFormatter")
class DateFormatterTests {

    @Test("Check Formats")
    func validateFormats() async throws {
        #expect(DateFormatter.standardDateFormatPattern == "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }

}
