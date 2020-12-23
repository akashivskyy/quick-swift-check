// To.swift
// Copyright © 2020 Adrian Kashivskyy. All rights reserved.

import Nimble
import SwiftCheck

extension Expectation {

    /// Evaluate the given `predicate` with the expected expression and wrap
    /// the result in a SwiftCheck `Testable`. This makes it possible to use
    /// Nimble matchers inside a property test.
    public func sc_to(_ predicate: Predicate<T>, description: String? = nil) -> Testable {
        return testable(predicate: predicate, description: description, style: .toMatch, to: "to")
    }

    /// Evaluate the given `predicate` with the expected expression and wrap
    /// the result in a SwiftCheck `Testable`. This makes it possible to use
    /// Nimble matchers inside a property test.
    public func sc_toNot(_ predicate: Predicate<T>, description: String? = nil) -> Testable {
        return testable(predicate: predicate, description: description, style: .toNotMatch, to: "to not")
    }

    /// Create `Testable` result by evaluating the expectation with the given
    /// `predicate`, user `description` and `style`.
    private func testable(predicate: Predicate<T>, description: String?, style: ExpectationStyle, to: String) -> TestResult {
        do {
            let result = try predicate.satisfies(expression)
            if result.toBoolean(expectation: style) {
                return .succeeded
            } else {
                let actual = try "<\(stringify(expression.evaluate()))>"
                if let description = description, !description.isEmpty {
                    return .failed("\(description); " + result.message.toString(actual: actual, to: to))
                } else {
                    return .failed(result.message.toString(actual: actual, to: to))
                }
            }
        } catch {
            return .failed("unexpected error thrown: <\(error)>")
        }
    }

}
