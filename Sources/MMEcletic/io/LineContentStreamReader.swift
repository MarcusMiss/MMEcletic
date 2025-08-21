//
//  LineContentStreamReader.swift
//  MMEcletic
//

import Foundation

/// This class reads content from source line by line.
///
/// This class simplfies line-based content-reading from a source URL in an asynchronous way.
///
/// ### Sample
///
/// ```swift
/// let source: URL = URL(fileURLWithPath: ...)
/// let reader: LineContentStreamReader = LineContentStreamReader(source: source)
/// while let line = try await reader.readLine() {
///     print("\(line)")
/// }
/// ```
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
public class LineContentStreamReader {

    // MARK: - Properties

    /// Source to read lines from.
    private var source: AsyncLineSequence<URL.AsyncBytes>.AsyncIterator;

    // MARK: - Initialization
    
    /// Initialization of this object.
    /// - Parameter source: source to read from
    public init(source: URL) {
        self.source = source.lines.makeAsyncIterator()
    }

    // MARK: - API
    
    /// Read next line from source.
    /// - Returns: next line if available
    /// - Throws: Error in case of failures
    public func readLine() async throws -> Optional<String> {
        return try await source.next()
    }

}
