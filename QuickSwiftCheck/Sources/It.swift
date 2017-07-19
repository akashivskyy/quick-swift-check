//
// It.swift
//
// Copyright © 2017 Adrian Kashivskyy. All rights reserved.
// Licensed under the MIT License.
//

import Quick
import SwiftCheck

/// Create a `Property` wrapped in a `Quick` test case. This makes `property`
/// tests conform to `Quick` world, and makes them compatible with spec
/// structure (e.g. makes them respect `beforeEach`, etc.).
///
/// - Parameters:
///     - description: Description of the test case.
///     - arguments: The checker arguments for replaying tests.
///     - flags: Flags to filter examples or example groups.
///     - file: Source file where the call was made.
///     - line: Line at which the call was made.
///     - closure: A closure acting as a test body.
public func sc_it(_ description: String, arguments: CheckerArguments? = nil, flags: FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> Property) {
    it(description, flags: flags, file: String(describing: file), line: line) {
        property(description, arguments: arguments, file: file, line: line) <- closure()
    }
}

/// Create a `Property` wrapped in a focused `Quick` test case. This makes
/// `property` tests conform to `Quick` world, and makes them compatible with
/// spec structure (e.g. makes them respect `beforeEach`, etc.).
///
/// - Parameters:
///     - description: Description of the test case.
///     - arguments: The checker arguments for replaying tests.
///     - flags: Flags to filter examples or example groups.
///     - file: Source file where the call was made.
///     - line: Line at which the call was made.
///     - closure: A closure acting as a test body.
public func sc_fit(_ description: String, arguments: CheckerArguments? = nil, flags: FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> Property) {
    fit(description, flags: flags, file: String(describing: file), line: line) {
        property(description, arguments: arguments, file: file, line: line) <- closure()
    }
}

/// Create a `Property` wrapped in a pending `Quick` test case. This makes
/// `property` tests conform to `Quick` world, and makes them compatible with
/// spec structure (e.g. makes them respect `beforeEach`, etc.).
///
/// - Parameters:
///     - description: Description of the test case.
///     - arguments: The checker arguments for replaying tests.
///     - flags: Flags to filter examples or example groups.
///     - file: Source file where the call was made.
///     - line: Line at which the call was made.
///     - closure: A closure acting as a test body.
public func sc_xit(_ description: String, arguments: CheckerArguments? = nil, flags: FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> Property) {
    xit(description, flags: flags, file: String(describing: file), line: line) {
        property(description, arguments: arguments, file: file, line: line) <- closure()
    }
}
