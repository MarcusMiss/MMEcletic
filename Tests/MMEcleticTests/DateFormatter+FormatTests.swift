//
//  DateFormatter+FormatTests.swift
//  MMEcletic
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
