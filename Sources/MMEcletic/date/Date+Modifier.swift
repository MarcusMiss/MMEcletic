//
//  Date+Modifier.swift
//  MMEcletic
//

import Foundation

public extension Date {
    
    /// Creates a `Date`.
    /// - Parameters:
    ///   - year: year
    ///   - month: month
    ///   - day: day
    /// - Returns: new `Date`
    static func create(year: Int, month: Int, day: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return Calendar.current.date(from: dateComponents)!
    }
    
    /// Creates a `Date`.
    /// - Parameters:
    ///   - year: year
    ///   - month: month
    ///   - day: day
    ///   - hour: hour
    ///   - minute: minute
    ///   - second: second
    /// - Returns: new `Date`
    static func create(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        return Calendar.current.date(from: dateComponents)!
    }

    /// Add `years` to date.
    /// - Parameter years: years years to add
    /// - Returns: resulting date
    func add(years: Int) -> Date {
        let iso = Calendar(identifier: .iso8601)
        return iso.date(byAdding: DateComponents(year: years), to: self)!
    }

    /// Add `months` to date.
    /// - Parameter months: months to add
    /// - Returns: resulting date
    func add(months: Int) -> Date {
        let iso = Calendar(identifier: .iso8601)
        return iso.date(byAdding: DateComponents(month: months), to: self)!
    }

    /// Add `days` to date.
    /// - Parameter days: days to add
    /// - Returns: resulting date
    func add(days: Int) -> Date {
        let iso = Calendar(identifier: .iso8601)
        return iso.date(byAdding: DateComponents(day: days), to: self)!
    }

    /// Add `hours` to date.
    /// - Parameter hours: days to add
    /// - Returns: resulting date
    func add(hours: TimeInterval) -> Date {
        return self.addingTimeInterval(hours * 60.0 * 60.0)
    }

    /// Add `minutes` to date.
    /// - Parameter minutes: days to add
    /// - Returns: resulting date
    func add(minutes: TimeInterval) -> Date {
        return self.addingTimeInterval(minutes * 60.0)
    }

    /// Add `seconds` o date.
    /// - Parameter seconds: days to add
    /// - Returns: resulting date
    func add(seconds: TimeInterval) -> Date {
        return self.addingTimeInterval(seconds)
    }

    /// Remove `years` from date.
    /// - Parameter years: years years to remove
    /// - Returns: resulting date
    func subtract(years: Int) -> Date {
        let iso = Calendar(identifier: .iso8601)
        return iso.date(byAdding: DateComponents(year: -years), to: self)!
    }

    /// Remove `months` to date.
    /// - Parameter months: months to remove
    /// - Returns: resulting date
    func subtract(months: Int) -> Date {
        let iso = Calendar(identifier: .iso8601)
        return iso.date(byAdding: DateComponents(month: -months), to: self)!
    }

    /// Remove `days` from date.
    /// - Parameter days: days to remove
    /// - Returns: resulting date
    func subtract(days: Int) -> Date {
        let iso = Calendar(identifier: .iso8601)
        return iso.date(byAdding: DateComponents(day: -days), to: self)!
    }

    /// Remove `hours` from date.
    /// - Parameter hours: days to remove
    /// - Returns: resulting date
    func subtract(hours: TimeInterval) -> Date {
        return self.addingTimeInterval(-(hours * 60.0 * 60.0))
    }

    /// Remove `minutes` from date.
    /// - Parameter minutes: days to remove
    /// - Returns: resulting date
    func subtract(minutes: TimeInterval) -> Date {
        return self.addingTimeInterval(-(minutes * 60.0))
    }

    /// Remove `seconds` from date.
    /// - Parameter seconds: days to remove
    /// - Returns: resulting date
    func subtract(seconds: TimeInterval) -> Date {
        return self.addingTimeInterval(-seconds)
    }

}
