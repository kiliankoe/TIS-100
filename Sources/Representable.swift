//protocol Readable {
//    func read() -> Int
//}
//
//protocol Writable {
//    func write(_ value: Int)
//}
//
//extension Int: Readable {
//    func read() -> Int {
//        return self
//    }
//}
//
//extension Port: Readable, Writable {
//    func read() -> Int {
//        return 0 // FIXME
//    }
//
//    func write(_ value: Int) {
//        // FIXME
//    }
//}

protocol SourceRepresentable {}

protocol DestinationRepresentable {}

extension Int: SourceRepresentable {}

extension String {
    var asSource: SourceRepresentable? {
        if let register = Register(rawValue: self) {
            return register
        } else if let port = Port(rawValue: self) {
            return port
        } else if let val = Int(self) {
            return val
        }
        return nil
    }

    var asDestination: DestinationRepresentable? {
        if let register = Register(rawValue: self) {
            return register
        } else if let port = Port(rawValue: self) {
            return port
        }
        return nil
    }
}
