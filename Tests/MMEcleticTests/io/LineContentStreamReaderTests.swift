//
//  LineContentStreamReaderTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("LineContentStreamReaderTests")
class LineContentStreamReaderTestsTests {

    @Test("Read content of file 'SimpleFile.txt'")
    func toInt() async throws {
        if let sourcePath = Bundle.module.path(forResource: "SimpleFile", ofType: "txt", inDirectory:"TestData") {
            let source: URL = URL(fileURLWithPath: sourcePath)
            var lineCount: Int = 0
            let reader: LineContentStreamReader = LineContentStreamReader(source: source)
            while let line = try await reader.readLine() {
                print("\(lineCount) : \(line)")
                lineCount += 1
            }
            #expect(lineCount == 3)
        }
    }

}
