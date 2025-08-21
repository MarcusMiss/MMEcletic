//
//  PropertyWrapperTrimming.swift
//  MMEcletic
//

import Foundation

/// This property-wrapper can be used to control trimming of a string.
///
/// This sample-code might be helpful: <doc:MMEcletic-PropertyWrapperTrim>.
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
@propertyWrapper
public struct Trimming {

    /// Configuration how propertyWrapper must trim text.
    public enum TrimSetting {
        /// left- and right trimming
        case all
        /// Left-trimming only
        case left
        /// Right-trimming only
        case right
        /// no trimming at all
        case none
    }

    public var projectedValue: TrimSetting = .all
    
    // MARK: - Properties

    private(set) var text: String = ""
    public let trimSetting: TrimSetting

    public var wrappedValue: String {
        get { return text }
        set {
            switch trimSetting {
            case .all:
                text = newValue.trim()
            case .left:
                text = newValue.trimLeft()
            case .right:
                text = newValue.trimRight()
            case .none:
                text = newValue
            }
            projectedValue = trimSetting
        }
    }

}
