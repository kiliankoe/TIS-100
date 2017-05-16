enum Register: String {
    case ACC, OUT, NIL
}

extension Register: SourceRepresentable, DestinationRepresentable {}
