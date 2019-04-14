
import Foundation
import AnsiEspaceSequenceSwift

print("hello, world".ansiEscaped(by: .underline, .green(type: .font), target: "hello").ansiEscaped(by: .bold, target: "world"))
