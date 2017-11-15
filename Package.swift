// swift-tools-version:4.0
//
// Package.swift
//
// Copyright © 2017 Adrian Kashivskyy. All rights reserved.
// Licensed under the MIT License.
//

import PackageDescription

let package = Package(
    name: "QuickSwiftCheck",
    products: [
        .library(name: "QuickSwiftCheck", targets: ["QuickSwiftCheck"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.2"),
        .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
        .package(url: "https://github.com/typelift/SwiftCheck.git", from: "0.9.1"),
    ],
    targets: [
        .target(
            name: "QuickSwiftCheck",
            dependencies: ["Nimble", "Quick", "SwiftCheck"],
            path: "QuickSwiftCheck/Sources"
        ),
    ]
)
