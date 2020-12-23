// It.swift
// Copyright © 2020 Adrian Kashivskyy. All rights reserved.

import Quick
import SwiftCheck

/// Wrap a SwiftCheck `Property` in a Quick example. This makes it possible to
/// write property tests inside Quick specs.
///
/// ```
/// sc_it("integer addition is commutative") {
///     forAll { (a: Int, b: Int) in
///         expect(a + b).sc_to(equal(b + a))
///     }
/// }
/// ```
///
/// - Parameters:
///     - description: Description of the example.
///     - arguments: Checker arguments for replaying tests.
///     - flags: Flags to filter examples or example groups.
///     - closure: Closure containing a property test.
public func sc_it(_ description: String, arguments: CheckerArguments? = nil, flags: FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> Property) {
    #if SWIFT_PACKAGE
        it(description, flags: flags, file: file, line: line) {
            property(description, arguments: arguments, file: file, line: line) <- closure()
        }
    #else
        it(description, flags: flags, file: String(describing: file), line: line) {
            property(description, arguments: arguments, file: file, line: line) <- closure()
        }
    #endif
}

/// Wrap a SwiftCheck `Property` in a focused Quick example. This makes it
/// possible to write property tests inside Quick specs.
public func sc_fit(_ description: String, arguments: CheckerArguments? = nil, flags: FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> Property) {
    #if SWIFT_PACKAGE
        fit(description, flags: flags, file: file, line: line) {
            property(description, arguments: arguments, file: file, line: line) <- closure()
        }
    #else
        fit(description, flags: flags, file: String(describing: file), line: line) {
            property(description, arguments: arguments, file: file, line: line) <- closure()
        }
    #endif
}

/// Wrap a SwiftCheck `Property` in a pending Quick example. This makes it
/// possible to write property tests inside Quick specs.
public func sc_xit(_ description: String, arguments: CheckerArguments? = nil, flags: FilterFlags = [:], file: StaticString = #file, line: UInt = #line, _ closure: @escaping () -> Property) {
    #if SWIFT_PACKAGE
        xit(description, flags: flags, file: file, line: line) {
            property(description, arguments: arguments, file: file, line: line) <- closure()
        }
    #else
        fit(description, flags: flags, file: String(describing: file), line: line) {
            property(description, arguments: arguments, file: file, line: line) <- closure()
        }
    #endif
}
