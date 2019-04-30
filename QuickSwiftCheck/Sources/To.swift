// To.swift
// Copyright © 2019 Adrian Kashivskyy. All rights reserved.

import Nimble
import SwiftCheck

extension Expectation {

    /// Evaluate the expectation with a predicate and return a `Testable` result
    /// instead of asserting it in a handler.
    ///
    /// - Parameters:
    ///     - predicate: The predicate to use.
    ///     - description: An custom expectation description.
    ///
    /// - Returns: A `Testable` result that can be returned as a result of a
    ///   quantifier.
    public func sc_to(_ predicate: Predicate<T>, description: String? = nil) -> Testable {
        return makeTestable(predicate: predicate, userDescription: description, intention: .toMatch)
    }

    /// Evaluate the expectation with a predicate and return a `Testable` result
    /// instead of asserting it in a handler.
    ///
    /// - Parameters:
    ///     - predicate: The predicate to use.
    ///     - description: An custom expectation description.
    ///
    /// - Returns: A `Testable` result that can be returned as a result of a
    ///   quantifier.
    public func sc_toNot(_ predicate: Predicate<T>, description: String? = nil) -> Testable {
        return makeTestable(predicate: predicate, userDescription: description, intention: .toNotMatch)
    }

}
