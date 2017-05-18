import XCTest
@testable import TIS_100

struct MockParserDelegate: CommandParserDelegate {
    func index(for label: String) -> UInt? {
        return 0
    }
}

class CommandTests: XCTestCase {
    func testParsing() {
        let delegate = MockParserDelegate()
        XCTAssertEqual(Command.NOP, Command(with: "", delegate: delegate)!)
    }


    static var allTests = [
        ("testParsing", testParsing),
    ]
}
