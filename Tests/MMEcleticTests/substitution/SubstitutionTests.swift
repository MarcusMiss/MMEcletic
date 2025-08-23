//
//  SubstitutionTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Substitution")
class SubstitutionTests {

    @Test("Testing validateSequenceTokens")
    func validateSequenceTokens() async throws {
        let error1: SubstitutionError? = #expect(throws: SubstitutionError.self) {
            try Substitution.validateSequenceTokens("", "x")
        }
        print("01:\(String(describing: error1?.localizedDescription))")
        #expect(error1?.localizedDescription == "““ not a valid opening symbol for substitution.")

        let error2: SubstitutionError? = #expect(throws: SubstitutionError.self) {
            try Substitution.validateSequenceTokens("x", "")
        }
        print("02:\(String(describing: error2?.localizedDescription))")
        #expect(error2?.localizedDescription == "““ not a valid closing symbol for substitution.")

        let error3: SubstitutionError? = #expect(throws: SubstitutionError.self) {
            try Substitution.validateSequenceTokens("x", "x")
        }
        print("03:\(String(describing: error3?.localizedDescription))")
        #expect(error3?.localizedDescription == "“x“ not a valid closing symbol for substitution.")
    }

    @Test("Testing of()-factories")
    func of() async throws {
        let s: Substitution = Substitution.of(dataSources: [])
        #expect(s.dataSources.isEmpty)
        #expect(s.openingSequence == "${")
        #expect(s.closingSequence == "}")

        // Invalid
        let error1: SubstitutionError? = #expect(throws: SubstitutionError.self) {
            try Substitution.of(dataSources: [], openToken: "{", closeToken: "")
        }
        print("\(String(describing: error1))")
        // TODO : ASSERTION

        // Invalid
        let error2: SubstitutionError? = #expect(throws: SubstitutionError.self) {
            try Substitution.of(dataSources: [], openToken: "", closeToken: "}")
        }
        print("\(String(describing: error2))")
        // TODO : ASSERTION

        // Invalid
        let error3: SubstitutionError? = #expect(throws: SubstitutionError.self) {
            try Substitution.of(dataSources: [], openToken: "/", closeToken: "/")
        }
        print("\(String(describing: error3))")
        // TODO : ASSERTION
    }

    @Test("Testing valid substitutions",
          arguments: [
            "",
            "${key1}/${key2}/${key3}",
            "lorem/${key3}/ipsum",
            "${",
            "}/lipsum"
          ]
    )
    func applySubstitutions(_ expression: String) async throws {
        let s: Substitution = Substitution.of(dataSources: [
            SubstitutionDataSourceDictionary([
                "key1": "value1",
                "key2": "value2",
                "key3": "value3"
            ])
        ])
        let result: Result<String, SubstitutionError> = s.applySubstitutions(source: expression)
        try #require(result.isSuccess)
        try #require(s.description.isEmpty == false)
        try #require(s.debugDescription.isEmpty == false)
    }

    @Test("Testing invalid substitutions",
          arguments: [
            "${${}}",
            "${_key1}/_${key2}/_${key3}"
          ]
    )
    func applySubstitutions2(_ expression: String) async throws {
        let s: Substitution = try Substitution.of(
            dataSources: [
                SubstitutionDataSourceDictionary([
                "key1": "value1",
                "key2": "value2",
                "key3": "value3"
            ])],
            openToken: Substitution.standardOpeningSequence,
            closeToken: Substitution.standardClosingSequence)
        let result: Result<String, SubstitutionError> = s.applySubstitutions(source: expression)
        try #require(result.isFailure)
        print("result=\(result)")
    }

}

