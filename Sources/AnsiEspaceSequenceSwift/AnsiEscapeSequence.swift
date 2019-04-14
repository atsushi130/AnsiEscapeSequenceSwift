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

public enum AnsiEscapeSequence {}
public extension AnsiEscapeSequence {
    public enum Attributed: Int, AnsiEscapeSequenceable {
        case reset = 0
        case bold
        case thin
        case italic
        case underline
        case slowBlink
        case rapidBlink
        case swapForegroundAndBackgroundColors
        case conceal
        case crossedOut
        
        var ansiEscapeSequence: String {
            return "\\e[\(self.rawValue)m"
        }
    }
}

public extension AnsiEscapeSequence {
    public enum Cursor: AnsiEscapeSequenceable {
        case up(n: Int)
        case down(n: Int)
        case right(n: Int)
        case left(n: Int)
        case beginningAndDown(n: Int)
        case beginningAndUp(n: Int)
        
        var n: Int {
            switch self {
            case let .up(n): return n
            case let .down(n): return n
            case let .right(n): return n
            case let .left(n): return n
            case let .beginningAndDown(n): return n
            case let .beginningAndUp(n): return n
            }
        }
        
        var mark: String {
            switch self {
            case .up: return "A"
            case .down: return "B"
            case .right: return "C"
            case .left: return "D"
            case .beginningAndDown: return "D"
            case .beginningAndUp: return "E"
            }
        }

        var ansiEscapeSequence: String {
            let n = self.n >= 1 ? self.n : 1
            return "\\033[\(n)\(self.mark)"
        }
    }
}

