//
//  AnsiEscapeSequence.swift
//  AnsiEspaceSequenceSwift
//
//  Created by Atsushi Miyake on 2019/04/14.
//

import Foundation

protocol AnsiEscapeSequenceable {
    var ansiEscapeSequence: String { get }
}

public enum AnsiEscapeSequence: AnsiEscapeSequenceable {
    
    // Attributed
    case reset
    case bold
    case thin
    case italic
    case underline
    case slowBlink
    case rapidBlink
    case swapForegroundAndBackgroundColors
    case conceal
    case crossedOut
    
    // Cursor
    case up(n: Int)
    case down(n: Int)
    case right(n: Int)
    case left(n: Int)
    case beginningAndDown(n: Int)
    case beginningAndUp(n: Int)
    
    // Colorize
    case black(type: AnsiEscapeSequence.ColorType)
    case red(type: AnsiEscapeSequence.ColorType)
    case green(type: AnsiEscapeSequence.ColorType)
    case yellow(type: AnsiEscapeSequence.ColorType)
    case blue(type: AnsiEscapeSequence.ColorType)
    case magenta(type: AnsiEscapeSequence.ColorType)
    case cyan(type: AnsiEscapeSequence.ColorType)
    case white(type: AnsiEscapeSequence.ColorType)
    
    var ansiEscapeSequence: String {
        switch self {
        // Attributed
        case .reset:
            return "\\033[0m"
        case .bold:
            return "\\033[1m"
        case .thin:
            return "\\033[2m"
        case .italic:
            return "\\033[3m"
        case .underline:
            return "\\033[4m"
        case .slowBlink:
            return "\\033[5m"
        case .rapidBlink:
            return "\\033[6m"
        case .swapForegroundAndBackgroundColors:
            return "\\033[7m"
        case .conceal:
            return "\\033[8m"
        case .crossedOut:
            return "\\033[9m"
        
        // Cursor
        case let .up(n):
            return "\\033[\(n >= 1 ? n : 1)A"
        case let .down(n):
            return "\\033[\(n >= 1 ? n : 1)B"
        case let .right(n):
            return "\\033[\(n >= 1 ? n : 1)C"
        case let .left(n):
            return "\\033[\(n >= 1 ? n : 1)D"
        case let .beginningAndDown(n):
            return "\\033[\(n >= 1 ? n : 1)E"
        case let .beginningAndUp(n):
            return "\\033[\(n >= 1 ? n : 1)F"
            
        // Colorize
        case let .black(type):
            return type.ansiEscaped(for: 30)
        case let .red(type):
            return type.ansiEscaped(for: 31)
        case let .green(type):
            return type.ansiEscaped(for: 32)
        case let .yellow(type):
            return type.ansiEscaped(for: 33)
        case let .blue(type):
            return type.ansiEscaped(for: 34)
        case let .magenta(type):
            return type.ansiEscaped(for: 35)
        case let .cyan(type):
            return type.ansiEscaped(for: 36)
        case let .white(type):
            return type.ansiEscaped(for: 37)
        }
    }
}

public extension AnsiEscapeSequence {
    enum ColorType {
        case font
        case background
        
        func ansiEscaped(for n: Int) -> String {
            switch self {
            case .font:
                return "\\033[\(n)m"
            case .background:
                return "\\033[\(n + 10)m"
            }
        }
    }
}
