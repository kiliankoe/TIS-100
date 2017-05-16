import Foundation

enum Command {
    case NOP
    case MOV(src: SourceRepresentable, dst: DestinationRepresentable)
    case SWP
    case SAV
    case ADD(src: SourceRepresentable)
    case SUB(src: SourceRepresentable)
    case NEG
    case JMP(label: Label)
    case JEZ(label: Label)
    case JNZ(label: Label)
    case JGZ(label: Label)
    case JLZ(label: Label)
    case JRO(src: SourceRepresentable)

    init?(with line: String, delegate: CommandParserDelegate) throws {
        // TODO: This doesn't yet support same line labels

        guard !line.hasPrefix("#") else {
            // TODO: What about ## comments as debugger titles?
            return nil
        }

        var components = line
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: ",", with: "")
            .components(separatedBy: " ")
        let opCode = components.removeFirst()

        switch opCode {
        case "NOP": self = .NOP
        case "MOV":
            guard components.count == 2 else { throw Error.invalidArity }
            guard let source = components[0].asSource else { throw Error.invalidRegisterOrPort }
            guard let destination = components[1].asDestination else { throw Error.invalidRegisterOrPort }
            self = .MOV(src: source, dst: destination)
        case "SWP": self = .SWP
        case "SAV": self = .SAV
        case "ADD":
            guard components.count == 1 else { throw Error.invalidArity }
            guard let source = components[0].asSource else { throw Error.invalidRegisterOrPort }
            self = .ADD(src: source)
        case "SUB":
            guard components.count == 1 else { throw Error.invalidArity }
            guard let source = components[0].asSource else { throw Error.invalidRegisterOrPort }
            self = .SUB(src: source)
        case "NEG": self = .NEG
        case "JMP": self = .JMP(label: try parseWithLabel(components, delegate))
        case "JEZ": self = .JEZ(label: try parseWithLabel(components, delegate))
        case "JNZ": self = .JNZ(label: try parseWithLabel(components, delegate))
        case "JGZ": self = .JGZ(label: try parseWithLabel(components, delegate))
        case "JLZ": self = .JLZ(label: try parseWithLabel(components, delegate))
        case "JRO":
            guard components.count == 1 else { throw Error.invalidArity }
            guard let source = components[0].asSource else { throw Error.invalidRegisterOrPort }
            self = .JRO(src: source)
        default: throw Error.invalidInstruction
        }
    }
}

protocol CommandParserDelegate {
    func index(for label: String) -> UInt?
}

// MARK: - Helpers

func parseWithLabel(_ components: [String], _ delegate: CommandParserDelegate) throws -> Label {
    guard components.count == 1 else { throw Error.invalidArity }
    guard let idx = delegate.index(for: components[0]) else { throw Error.invalidLabel }
    return Label(idx: idx)
}
