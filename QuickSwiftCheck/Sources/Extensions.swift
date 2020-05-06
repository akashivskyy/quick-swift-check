// Extensions.swift
// Copyright © 2020 Adrian Kashivskyy. All rights reserved.

import Foundation
import Nimble
import SwiftCheck

/// Describes an intention of an expectation.
internal enum ExpectationIntention {

    /// The intention is to match.
    case toMatch

    /// The intention is to not match.
    case toNotMatch

    /// A "to" or "to not" description of this intention.
    fileprivate var toDescription: String {
        switch self {
            case .toMatch: return "to"
            case .toNotMatch: return "to not"
        }
    }

}

// MARK: -

extension Expectation {

    /// Evaluate the expectation with a predicate and return a `Testable` result
    /// instead of asserting it in a handler.
    ///
    /// - Parameters:
    ///     - predicate: A predicate to use.
    ///     - userDescription: A custom expectation description.
    ///     - intention: An intention of expectation.
    ///
    /// - Returns: A `Testable` result that can be returned as a result of a
    ///   quantifier.
    internal func makeTestable(predicate: Predicate<T>, userDescription: String?, intention: ExpectationIntention) -> Testable {
        return predicate.makeTestResult(expression: expression, intention: intention, failureMessage: FailureMessage(userDescription: userDescription, toDescription: intention.toDescription))
    }

}

// MARK: -

extension Predicate {

    /// Evaluate the predicate against an expression and return a `Testable`
    /// result.
    ///
    /// - Parameters:
    ///     - expression: An expression to evaluate against.
    ///     - intention: An expectation intention.
    ///     - failureMessage: An instance of `FailureMessage`.
    ///
    /// - Returns: A `TestResult` instance that can be returned as a result of a
    ///   quantifier.
    internal func makeTestResult(expression: Expression<T>, intention: ExpectationIntention, failureMessage: FailureMessage) -> TestResult {
        return capturingException(
            try: {
                do {
                    failureMessage.actualValue = "<\(stringify(try expression.evaluate()))>"
                    if try evaluate(against: expression, intention: intention, failureMessage: failureMessage) {
                        return .succeeded
                    } else {
                        return .failed(failureMessage.stringValue)
                    }
                } catch let error {
                    failureMessage.stringValue = "unexpected error thrown: <\(error)>"
                    return .failed(failureMessage.stringValue)
                }
            },
            catch: {
                failureMessage.stringValue = "unexpected exception raised: \($0)"
                return .failed(failureMessage.stringValue)
            }
        )
    }

    /// Evaluate the predicate against an `expression` and return a `Bool`
    /// indicating whether the evaluation was successful.
    ///
    /// - Parameters:
    ///     - expression: An expression to evaluate against.
    ///     - intention: An expectation intention.
    ///     - failureMessage: An instance of `FailureMessage`.
    ///
    /// - Returns: A `Bool` value indicating success of evaluation.
    private func evaluate(against expression: Expression<T>, intention: ExpectationIntention, failureMessage: FailureMessage) throws -> Bool {
        switch intention {
            case .toMatch: return try matches(expression, failureMessage: failureMessage)
            case .toNotMatch: return try doesNotMatch(expression, failureMessage: failureMessage)
        }
    }

}

// MARK: -

extension FailureMessage {

    /// Initialize a `FailureMessage` with `userDescription`, `to` and
    /// `actualValue`.
    ///
    /// - Parameters:
    ///     - userDescription: A user-provided description of an expectation.
    ///     - toDescription: Words to use as "to" or "to not".
    ///     - actualValueDescription: Description of an actual value.
    fileprivate convenience init(userDescription: String?, toDescription: String) {
        self.init()
        self.userDescription = userDescription
        self.to = toDescription
    }

}

// MARK: -

/// Try to execute `try` closure and if it throws an Objective-C exception,
/// coalesce the result by `catch` closure.
///
/// - Parameters:
///     - try: A `@try` closure.
///     - catch: A `@catch` closure.
///
/// - Returns: A result.
fileprivate func capturingException<Result>(try: () -> Result, catch: (NSException) -> Result) -> Result {
    #if !SWIFT_PACKAGE
        return withoutActuallyEscaping(`catch`) { `catch` in
            var result: Result!
            NMBExceptionCapture(handler: { result = `catch`($0) }).tryBlock { result = `try`() }
            return result
        }
    #else
        return `try`()
    #endif
}
