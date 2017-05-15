import XCTest
@testable import tis_100

class tis_100Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(tis_100().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
