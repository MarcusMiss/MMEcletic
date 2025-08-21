//
//  PropertyWrapperCase.swift
//  MMEcletic
//

import Foundation

/// This property-wrapper can be used to control casing of a string.
///
/// This sample-code might be helpful: <doc:MMEcletic-PropertyWrapperCase>.
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
@propertyWrapper
public struct Case {

    /// Configuration how propertyWrapper must handle caseing
    public enum CaseSetting {
        /// All uppercase
        case uppercase
        /// All lowercase
        case lowercase
        /// Capitalize per word
        case capitalize
        // No change
        case none
    }

    // MARK: - Properties

    public var projectedValue: CaseSetting = .capitalize

    private(set) var text: String = ""
    public let caseSetting: CaseSetting
    
    public var wrappedValue: String {
        get { return text }
        set {
            switch caseSetting {
            case .uppercase:
                text = newValue.uppercased()
            case .lowercase:
                text = newValue.lowercased()
            case .capitalize:
                text = newValue.capitalized
            case .none:
                text = newValue
            }
            projectedValue = caseSetting
        }
    }

}
