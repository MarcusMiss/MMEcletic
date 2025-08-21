//
//  SubstitutionDataSource.swift
//  MMEcletic
//

import Foundation

/// A data source for an ``Substitution``
///
/// A ``Substitution`` data source delivers values for keys which will be applied
/// during substitution-process.
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
public protocol SubstitutionDataSource {
    
    /// Returns value which should be used for replacement.
    /// - Parameter symbol: requested symbol for substitution
    /// - Returns: replacement-value if found or `Optional.none`
    func solveValueForSymbol(symbol: String) -> Optional<String>

}

/// A simple implementation for a ``SubstitutionDataSource``.
///
/// This object acts as a data source for an ``Substitution``-object.
/// It uses an dictionary to resolve data.
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
public struct SubstitutionDataSourceDictionary: SubstitutionDataSource, CustomStringConvertible, CustomDebugStringConvertible {

    // MARK: - Properties
    
    var dictionary: [String: String] = [:]

    // MARK: - Initialization

    public init(_ dictionary: [String: String] = [:]) {
        self.dictionary = dictionary
    }
    
    // MARK: - Protocol SubstitutionDataSource

    public func solveValueForSymbol(symbol: String) -> Optional<String> {
        return self.dictionary[symbol]
    }

    // MARK: - Protocol CustomStringConvertible

    public var description: String {
        return "dictionary: \(self.dictionary)"
    }

    // MARK: - Protocol CustomDebugStringConvertible

    public var debugDescription: String {
        return "SubstitutionDataSourceDictionary(dictionary: \(self.dictionary))"
    }
    
}

/// The default implementation for a ``SubstitutionDataSource``.
///
/// This data source supports following symbols:
///
/// - `HOME`: the home directory for the current user
/// - `USERNAME`: the logon name of the current user
/// - `FULLNAME`: contains the full name of the current user.
/// - `TEMP`: the path of the temporary directory for the current user
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
public struct SubstitutionDataSourceImpl: SubstitutionDataSource, CustomStringConvertible, CustomDebugStringConvertible {

    // MARK: - Properties
    
    // MARK: - Initialization

    public init() {
    }
    
    // MARK: - Protocol SubstitutionDataSource

    public func solveValueForSymbol(symbol: String) -> Optional<String> {
        let sym: String = symbol.trim().uppercased()
        if sym == "HOME" {
            return Optional.some(NSHomeDirectory())
        } else if sym == "USERNAME" {
            return Optional.some(NSUserName())
        } else if sym == "FULLNAME" {
            return Optional.some(NSFullUserName())
        } else if sym == "TEMP" {
            return Optional.some(NSTemporaryDirectory())
        }
        return Optional.none
    }

    // MARK: - Protocol CustomStringConvertible

    public var description: String {
        return "''"
    }

    // MARK: - Protocol CustomDebugStringConvertible

    public var debugDescription: String {
        return "SubstitutionDataSourceImpl()"
    }
    
}
