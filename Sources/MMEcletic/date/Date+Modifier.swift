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

    /// Add `days` to date.
    /// - Parameter days: days to add
    /// - Returns: resulting date
    func add(days: Double) -> Date {
        return self.addingTimeInterval(days * 60.0 * 60.0 * 24.0)
    }

    /// Add `hours` to date.
    /// - Parameter hours: days to add
    /// - Returns: resulting date
    func add(hours: Double) -> Date {
        return self.addingTimeInterval(hours * 60.0 * 60.0)
    }

    /// Add `minutes` to date.
    /// - Parameter minutes: days to add
    /// - Returns: resulting date
    func add(minutes: Double) -> Date {
        return self.addingTimeInterval(minutes * 60.0)
    }

    /// Add `seconds` o date.
    /// - Parameter seconds: days to add
    /// - Returns: resulting date
    func add(seconds: Double) -> Date {
        return self.addingTimeInterval(seconds)
    }

    /// Remove `days` from date.
    /// - Parameter days: days to add
    /// - Returns: resulting date
    func subtract(days: Double) -> Date {
        return self.addingTimeInterval(-(days * 60.0 * 60.0 * 24.0))
    }

    /// Remove `hours` from date.
    /// - Parameter hours: days to add
    /// - Returns: resulting date
    func subtract(hours: Double) -> Date {
        return self.addingTimeInterval(-(hours * 60.0 * 60.0))
    }

    /// Remove `minutes` from date.
    /// - Parameter minutes: days to add
    /// - Returns: resulting date
    func subtract(minutes: Double) -> Date {
        return self.addingTimeInterval(-(minutes * 60.0))
    }

    /// Remove `seconds` from date.
    /// - Parameter seconds: days to add
    /// - Returns: resulting date
    func subtract(seconds: Double) -> Date {
        return self.addingTimeInterval(-seconds)
    }

}
