//
//  String+Trim.swift
//  MMEcletic
//

import Foundation

public extension String {

    /// Remove postfix if given.
    /// - Parameter postfix: postfix to remove
    /// - Returns: string wihtout matching postfix
    func trimPostfix(_ postfix: String) -> String {
        if !self.hasSuffix(postfix) {
            return self
        }
        let range: Range = self.index(self.startIndex, offsetBy: 0)..<self.index(self.endIndex, offsetBy: -postfix.count)
        return String(self[range])
    }

    /// Remove prefix
    /// - Parameter prefix: prefix to remove
    /// - Returns: string without matching prefix
    func trimPrefix(_ prefix: String) -> String {
        if !self.hasPrefix(prefix) {
            return self
        }
        let range: Range = self.index(self.startIndex, offsetBy: prefix.count)..<self.index(self.endIndex, offsetBy: 0)
        return String(self[range])
    }

    /// Remove all whitespaces from beginning and end of string.
    ///
    /// - Returns: trimmed string
    func trim() -> String {
        return trimLeft().trimRight()
    }
    
    /// Remove all whitespaces from beginning of string.
    ///
    /// - Returns: left trimmed string
    func trimLeft() -> String {
        return trimWithOptions(options: [.anchored])
    }
    
    /// Remove all whitesapces from end of string.
    ///
    /// - Returns: right trimmed string
    func trimRight() -> String {
        return trimWithOptions(options: [.anchored, .backwards])
    }

    private func trimWithOptions(options: NSString.CompareOptions = []) -> String {
        var remainExpression: String = String(self)
        while let trailingRange = remainExpression.rangeOfCharacter(
            from: .whitespacesAndNewlines,
            options: options) {
                remainExpression.removeSubrange(trailingRange)
            }
        return remainExpression
    }

}
