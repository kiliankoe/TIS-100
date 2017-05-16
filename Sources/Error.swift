/// Possible error values
///
/// - invalidArity: Wrong number of arguments specified
/// - invalidInstruction: The instruction is invalid (unknown opcode)
/// - invalidRegisterOrPort: The specified register or port could is invalid
/// - invalidLabel: The specified label is invalid
/// - invalidOffset: The specified jump offset is invalid
enum Error: Swift.Error {
    case invalidArity
    case invalidInstruction
    case invalidRegisterOrPort
    case invalidLabel
    case invalidOffset
}
