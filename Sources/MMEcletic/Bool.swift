//
//  Bool.swift
//  MMEcletic
//

public extension Bool {

    /// _XOR_-operator for `Bool`-types.
    /// - Parameters:
    ///   - left: left-hand side value
    ///   - right: right-hand side value
    /// - Returns: `true` if only one of both values is `true`
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }

}
