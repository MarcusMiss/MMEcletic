//
//  Result+EasyAccessor.swift
//  MMEcletic
//

import Foundation

public extension Result {

    /// Check if result indicates success.
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }

    /// Check if result indicates failure.
    var isFailure: Bool {
        switch self {
        case .success:
            return false
        case .failure:
            return true
        }
    }

    /// Return value for success.
    var valueSuccess: Optional<Success> {
        switch self {
        case .success(let value):
            return Optional.some(value)
        case .failure:
            return Optional.none
        }
    }

    /// Return value for failures
    var valueFailure: Optional<Failure> {
        switch self {
        case .success:
            return Optional.none
        case .failure(let error):
            return Optional.some(error)
        }
    }

}
