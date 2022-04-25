# QuickSwiftCheck

[![](https://img.shields.io/github/release/akashivskyy/quick-swift-check.svg)](https://github.com/akashivskyy/quick-swift-check/releases)
[![](https://img.shields.io/badge/swiftpm-compatible-green.svg)](https://github.com/apple/swift-package-manager)
[![](https://img.shields.io/badge/cocoapods-compatible-green.svg)](https://cocoapods.org)

Interoperability between [Quick](https://github.com/Quick/Quick), [Nimble](https://github.com/Quick/Nimble) and [SwiftCheck](https://github.com/typelift/SwiftCheck).

## Requirements

QuickSwiftCheck supports **iOS 9.0+**, **macOS 10.10+**, **tvOS 9.0+** and **Linux**.

## Usage

QuickSwiftCheck adds `sc_` variants to `it`, `fit`, `xit`, `to` and `toNot` functions, so that the original functions remain not overloaded. This means you can use `it` to create a regular test example and `to` to create a regular expectation:

```swift
it("integer addition is commutative") {
    expect(2 + 3).to(equal(3 + 2))
}
```

```swift
sc_it("integer addition is commutative") {
    forAll { (a: Int, b: Int) in
        expect(a + b).sc_to(equal(b + a))
    }
}
```

## Installation

### Xcode

In Xcode, select File → Add Packages and use the on-screen UI to search for the following Package URL:

```none
https://github.com/akashivskyy/quick-swift-check
```

### Swift Package Manager

If you're using [Swift Package Manager](https://github.com/apple/swift-package-manager), add the following dependency to your `Package.swift`:

```none
.package(url: "https://github.com/akashivskyy/quick-swift-check", from: "X.Y.Z"),
```

### CocoaPods

If you're using [CocoaPods](http://cocoapods.org), add the following dependency to your `Podfile`:

```none
pod 'QuickSwiftCheck', '~> X.Y.Z'
```

## Roadmap

#### Version 3.x

These minor releases will keep QuickSwiftCheck up-to-date with latest versions of Quick, Nimble, SwiftCheck and Swift itself.

## About

This project is made and maintained with ♡ by [Adrian Kashivskyy](https://github.com/akashivskyy).

### License

The project is licensed under the [MIT License](LICENSE.txt).
