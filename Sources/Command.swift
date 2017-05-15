enum Command {
    case NOP
    case MOV(src: Readable, dst: Writable)
    case SWP
    case SAV
    case ADD(src: Readable)
    case SUB(src: Readable)
    case NEG
    case JMP(label: Label)
    case JEZ(label: Label)
    case JNZ(label: Label)
    case JGZ(label: Label)
    case JLZ(label: Label)
    case JRO(src: Readable)
}
