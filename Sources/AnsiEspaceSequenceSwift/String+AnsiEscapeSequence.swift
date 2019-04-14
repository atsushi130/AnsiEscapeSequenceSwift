//
//  String+AnsiEscapeSequence.swift
//  AnsiEscapeSequenceSwift
//
//  Created by Atsushi Miyake on 2019/04/14.
//

extension String {
    
    func addResetAnsiEscapeSequence() -> String {
        return self + AnsiEscapeSequence.reset.ansiEscapeSequence
    }
    
    func ansiEscaped(by ansiEscapeSequence: [AnsiEscapeSequenceable], target: String?) -> String {
        let ansiEscapeSequence = ansiEscapeSequence
            .map { $0.ansiEscapeSequence }
            .joined(separator: "")
        if let target = target {
            let ansiEscaped = (ansiEscapeSequence + target).addResetAnsiEscapeSequence()
            return self.replacingOccurrences(of: target, with: ansiEscaped)
        } else {
            return (ansiEscapeSequence + self).addResetAnsiEscapeSequence()
        }
    }

    public func ansiEscaped(by ansiEscapeSequence: AnsiEscapeSequence..., target: String? = nil) -> String {
        return self.ansiEscaped(by: ansiEscapeSequence, target: target)
    }
    
    public func ansiEscaped(by ansiEscapeSequence: String..., target: String? = nil) -> String {
        return self.ansiEscaped(by: ansiEscapeSequence, target: target)
    }
}

extension String: AnsiEscapeSequenceable {
    var ansiEscapeSequence: String {
        return self
    }
}
