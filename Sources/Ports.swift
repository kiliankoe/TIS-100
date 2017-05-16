enum Port: String {
    case LEFT, RIGHT, UP, DOWN, ANY, LAST
}

extension Port: SourceRepresentable, DestinationRepresentable {}

struct Ports {
    let LEFT: Node? // is a Node just a Readable/Writable type?
    let RIGHT: Node?
    let UP: Node?
    let DOWN: Node?
    var ANY: Node? {
        get {
            // return any existing node value
            // save node to LAST
            return LEFT
        }
    }
    let LAST: Node?
}
