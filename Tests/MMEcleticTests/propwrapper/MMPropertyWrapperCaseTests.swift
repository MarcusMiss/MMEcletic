//
//  MMPropertyWrapperCaseTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("MMPropertyWrapper Case")
class MMPropertyWrapperCaseTests {

    struct FakeData {
        @Case(caseSetting: .uppercase) var upper;
        @Case(caseSetting: .lowercase) var lower;
        @Case(caseSetting: .capitalize) var capital;
        @Case(caseSetting: .none) var none;
    }

    @Test("Check all cases")
    func allCases() async throws {
        var data: FakeData = FakeData()
        data.upper = "LoreM IpSum"
        data.lower = "LoreM IpSum"
        data.capital = "loreM IpSum"
        data.none = "LoreM IpSum"

        #expect(data.upper == "LOREM IPSUM")
        #expect(data.lower == "lorem ipsum")
        #expect(data.capital == "Lorem Ipsum")
        #expect(data.none == "LoreM IpSum")
    }

}
