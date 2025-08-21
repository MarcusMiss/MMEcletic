//
//  SubstitutionError.swift
//  MMEcletic
//

import Foundation

/// Errors of Substitution
///
/// The ``Substitution``-class may throw one of the following errors.
///
/// The possible errors are related to invalid open- and/or closing-sequence and
/// when ``SubstitutionDataSource`` is unable to deliver a value.
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
public enum SubstitutionError: Error, Equatable {

    /// Error: No replacement-value availble for given symbol
    case unknownSymbol(symbol: String, expression: String)
    /// Error: Invalid symbol for opening-sequence
    case invalidOpenToken(symbol: String)
    /// Error: Invalid symbol for closing-sequence
    case invalidCloseToken(symbol: String)
}

extension SubstitutionError: LocalizedError {

    /// Return localized description of an error
    public var errorDescription: String? {
        switch self {
        case .unknownSymbol(symbol: let symbol, expression: let expression):
            return LocalizedSubstitutionErrorString("error.unknownSymbol", with: symbol, expression)
        case .invalidOpenToken(symbol: let symbol):
            return LocalizedSubstitutionErrorString("error.invalidOpenToken", with: symbol)
        case .invalidCloseToken(symbol: let symbol):
            return LocalizedSubstitutionErrorString("error.invalidCloseToken", with: symbol)
        }
    }

}

fileprivate func LocalizedSubstitutionErrorString(_ key: String, with arguments: CVarArg...) -> String {
    let localizedString = NSLocalizedString(
        key,
        tableName: "MMSubstitutionError",
        bundle: Bundle.module,
        value: "",
        comment: "")
    return String.localizedStringWithFormat(localizedString, arguments)
}
