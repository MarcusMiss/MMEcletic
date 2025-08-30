//
//  Double.swift
//  MMEcletic
//

import Foundation

public extension Double {

    /// The `signum` property returns the sign of a number, indicating whether the value is positive, negative, or zero.
    var signum: Double { get { self > 1.0 ? 1.0 : (self < -1.0 ? -1.0 : 0.0) } }

}
