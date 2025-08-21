//
//  MMPropertyWrapperTrimmingTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("PropertyWrapper Trimming")
class MMPropertyWrapperTrimmingTests {

    struct FakeData {
        @Trimming(trimSetting: .all) var all;
        @Trimming(trimSetting: .left) var left;
        @Trimming(trimSetting: .right) var right;
        @Trimming(trimSetting: .none) var none;
    }

    @Test("Check all trimmings")
    func allTrimmings() async throws {
        var data: FakeData = FakeData()
        data.all = "  Lorem  "
        data.left = "  Lorem  "
        data.right = "  Lorem  "
        data.none = "  Lorem  "

        #expect(data.all == "Lorem")
        #expect(data.left == "Lorem  ")
        #expect(data.right == "  Lorem")
        #expect(data.none == "  Lorem  ")
    }

}
