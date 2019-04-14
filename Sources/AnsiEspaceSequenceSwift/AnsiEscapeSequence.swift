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
    case carriageReturn
    case movePoint(x: Int,  y: Int)
    
    // Display
    case scrollNext(line: Int)
    case scrollPrev(line: Int)
    case erasure(type: ErasureType)

    // Colorize
    case black(type: ColorType)
    case red(type: ColorType)
    case green(type: ColorType)
    case yellow(type: ColorType)
    case blue(type: ColorType)
    case magenta(type: ColorType)
    case cyan(type: ColorType)
    case white(type: ColorType)
    case rgb(r: Int, g: Int, b: Int, type: ColorType)
    
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
        case .carriageReturn:
            return "\\033[r"
        case let .movePoint(x, y):
            return "\\033[\(x >= 1 ? x : 1);\(y >= 1 ? y : 1)f"
            
        // Display
        case let .scrollNext(line):
            return "\\033[\(line >= 1 ? line : 1)S"
        case let .scrollPrev(line):
            return "\\033[\(line >= 1 ? line : 1)T"
        case let .erasure(type):
            return type.ansiEscapedSequence
            
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
        case let .rgb(r, g, b, type):
            switch type {
            case .font:
                return "\\033;2;\(r);\(g);\(b)m"
            case .background:
                return "\\033[48;2;\(r);\(g);\(b)m"
            }
        }
    }
}

public extension AnsiEscapeSequence {
    public enum ColorType {
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

public extension AnsiEscapeSequence {
    public enum ErasureType: Int {
        case backward = 0
        case forward
        case all
        
        var ansiEscapedSequence: String {
            return "\033[\(self.rawValue)J"
        }
    }
}
