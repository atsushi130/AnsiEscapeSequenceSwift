<p align="center">
    <h1 align="center">AnsiEscapeSequenceSwift</h1>
</p1>

<p align="center"><i>ANSI escape sequence wrapper for Swift.</i></p>

<p align="center">
    <a href=".license-mit"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

## Usage
Part of supported ANSI escape sequences:  
**bold**  
```swift
"hello, world".ansiEscaped(by: .bold) // "\033[1mhello, world\033[0m"
"hello, world".ansiEscaped(by: .bold, target: "hello") // "\033[1mhello\033[0m, world""
```

**colorize**
```swift
"hello, world".ansiEscaped(by: .white(type: .font), .red(type: .background)) // "hello, \033[37m\033[41mworld\033[0m"
```

**underline**
```swift
"hello, world".ansiEscaped(by: .underline) // "\033[4mhello, world\033[0m"
```

- [supported ANSI escape sequences](https://github.com/atsushi130/AnsiEscapeSequenceSwift/blob/master/Sources/AnsiEspaceSequenceSwift/AnsiEscapeSequence.swift#L14)

## via [Swift Package Manager](https://github.com/apple/swift-package-manager)
```swift
.package(url: "https://github.com/atsushi130/AnsiEscapeSequenceSwift", from: "1.0.0"),
```

## License
AnsiEscapeSequenceSwift is available under the MIT license. See the [LICENSE file](https://github.com/atsushi130/AnsiEscapeSequenceSwift/blob/master/license).
