//
//  Result+EasyAccessorTests.swift
//  MMEcletic
//

import Foundation
import Testing
@testable import MMEcletic

@Suite("Extension Result")
class ResultTests {

    enum TestError: Error {
        case fake
    }

    @Test("Result Success")
    func isSuccess() async throws {
        #expect(Result<String, Error>.success("Hello").isSuccess == true)
        #expect(Result<String, Error>.success("Hello").isFailure == false)
        #expect(Result<String, Error>.success("Hello").valueSuccess == Optional.some("Hello"))
        #expect(Result<String, Error>.success("Hello").valueFailure == nil)
    }

    @Test("Result Failure")
    func isFailure() async throws {
        #expect(Result<String, TestError>.failure(TestError.fake).isFailure == true)
        #expect(Result<String, TestError>.failure(TestError.fake).isSuccess == false)
        #expect(Result<String, TestError>.failure(TestError.fake).valueFailure == Optional.some(TestError.fake))
        #expect(Result<String, TestError>.failure(TestError.fake).valueSuccess == Optional.none)
    }

}
