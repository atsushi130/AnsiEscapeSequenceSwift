
import Foundation
import AnsiEspaceSequenceSwift

let ansiEscaped = "hello, world"
    .ansiEscaped(by: .underline, .green(type: .font), target: "hello")
    .ansiEscaped(by: .bold, target: "world")
print(ansiEscaped)
