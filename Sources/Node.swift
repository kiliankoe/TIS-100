class Node {
    /// Instruction Pointer
    let IP: UInt = 0
    let ACC: Int = 0
    private let BAK: Int = 0
    let ports: [Port]
    let commands: [Command]

    init(ports: [Port], commands: [Command]) {
        self.ports = ports
        self.commands = commands
    }

    func execute() {
        
    }
}
