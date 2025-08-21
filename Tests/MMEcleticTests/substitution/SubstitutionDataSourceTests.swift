//
//  SubstitutionDataSourceTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("SubstitutionDataSourceDictionary")
class SubstitutionDataSourceDictionaryTests {

    @Test("Check solveValueForSymbol()")
    func solveValueForSymbol() async throws {
        let ds: SubstitutionDataSourceDictionary = SubstitutionDataSourceDictionary([
            "key": "value"
        ])
        #expect(ds.solveValueForSymbol(symbol: "key") == Optional.some("value"))
        #expect(ds.solveValueForSymbol(symbol: "murks") == Optional.none)
        
        #expect(ds.description.isEmpty == false)
        #expect(ds.debugDescription.isEmpty == false)
    }

}


@Suite("SubstitutionDataSourceImpl")
class SubstitutionDataSourceImplTests {

    @Test("Check solveValueForSymbol()")
    func solveValueForSymbol() async throws {
        let ds: SubstitutionDataSourceImpl = SubstitutionDataSourceImpl()
        #expect(ds.solveValueForSymbol(symbol: "HOME") != Optional.none)
        #expect(ds.solveValueForSymbol(symbol: "USERNAME") != Optional.none)
        #expect(ds.solveValueForSymbol(symbol: "FULLNAME") != Optional.none)
        #expect(ds.solveValueForSymbol(symbol: "TEMP") != Optional.none)
        #expect(ds.solveValueForSymbol(symbol: "murks") == Optional.none)

        #expect(ds.description.isEmpty == false)
        #expect(ds.debugDescription.isEmpty == false)
    }

}
