//
//  Date+ModifierTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension DateModifier")
class DateModifierTests {

    @Test("Check create()")
    func create() async throws {
        let df: DateFormatter = DateFormatter()
        df.dateFormat = DateFormatter.standardDateFormatPattern

        let d1: Date = Date.create(year: 2025, month: 09, day: 05)
        print("d1: \(df.string(from: d1))")
        #expect((df.string(from: d1).hasPrefix("2025-09-05T00:00:00.000+")) == true)

        let d2: Date = Date.create(year: 2025, month: 09, day: 05, hour:9, minute: 36, second: 12)
        print("d2: \(df.string(from: d2))")
        #expect((df.string(from: d2).hasPrefix("2025-09-05T09:36:12.000+")) == true)
    }

    @Test("Check add()")
    func add() async throws {
        let df: DateFormatter = DateFormatter()
        df.dateFormat = DateFormatter.standardDateFormatPattern
        let d0: Date = Date.create(year: 2025, month: 09, day: 05, hour:12, minute: 0, second: 0)
        print("d0: \(df.string(from: d0))")
        // days
        let d1: Date = d0.add(days: 1)
        print("d1: \(df.string(from: d1))")
        #expect((df.string(from: d1).hasPrefix("2025-09-06T12:00:00.000+")) == true)
        // hours
        let d2: Date = d0.add(hours: 1)
        print("d2: \(df.string(from: d2))")
        #expect((df.string(from: d2).hasPrefix("2025-09-05T13:00:00.000+")) == true)
        // minutes
        let d3: Date = d0.add(minutes: 1)
        print("d3: \(df.string(from: d3))")
        #expect((df.string(from: d3).hasPrefix("2025-09-05T12:01:00.000+")) == true)
        // seconds
        let d4: Date = d0.add(seconds: 1)
        print("d4: \(df.string(from: d4))")
        #expect((df.string(from: d4).hasPrefix("2025-09-05T12:00:01.000+")) == true)
        // years
        let d5: Date = d0.add(years: 1)
        print("d5: \(df.string(from: d5))")
        #expect((df.string(from: d5).hasPrefix("2026-09-05T12:00:00.000+")) == true)
        // months
        let d6: Date = d0.add(months: 1)
        print("d6: \(df.string(from: d6))")
        #expect((df.string(from: d6).hasPrefix("2025-10-05T12:00:00.000+")) == true)
    }

    @Test("Check add()")
    func subtract() async throws {
        let df: DateFormatter = DateFormatter()
        df.dateFormat = DateFormatter.standardDateFormatPattern
        let d0: Date = Date.create(year: 2025, month: 09, day: 05, hour:12, minute: 0, second: 0)
        print("d0: \(df.string(from: d0))")
        // days
        let d1: Date = d0.subtract(days: 1)
        print("d1: \(df.string(from: d1))")
        #expect((df.string(from: d1).hasPrefix("2025-09-04T12:00:00.000+")) == true)
        // hours
        let d2: Date = d0.subtract(hours: 1)
        print("d2: \(df.string(from: d2))")
        #expect((df.string(from: d2).hasPrefix("2025-09-05T11:00:00.000+")) == true)
        // minutes
        let d3: Date = d0.subtract(minutes: 1)
        print("d3: \(df.string(from: d3))")
        #expect((df.string(from: d3).hasPrefix("2025-09-05T11:59:00.000+")) == true)
        // seconds
        let d4: Date = d0.subtract(seconds: 1)
        print("d4: \(df.string(from: d4))")
        #expect((df.string(from: d4).hasPrefix("2025-09-05T11:59:59.000+")) == true)
        // years
        let d5: Date = d0.subtract(years: 1)
        print("d5: \(df.string(from: d5))")
        #expect((df.string(from: d5).hasPrefix("2024-09-05T12:00:00.000+")) == true)
        // months
        let d6: Date = d0.subtract(months: 1)
        print("d6: \(df.string(from: d6))")
        #expect((df.string(from: d6).hasPrefix("2025-08-05T12:00:00.000+")) == true)
    }

}
