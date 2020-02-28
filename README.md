# SwaggerKit
[![Build Status](https://github.com/almazrafi/SwaggerKit/workflows/CI/badge.svg?branch=master)](https://github.com/almazrafi/SwaggerKit/actions)
[![Codecov](https://codecov.io/gh/almazrafi/SwaggerKit/branch/master/graph/badge.svg)](https://codecov.io/gh/almazrafi/SwaggerKit)
[![Cocoapods](https://img.shields.io/cocoapods/v/SwaggerKit.svg?style=flat)](http://cocoapods.org/pods/SwaggerKit)
[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SPM compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Xcode](https://img.shields.io/badge/Xcode-10.3-blue.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![License](https://img.shields.io/github/license/almazrafi/SwaggerKit.svg)](https://opensource.org/licenses/MIT)

SwaggerKit is a parser for [OpenAPI (Swagger)](https://swagger.io/specification) specs, completely written in Swift.

## Requirements
- iOS 10.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
- Xcode 10.3+
- Swift 5.0+

## Installation

### CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:
```bash
$ gem install cocoapods
```

To integrate SwaggerKit into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SwaggerKit', '~> 1.0.0-alpha.3'
end
```

Finally run the following command:
```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:
```bash
$ brew update
$ brew install carthage
```

To integrate SwaggerKit into your Xcode project using Carthage, specify it in your `Cartfile`:
```ogdl
github "almazrafi/SwaggerKit"
```

Finally run `carthage update` to build the framework and drag the built `SwaggerKit.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate SwaggerKit into your Xcode project using Swift Package Manager, add the following as a dependency to your `Package.swift`:
```swift
.package(url: "https://github.com/almazrafi/SwaggerKit.git", from: "1.0.0-alpha.3")
```
and then specify `"SwaggerKit"` as a dependency of the Target in which you wish to use SwaggerKit.

Here's an example `Package.swift`:
```swift
// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "MyPackage",
    products: [
        .library(name: "MyPackage", targets: ["MyPackage"])
    ],
    dependencies: [
        .package(url: "https://github.com/almazrafi/SwaggerKit.git", from: "1.0.0-alpha.3")
    ],
    targets: [
        .target(name: "MyPackage", dependencies: ["SwaggerKit"])
    ]
)
```

## Communication
- If you need help, open an issue.
- If you found a bug, open an issue.
- If you have a feature request, open an issue.
- If you want to contribute, submit a pull request.

## License
SwaggerKit is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
