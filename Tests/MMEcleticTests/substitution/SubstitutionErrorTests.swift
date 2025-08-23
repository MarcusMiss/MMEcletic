//
//  SubstitutionErrorTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("SubstitutionError")
class SubstitutionErrorTests {

    let sym: String = "SYM"
    let expr: String = "/path/${SYM}"

    @Test("SubstitutionError errorDescription (de)",
        .enabled(if:  Bundle.module.preferredLocalizations.contains("de"))
    )
    func errorDescriptionDE() async throws {
        print("01:SubstitutionError.unknownSymbol: \(SubstitutionError.unknownSymbol(symbol: "SYM", expression: expr).localizedDescription)")
        #expect(SubstitutionError.unknownSymbol(symbol: "SYM", expression: expr).localizedDescription
                == "Der Wert “SYM“ im Ausdruck “/path/${SYM}“ kann nicht ersetzt werden.")

        print("02:SubstitutionError.invalidOpenToken: \(SubstitutionError.invalidOpenToken(symbol: "SYM").localizedDescription)")
        #expect(SubstitutionError.invalidOpenToken(symbol: "SYM").localizedDescription
                == "“SYM“ ist kein gültiges Startsymbol für eine Substituierung.")

        print("03:SubstitutionError.invalidCloseToken: \(SubstitutionError.invalidCloseToken(symbol: "SYM").localizedDescription)")
        #expect(SubstitutionError.invalidCloseToken(symbol: "SYM").localizedDescription
                == "“SYM“ ist kein gültiges Endsymbol für eine Substituierung.")
    }

    @Test("SubstitutionError errorDescription (en)",
        .enabled(if: Bundle.module.preferredLocalizations.contains("en"))
    )
    func errorDescriptionEN() async throws {
        print("01:SubstitutionError.unknownSymbol: \(SubstitutionError.unknownSymbol(symbol: "SYM", expression: expr).localizedDescription)")
        #expect(SubstitutionError.unknownSymbol(symbol: "SYM", expression: expr).localizedDescription
                == "Unable to resolve value for “SYM“ in “/path/${SYM}“.")
        
        print("02:SubstitutionError.invalidOpenToken: \(SubstitutionError.invalidOpenToken(symbol: "SYM").localizedDescription)")
        #expect(SubstitutionError.invalidOpenToken(symbol: "SYM").localizedDescription
                == "“SYM“ not a valid opening symbol for substitution.")
        
        print("03:SubstitutionError.invalidCloseToken: \(SubstitutionError.invalidCloseToken(symbol: "SYM").localizedDescription)")
        #expect(SubstitutionError.invalidCloseToken(symbol: "SYM").localizedDescription
                == "“SYM“ not a valid closing symbol for substitution.")
    }

}
