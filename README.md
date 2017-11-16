# QuickSwiftCheck

[![](https://img.shields.io/github/release/akashivskyy/QuickSwiftCheck.svg)](https://github.com/akashivskyy/QuickSwiftCheck/releases)
![](https://img.shields.io/badge/swift-4.0.2-orange.svg)
[![](https://img.shields.io/badge/spm-compatible-green.svg)](https://github.com/apple/swift-package-manager)
[![](https://img.shields.io/badge/carthage-compatible-green.svg)](https://github.com/Carthage/Carthage)
[![](https://img.shields.io/badge/cocoapods-compatible-green.svg)](https://cocoapods.org)

[Quick](https://github.com/Quick/Quick) + [Nimble](https://github.com/Quick/Nimble) + [SwiftCheck](https://github.com/typelift/SwiftCheck) = **QuickSwiftCheck**.

## Requirements

QuickSwiftCheck is written in Swift 4.0.2 and supports **macOS 10.10+**, **iOS 8.0+**, **tvOS 9.0+** and **Linux**.

## Usage

QuickSwiftCheck allows you to use [Quick](https://github.com/Quick/Quick) DSL and [Nimble](https://github.com/Quick/Nimble) expectations together with [SwiftCheck](https://github.com/typelift/SwiftCheck):

```swift
sc_it("Int.hashValue should respect the axiom") {
    forAll { (x: Int, y: Int) in
        (x == y) ==> expect(x.hashValue).sc_to(equal(y.hashValue))
    }
}
```

QuickSwiftCheck adds `sc_` variants to `it`, `fit`, `xit`, `to` and `toNot` functions, so that the original functions remain not overloaded (because doing so causes type checking ambiguities). This means you can use `it` to create a regular test example and `to` to create a regular expectation:

```swift
it("this is a regular test example") {
    expect(...).to(...)
}
```

```swift
sc_it("this is a property-based test example") {
    forAll {
        expect(...).sc_to(...)
    }
}
```

## Installation

### Swift Package Manager

If you're using [Swift Package Manager](https://github.com/apple/swift-package-manager), add the following dependency to your `Package.swift`:

```none
.package(url: "https://github.com/akashivskyy/QuickSwiftCheck.git", from: "{version}"),
```

### Carthage

If you're using [Carthage](https://github.com/Carthage/Carthage), add the following dependency to your `Cartfile`:

```none
github "akashivskyy/QuickSwiftCheck" ~> {version}
```

### CocoaPods

If you're using [CocoaPods](http://cocoapods.org), add the following dependency to your `Podfile`:

```none
pod 'QuickSwiftCheck', '~> {version}'
```

## Roadmap

#### Version 2.x

These minor releases will keep QuickSwiftCheck up-to-date with latest versions of Quick, Nimble, SwiftCheck and Swift itself.

## About

This project is made and maintained with ♡ by [Adrian Kashivskyy](https://github.com/akashivskyy).

### License

The project is licensed under the MIT License. See [LICENSE.md](LICENSE.md) for more info.
