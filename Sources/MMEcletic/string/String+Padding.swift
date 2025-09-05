//
//  String+Padding.swift
//  MMEcletic
//

public extension String {

    func padLeft(_ length: Int, withPad pad: Character = " ") -> String {
        let padCount = length - self.count
        guard padCount >= 0 else {
            return self
        }
        return String(repeating: String(pad), count: padCount) + self
    }

    func padRight(_ length: Int, withPad pad: Character = " ") -> String {
        let padCount = length - self.count
        guard padCount >= 0 else {
            return self
        }
        return self + String(repeating: String(pad), count: padCount)
    }

}
