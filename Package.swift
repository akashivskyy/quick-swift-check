// swift-tools-version:5.0
// Package.swift
// Copyright © 2019 Adrian Kashivskyy. All rights reserved.

import PackageDescription

let package = Package(
    name: "QuickSwiftCheck",
    products: [
        .library(name: "QuickSwiftCheck", targets: ["QuickSwiftCheck"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "2.0.0"),
        .package(url: "https://github.com/typelift/SwiftCheck.git", from: "0.12.0"),
    ],
    targets: [
        .target(
            name: "QuickSwiftCheck",
            dependencies: ["Nimble", "Quick", "SwiftCheck"],
            path: "QuickSwiftCheck/Sources"
        ),
    ]
)
