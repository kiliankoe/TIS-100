protocol Readable {
    func read() -> Int
}

protocol Writable {
    func write(_ value: Int)
}

extension Int: Readable {
    func read() -> Int {
        return self
    }
}

extension Port: Readable, Writable {
    func read() -> Int {
        return 0 // FIXME
    }

    func write(_ value: Int) {
        // FIXME
    }
}
