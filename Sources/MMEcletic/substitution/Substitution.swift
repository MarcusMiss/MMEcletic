//
//  Substitution.swift
//  MMEcletic
//

import Foundation

/// ${SYMBOL}-Substitutions
/// 
/// This class allows ease substitution of _${SYMBOL}_ occurrences within a String.
/// Attached data sources (of type ``SubstitutionDataSource``) allows dynamic resolving of used symbols.
/// 
/// So in your code you can easily solve expressions like `${HOME}/SubPath`.
/// 
/// ```swift
/// let s: Substitution = Substitution.of(dataSources: [
///     SubstitutionDataSourceDictionary([
///         "key1": "value1",
///         "key2": "value2",
///         "key3": "value3"
///     ]),
///     SubstitutionDataSourceImpl()
/// ])
/// let result: Result<String, SubstitutionError> = s.applySubstitutions(source: "/${TEMP}/${key2}.${key3}.log")
/// ```
///
/// > Important: The ``Substitution``-class passes the symbol to be replaced unmodified to datasources.
/// So the datasource needs to take care about case-sensitive or -insensitve symbol-detection.
///
/// @Small { Available since <doc:MMEcletic-Release-History#Release-1.0.0>. }
public class Substitution: CustomStringConvertible, CustomDebugStringConvertible {

    // MARK: - Factories
    
    /// Factory to setup an substitutor with '${' as opening and '}' as closing symbol.
    /// - Parameter dataSources: data sources for substitutor
    /// - Returns: new ``Substitution``instance
    public static func of(dataSources: [SubstitutionDataSource]) -> Substitution {
        return Substitution(standardOpeningSequence, standardClosingSequence, dataSources)
    }

    /// Factory to setup an substitutor with self-defined opening- and closing sequence.
    /// - Parameters
    ///     - dataSources: data sources for substitutor
    ///     - openToken: symbol for opening sequence
    ///     - closeToken: symbol for closing sequence
    /// - Returns: new ``Substitution``instance
    /// - Throws: May throw ``SubstitutionError`` in case of errors
    public static func of(dataSources: [SubstitutionDataSource],
                          openToken: String,
                          closeToken: String) throws (SubstitutionError) -> Substitution {
        try Substitution.validateSequenceTokens(openToken, closeToken)
        return Substitution(standardOpeningSequence, standardClosingSequence, dataSources)
    }

    /// This function validates the given open- and closing-sequences.
    /// - Parameters
    ///     - openToken: symbol for opening sequence
    ///     - closeToken: symbol for closing sequence
    /// - Throws: May throw ``SubstitutionError`` in case of errors
    static func validateSequenceTokens(_ openToken: String,
                                       _ closeToken: String) throws (SubstitutionError) {
        if openToken.trim().isEmpty {
            throw SubstitutionError.invalidOpenToken(symbol: openToken)
        }
        if closeToken.trim().isEmpty {
            throw SubstitutionError.invalidCloseToken(symbol: closeToken)
        }
        if closeToken.trim().compare(openToken.trim()) == ComparisonResult.orderedSame {
            throw SubstitutionError.invalidCloseToken(symbol: openToken)
        }
    }

    // MARK: - Properties

    /// Standard symbol for opening sequence
    public static let standardOpeningSequence: String = "${"
    /// Standard symbol for closing sequence
    public static let standardClosingSequence: String = "}"

    /// Symbol for opening sequence
    let openingSequence: String
    /// Symbol for closing sequence
    let closingSequence: String
    /// Datasource to use
    let dataSources: [SubstitutionDataSource]

    // MARK: - Initialization

    /// Initialisation of this object.
    /// - Parameters:
    ///   - openingSequence: symbol for opening sequence
    ///   - closingSequence: symbol for closing sequence
    ///   - dataSources: data sources for substitutor
    init(
        _ openingSequence: String,
        _ closingSequence: String,
        _ dataSources: [SubstitutionDataSource]
    ) {
        self.openingSequence = openingSequence
        self.closingSequence = closingSequence
        self.dataSources = dataSources
    }

    // MARK: - API (public)
    
    /// Apply substition(s) on given source-string.
    /// - Parameter source: text which receive replacements
    /// - Returns: substituted text or an error
    public func applySubstitutions(source: String) -> Result<String, SubstitutionError> {
        do {
            return .success(try self.findAndReplaceSubstitutions(source: source))
        } catch let error {
            return .failure(error)
        }
    }

    // MARK: - API (private)

    /// Process all substitutions in given string.
    /// - Parameter: source: string to replace symboles
    /// - Returns: substituted string
    /// - Throws: May throw ``SubstitutionError`` in case of errors
    func findAndReplaceSubstitutions(source: String) throws(SubstitutionError) -> String {
        var resultExpression: String = String()
        var remainExpression: String = String(source)
        var solveLoop: Bool = true
        repeat {
            // find next occurence of openingSequence
            if let openPosition = remainExpression.range(of: openingSequence,
                                                         options: String.CompareOptions.literal,
                                                         range: remainExpression.startIndex..<remainExpression.endIndex) {
                // Handle remaining text upto opening symbol
                let symbolPrefixText = String(remainExpression[remainExpression.startIndex..<openPosition.lowerBound])
                resultExpression.append(contentsOf: symbolPrefixText)
                // Cleanup remaining string
                remainExpression.removeSubrange(remainExpression.startIndex..<symbolPrefixText.endIndex)
                // find next occurence of closingSequence
                if let closePosition = remainExpression.range(of: closingSequence,
                                                              options: String.CompareOptions.literal,
                                                              range: remainExpression.startIndex..<remainExpression.endIndex) {
                    let symbolText = String(remainExpression[openingSequence.endIndex..<closePosition.lowerBound])
                    let replacementText = try processReplacementSymbol(source: source,
                                                                       symbol: symbolText)
                    // Add to result
                    resultExpression.append(contentsOf: replacementText)
                    // Cleanup remaining string
                    remainExpression.removeSubrange(remainExpression.startIndex..<closePosition.upperBound)
                } else {
                    resultExpression.append(contentsOf: remainExpression)
                    solveLoop = false
                }
            } else {
                resultExpression.append(contentsOf: remainExpression)
                solveLoop = false
            }
        } while solveLoop
        return resultExpression
    }

    /// Query defined data source in order of their definition to solve symbols.
    /// - Parameters:
    ///     - source: source-expression
    ///     - symbol: symbol which needs replacement
    /// - Returns: replacement value
    /// - Throws: May throw ``SubstitutionError`` in case of errors
    func processReplacementSymbol(source: String, symbol: String) throws (SubstitutionError) -> String {
        for dataSource in self.dataSources {
            if let result = dataSource.solveValueForSymbol(symbol: symbol) {
                return result
            }
        }
        throw SubstitutionError.unknownSymbol(symbol: symbol, expression: source)
    }

    // MARK: - Protocol CustomStringConvertible

    public var description: String {
        return "openingSequence: \'\(self.openingSequence)\', closingSequence: \'\(self.closingSequence)\', dataSources: \(self.dataSources)"
    }

    // MARK: - Protocol CustomDebugStringConvertible

    public var debugDescription: String {
        return "Substitution(openingSequence: \'\(self.openingSequence)\', closingSequence: \'\(self.closingSequence)\', dataSources: \(self.dataSources))"
    }

}
