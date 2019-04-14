
import Foundation
import AnsiEspaceSequenceSwift

let example1 = "hello, world".ansiEscaped(by: .bold) // "\033[1mhello, world\033[0m"
let example2 = "hello, world".ansiEscaped(by: .bold, target: "hello") // "\033[1mhello\033[0m, world""
let example3 = "hello, world".ansiEscaped(by: .white(type: .font), .red(type: .background)) // "hello, \033[37m\033[41mworld\033[0m"
let example4 = "hello, world".ansiEscaped(by: .underline) // "\033[4mhello, world\033[0m"

[example1, example2, example3, example4]
    .forEach { ansiEscaped in
        print(ansiEscaped)
    }
